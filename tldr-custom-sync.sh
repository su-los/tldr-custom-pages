#!/usr/bin/env bash
# tldr-custom-sync.sh
# 将自定义 tldr 页面同步到 tlrc 缓存目录
# 用法: ./tldr-custom-sync.sh [自定义目录路径]

# ── 配置 ──────────────────────────────────────────────────────────────
CUSTOM_DIR="${1:-$HOME/Codespace/Mkdown/tldr-custom-pages/pages.zh}"
CACHE_DIR="$HOME/Library/Caches/tlrc/pages.zh/common"
BACKUP_DIR="$HOME/.cache/tlrc/backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# ── 统计 ──────────────────────────────────────────────────────────────
count_ok=0
count_backup=0
count_invalid=0

# ── 前置检查 ──────────────────────────────────────────────────────────
if ! command -v tldr &>/dev/null; then
    echo "错误: 未找到 tldr 命令" >&2
    exit 1
fi

if [ ! -d "$CUSTOM_DIR" ]; then
    echo "错误: 自定义目录不存在: $CUSTOM_DIR" >&2
    exit 1
fi

mkdir -p "$CACHE_DIR"
mkdir -p "$BACKUP_DIR"

# ── 主逻辑 ──────────────────────────────────────────────────────────
echo "=== tldr 自定义页面同步 ==="
echo "来源: $CUSTOM_DIR"
echo "目标: $CACHE_DIR"
echo "备份: $BACKUP_DIR"
echo ""

shopt -s nullglob
md_files=("$CUSTOM_DIR"/*.md)

if [ ${#md_files[@]} -eq 0 ]; then
    echo "未找到任何 .md 文件，退出。"
    exit 0
fi

for f in "${md_files[@]}"; do
    filename=$(basename "$f")
    target="$CACHE_DIR/$filename"

    echo "────────────────────────────────────"
    echo "处理: $filename"

    # ── 步骤 1：用 tldr -r 检查合法性 ──────────────────────────────
    render_output=$(tldr -r "$f" 2>&1)
    render_exit=$?

    if [ $render_exit -ne 0 ]; then
        echo "  [SKIP] 格式检查失败（exit $render_exit）"
        echo "         原因: $render_output"
        count_invalid=$((count_invalid + 1))
        continue
    fi

    if [ -z "$render_output" ]; then
        echo "  [SKIP] 渲染输出为空，文件可能缺少有效内容"
        count_invalid=$((count_invalid + 1))
        continue
    fi

    echo "  [OK]   格式检查通过"

    # ── 步骤 2：冲突检测 + 备份 ────────────────────────────────────
    if [ -f "$target" ]; then
        backup_file="$BACKUP_DIR/${filename%.md}.${TIMESTAMP}.bak.md"
        if cp "$target" "$backup_file"; then
            echo "  [BAK]  已备份原文件 -> $(basename "$backup_file")"
            count_backup=$((count_backup + 1))
        else
            echo "  [SKIP] 备份失败，跳过该文件以防数据丢失: $filename" >&2
            count_invalid=$((count_invalid + 1))
            continue
        fi
    fi

    # ── 步骤 3：复制 ────────────────────────────────────────────────
    if cp "$f" "$target"; then
        echo "  [OK]   已同步到缓存"
        count_ok=$((count_ok + 1))
    else
        echo "  [FAIL] 复制失败: $filename" >&2
        count_invalid=$((count_invalid + 1))
    fi
done

echo ""
echo "════════════════════════════════════"
echo "完成: 成功 $count_ok 个 | 备份 $count_backup 个 | 跳过 $count_invalid 个"

if [ $count_invalid -gt 0 ]; then
    exit 1
fi
