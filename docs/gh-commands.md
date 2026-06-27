# GitHub 操作命令手册（场景 2 / 4：PR·Issue 管理 + 代码审查）

> 账号 `advancehs`，CLI 已通过 `gh auth login` 登录。所有命令在 WSL 终端直接运行。
> 把 `OWNER/REPO` 替换为目标仓库（本仓库为 `advancehs/githubcontrol`）。

---

## 一、分支与提交

```bash
# 新建并切换到工作分支
git checkout -b feat/your-feature

# 改完后一键提交推送（用本仓库脚本）
bash scripts/push.sh "feat: 描述你的改动"

# 或手动
git add -A && git commit -m "msg" && git push origin HEAD
```

## 二、PR 管理

```bash
# 从当前分支开 PR（交互式填标题/正文）
gh pr create --base main --head feat/your-feature \
  --title "标题" --body "正文"

# 列出所有打开的 PR
gh pr list

# 查看 PR #3 的详情 / diff / 评论
gh pr view 3
gh pr diff 3

# 合并 PR #3（merge / squash / rebase 三选一）
gh pr merge 3 --squash --delete-branch

# 关闭 / 重开
gh pr close 3
gh pr ready 3        # 标记 ready for review（从 draft 转正）
```

## 三、Issue 管理

```bash
# 新建 issue
gh issue create --title "标题" --body "正文"

# 列出 / 查看
gh issue list
gh issue view 7

# 加 label / 分配 / 关闭
gh issue edit 7 --add-label "bug" --add-assignee advancehs
gh issue close 7
gh issue comment 7 --body "已修复，见 PR #3"
```

> 首次用 label 前需仓库已有该 label：`gh label create bug --color D73A4A`

## 四、代码审查（场景 4）

```bash
# 拉取 PR #3 的 diff 到本地审查
gh pr checkout 3
gh pr diff 3 > /tmp/pr3.diff

# 在 Claude Code 里触发深度审查（基于当前 diff）
# 直接在 Claude Code 提示符输入:
#   /code-review
# 或带评论回写 PR:
#   /code-review --comment
```

`/code-review` 会扫描当前工作区 diff，按 low/medium/high 力度报告正确性 bug 与可简化项；
`--comment` 把发现以行内评论发回 PR，`--fix` 直接把修复应用到工作区。

## 五、仓库与同步

```bash
# 查看仓库信息
gh repo view advancehs/githubcontrol

# 克隆其他仓库
gh repo clone OWNER/REPO

# 强制同步本地到远程最新（丢弃本地未提交改动，慎用）
git fetch origin && git reset --hard origin/main
```
