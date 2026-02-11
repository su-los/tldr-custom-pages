# nap

> 终端代码片段管理器。
> 用于快速保存、组织和检索常用代码片段，所有数据本地存储。

# 保存片段

- 从 stdin 或文件保存（指定路径/语言）：

`cat main.go | nap Go/boilerplate.go`

- 从命令输出保存：

`curl https://example.com/script.sh | nap Notes/example.sh`

- 从 GitHub Gist 保存：

`gh gist view <gist-id> | nap`

# 检索片段

- 交互式模糊搜索并输出：

`nap fuzzy`

- 直接获取指定片段并输出到文件：

`nap Go/boilerplate.go > main.go`

- 复制指定片段到剪贴板（macOS）：

`nap Go/boilerplate.go | pbcopy`

- 复制指定片段到剪贴板（Linux，X11）：

`nap Go/boilerplate.go | xclip -selection clipboard`

- 复制指定片段到剪贴板（跨平台，使用自定义 copy 函数）：

`nap Go/boilerplate.go | copy`

- 列出所有片段：

`nap list`

- 与 gum 结合实现交互式选择：

`nap $(nap list | gum filter)`
