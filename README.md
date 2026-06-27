# githubcontrol

GitHub 自动化控制中心。承载四类自动化的脚本与配置：

- **提交 / 推送** — commit + push 工作流
- **PR / Issue 管理** — 建分支、开 PR、打 label、关 issue
- **定时备份 / 同步** — 定时把指定目录提交并推送
- **代码审查** — 拉取 PR diff 并触发 `/code-review`

## 安全约定

- 所有凭证由 `gh` keyring 或本地环境变量管理，**绝不提交到仓库**。
- `.gitignore` 已排除 `.env`、`*token*`、`*.key`、`credentials*` 等。
- 提交前请自查是否有敏感内容。

