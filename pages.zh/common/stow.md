# stow

> GNU Stow 是一个轻量级的符号链接管理工具，主要用于管理软件包的安装和配置文件（dotfiles）。它通过创建符号链接，文件组织到统一的目录结构中，方便用户管理和维护。

> Stow 通过在 stow 目录中创建与目标目录镜像的文件结构，然后用符号链接将其链接到目标位置（默认为父目录，即 ~）。

> More information: <https://github.com/aspiers/stow>.

# 安装

- MacOS: `brew install stow`
- Linux: `sudo apt install stow` (Debian/Ubuntu)

# 目录规范

> 在根目录下创建 `~/dotfiles` 目录，并在其中创建子目录来存放不同的软件包或配置文件。例如在 `~/dotfiles` 目录下创建 `zsh/.zshrc` 以及 `zsh/.zshenv` 目录来存放 zsh 的配置文件。

> stow 会通过创建符号链接将 `~/dotfiles/zsh/.zshrc` 链接到 `~/.zshrc`，以及将 `~/dotfiles/zsh/.zshenv` 链接到 `~/.zshenv`。

> `.stow-local-ignore` 文件可以用来指定 stow 在链接时忽略的文件或目录。例如，如果你不想链接 `zsh/.zshenv`，可以在 `~/dotfiles/.stow-local-ignore` 文件中添加以下内容：`\.zshenv$`，这样 stow 就会忽略 `zsh/.zshenv` 文件，不会创建符号链接。

# 配合 git

> 初始化: `cd ~/dotfiles` 后，使用 `git init` 初始化 git 仓库，然后将配置文件添加到 git 仓库中进行版本控制: `git remote add origin https://github.com/yourname/dotfiles.git`

> 在新机器上部署: `git clone https://github.com/yourname/dotfiles.git ~/dotfiles`, 然后进入 `~/dotfiles` 目录，使用 `stow zsh` 命令链接 zsh 配置文件到 home 目录。

# 基本命令

- `stow zsh [git] [...]` 链接 package
- `stow */` 链接所有 package
- `stow -n -v zsh` 预览（不实际执行，--simulate 或 -n）
- `stow -D zsh` 取消链接 package（不删除文件）
- `stow -R zsh` 重新链接 package（先删链接再建链接）,用于更新配置文件后重新链接
