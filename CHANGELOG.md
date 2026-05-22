# Changelog

## [0.1.6] - 2026-05-22

- Docker Compose 示例显式设置项目名为 `guko`，避免部署目录名影响管理面板显示。
- 更新 README 部署说明，说明 Compose project name 会固定显示为 `guko`。

## [0.1.5] - 2026-05-20

- 修正文档中的安全表述，补充 Issue 模板，并完善 Release 附件。

## [0.1.4] - 2026-05-20

- 加入基础 CI、防泄密检查、Actions Node24 兼容设置和本地项目健康检查。

## [0.1.3] - 2026-05-20

- 补齐中英双语 README、统一部署说明，并加入本地 release helper。

All notable changes to this project are documented here.

## [0.1.2] - 2026-05-19

- 修复 Release workflow YAML，确保 tag 发布会自动用 CHANGELOG 生成 Release notes。

## [0.1.1] - 2026-05-19

- 维护版本发布流程：新增 CHANGELOG 与 Release Drafter；Docker 发布保留 latest、版本号和 sha 标签。
