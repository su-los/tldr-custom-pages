# tmux

> Terminal multiplexer.
> It allows multiple sessions with windows, panes, and more.
> See also: zellij, screen.
> More information: <https://github.com/tmux/tmux>.

- 创建一个新的 session:

`tmux`

- 创建一个新的 session，并指定名称：

`tmux new-session -s name`

- 列出已经存在的 sessions:

`tmux list-sessions`

- 捕获最近使用的 session:

`tmux attach`

- 捕获指定名称的 session:

`tmux attach -t [name]`

- 释放某个 session:

`tmux kill-session -t [name]`

# session 内操作

- 退出当前 session:

`<Ctrl b><d>`

- 创建一个新窗口:

`<Ctrl b><c>`

- 是否一个新窗口:

`<Ctrl b><x>`

- 重命名一个新窗口:

`<Ctrl b><,>`

- 在 sessions 跟 windows 之间切换:

`<Ctrl b><w>`
