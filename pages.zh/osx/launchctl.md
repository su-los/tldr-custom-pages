# launchctl

> macOS 服务管理工具，用于加载、卸载和控制 LaunchAgents/LaunchDaemons。
> 适用于 macOS 16+ (Darwin 25+)。

# 核心概念

> launchctl 的 Domain（域）是指 launchd 服务的运行范围和上下文。主要包括：

> - gui/<uid>/[服务名称]: 当前用户 GUI 会话域，对应 `~/Library/LaunchAgents/`（用户级 Agent，需图形会话）
> - user/<uid>/[服务名称]: 用户级后台域，对应 `/Library/LaunchAgents/`（对所有用户生效，无需 GUI）
> - system/[服务名称]: 系统级，对应 `/Library/LaunchDaemons/`，对所有用户生效，系统启动时加载
> - session/<asid>/[服务名称]: 会话域
> - pid/<pid>/[服务名称]: 针对特定进程，只有拥有该域的进程才能修改其中的服务

# 列出域信息

- 列出当前会话所有已加载的 job（含 PID 和退出码）：`launchctl list`
- 查找特定 job：`launchctl list | grep [label]`
- 打印用户 GUI 域服务列表：`launchctl print gui/$(id -u)`
- 打印系统域服务列表：`launchctl print system`
- 查看某个服务的完整信息（状态、PID、退出码、触发器等）：`launchctl print gui/$(id -u)/[service-label]`

# 加载和卸载服务

- 加载用户 LaunchAgent（GUI 域）：`launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.example.agent.plist`
- 加载系统 LaunchDaemon（需 sudo）：`sudo launchctl bootstrap system /Library/LaunchDaemons/com.example.daemon.plist`
- 卸载服务（通过 plist 路径）：`launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.example.agent.plist`
- 卸载服务（通过 service-target）：`launchctl bootout gui/$(id -u)/[service-label]`

> 系统级服务需要使用 `sudo` 权限来加载和卸载。

# 启动和停止服务

- 启动 job（已注册状态下）：`launchctl start [service-label]`
- 停止 job（保持注册状态）：`launchctl stop [service-label]`
- kickstart 启动服务：`launchctl kickstart gui/$(id -u)/[service-label]`
- 强制 kill 后立即重启：`launchctl kickstart -k gui/$(id -u)/[service-label]`
- 发送信号给服务：`launchctl signal SIGTERM gui/$(id -u)/[service-label]`

# 启用和禁用服务

- 启用服务（允许自动启动）：`launchctl enable gui/$(id -u)/[service-label]`
- 禁用（重启后不再自动启动）：`launchctl disable gui/$(id -u)/[service-label]`
- 查看某域禁用服务列表：`launchctl print-disabled gui/$(id -u)`

# 故障排除

- 验证 plist 语法：`plutil -lint [plist路径]`
- 查看 launchd 自身日志（加载/卸载/报错事件）：`log show --last 30m --predicate 'process == "launchd"' 2>&1 | grep [service-label]`
- 实时流式查看服务自身日志：`log stream --predicate 'process == "[process-name]"'`
- macOS 13+ 新增安全限制：新 LaunchAgent 首次加载后需在「系统设置 → 通用 → 登录项与扩展」中授权，否则定时任务不会触发
