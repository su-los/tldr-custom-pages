# rtk

> 官网: https://github.com/rtk-ai/rtk
> 压缩命令输出（比如通过 Git hooks 拦截 Git 命令,筛选输出）,减少 Token 消耗

# 命令速查

- `rtk init -g` 初始化并注册拦截钩子,默认初始化 Claude Code 的工具钩子

> - `--gemini` 初始化 Gemini 的工具钩子
> - `--codex` 初始化 Codex 的工具钩子
> - `--agent cursor` 初始化 Cursor 的工具钩子

- `rtk gain` 查看当前 Token 节省情况
- `rtk ls .` 优化当前目录下的命令输出
- `rtk read main.rs` 优化 main.rs 的内容输出
- `rtk git status` 优化 `git status` 的输出
- `rtk git diff` 优化 `git diff` 的输出
- `rtk test cargo test` 优化 `cargo test` 的输出
- `rtk discover` 发现当前环境中可优化的命令输出
