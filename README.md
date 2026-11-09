# workbuddy-skills

WorkBuddy 自定义技能同步仓库。跨设备（Mac / Windows）安装同一套技能。

## 一键安装

**Windows（PowerShell）：**

```powershell
iwr https://raw.githubusercontent.com/gaog0734-hash/workbuddy-skills/main/install-skills.ps1 -OutFile install-skills.ps1
.\install-skills.ps1
```

**macOS / Linux：**

```bash
curl -sSL https://raw.githubusercontent.com/gaog0734-hash/workbuddy-skills/main/install-skills.sh | bash
```

安装完成后重启 WorkBuddy 生效。

## 技能清单（9 个）

| 技能 | 用途 | 来源 |
|---|---|---|
| self-improving-agent | 捕捉学习/纠错，持续自我改进 | AI-leowsir/openclaw-all |
| proactive-agent | 主动式智能体行为模式 | sundial-org/awesome-openclaw-skills |
| find-skills | 发现并推荐可安装技能 | sundial-org/awesome-openclaw-skills |
| agent-browser | 无头浏览器自动化 CLI | sundial-org/awesome-openclaw-skills |
| skill-vetter | 技能安装前安全审查 | sundial-org/awesome-openclaw-skills |
| ontology | 类型化知识图谱记忆 | sundial-org/awesome-openclaw-skills |
| humanizer | 去除 AI 味文本 | sundial-org/awesome-openclaw-skills |
| web-tools-guide | Web 工具策略指南 | AI-leowsir/openclaw-all |
| dev-expert-pro | 编程专家 Pro（调试/重构/架构） | guoqinchen/myskills |

## 新增技能

编辑 `install-skills.ps1` / `install-skills.sh`，在对应循环里加上技能目录名和源仓库地址即可。
