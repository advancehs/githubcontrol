# 定时备份计划（场景 3）

**当前状态：⏸️ 暂未配置**（用户决定先交付场景 1/2/4，备份延后）

## 已确认的启用偏好

| 项 | 决定 | 说明 |
|---|---|---|
| 仓库可见性 | **Private**（新建独立仓库） | 与 `githubcontrol`(public) 分离；未发表论文公开会引发原创性争议，数据可能含敏感信息 |
| 频率 | **每周一次** | — |
| 运行方式 | 待定 | CronCreate（每周，7 天后过期需续期）vs WSL 系统 crontab（持久）二选一 |

## 备份目标（待确认具体路径）

- ✅ 论文主文件：`/mnt/c/Users/WINDOWS/Desktop/paper_latest_topjournal.tex`
- ⚠️ 代码目录 `code_last/`：尚未定位（6 层内未找到，需用户确认实际路径）

## 启用步骤（届时执行）

告诉 Claude **"启用备份"** 并确认要备份的目录，将自动：

1. `gh repo create advancehs/<备份仓库名> --private` 新建私有仓库
2. 写 `scripts/backup.sh`：自动 `git add -A → commit → push` 指定目录
3. 配置定时任务（CronCreate 每周 / 系统 crontab）
4. 复用 `push.sh` 的 `.gitignore` 安全约定
