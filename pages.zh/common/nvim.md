# nvim

> More information: <https://www.lazyvim.org/>.

# 通用

- `<leader>cd` 展开当前行的错误信息
- `<leader>cy` 复制当前行的错误信息

# json

- `<leader>cf` 格式化当前文件
- `K` hover 查看 schema 文档
- `gd` / `gr` 跳转定义/引用

# copilot — 内联补全

- `<C-l>` 接受整条建议
- `<C-Right>` 接受一个词
- `<C-e>` 关闭建议
- `<M-]>` / `<M-[>` 切换下/上条建议

# copilot — chat

- `<leader>ac` 打开/关闭 Chat 窗口
- `<leader>ae` 解释选中代码（normal/visual）
- `<leader>af` 修复选中代码（normal/visual）
- `<leader>ar` Review 选中代码（normal/visual）
- `<leader>at` 为选中代码生成测试（normal/visual）

# copilot — chat (LazyVim 内置快捷键)

- `<leader>aa` 打开/关闭 Chat 窗口（同 `<leader>ac`）
- `<leader>aq` 快速提问（弹出输入框）
- `<leader>ap` 选择预设 Prompt
- `<leader>ax` 清空当前对话
- `<leader>ay` 将 Chat 中的代码 Apply 到原文件（仅在 Chat 窗口内生效）

# avante — inline 编辑

- `<leader>ve` 对选中代码进行 inline 编辑（类 Cursor Ctrl+K，主功能）
- `<leader>va` 向 AI 提问
- `<leader>vt` 切换 avante 侧边栏
- `<leader>vr` 刷新当前会话
- `<leader>vf` 聚焦侧边栏
- `<leader>vc` 将当前文件加入 avante 上下文
- `co` 接受自己的版本（diff 视图中）
- `ct` 接受 AI 版本（diff 视图中）
- `]x` / `[x` 跳转下/上个 diff hunk

# fff — 文件查找器（替换 snacks 同名键位）

- `<leader>ff` 模糊文件查找（fff.nvim，基于 LazyVim 项目根，带 frecency 学习）
- `<leader>sg` live grep（fff.nvim，基于 LazyVim 项目根）
- `<S-Tab>` 在 grep picker 中切换模式：plain / regex / fuzzy
- `<Tab>` 多选，`<C-q>` 发送到 quickfix
- `<C-s>` 横分打开，`<C-v>` 竖分打开，`<C-t>` 新 tab 打开
- `<C-u>` / `<C-d>` 预览滚动
- 其他 `<leader>f*` / `<leader>s*` 键位保持 snacks.picker（LSP/buffer/help/git/diagnostics 等）
