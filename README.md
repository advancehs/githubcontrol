# githubcontrol

GitHub 自动化控制中心。承载四类自动化的脚本与配置：

- **提交 / 推送** — commit + push 工作流 ✅
- **PR / Issue 管理** — 建分支、开 PR、打 label、关 issue ✅
- **定时备份 / 同步** — 定时把指定目录提交并推送 ⏸️ 暂缓（见 `docs/backup-plan.md`）
- **代码审查** — 拉取 PR diff 并触发 `/code-review` ✅

## 结构

```
githubcontrol/
├── scripts/
│   └── push.sh            # 一键提交推送（场景1）
├── docs/
│   ├── gh-commands.md     # PR / Issue / code review 命令手册（场景2/4）
│   └── backup-plan.md     # 定时备份计划（场景3，暂缓）
├── .gitignore             # 严格排除凭证/密钥/缓存
└── README.md
```

## 快速使用

```bash
bash scripts/push.sh "feat: 你的改动说明"   # 一键提交推送
cat docs/gh-commands.md                     # PR / Issue / code review 命令
```

## 安全约定

- 所有凭证由 `gh` keyring 或本地环境变量管理，**绝不提交到仓库**。
- `.gitignore` 已排除 `.env`、`*token*`、`*.key`、`credentials*` 等。
- 提交前请自查是否有敏感内容（`push.sh` 会先打印待提交清单）。

