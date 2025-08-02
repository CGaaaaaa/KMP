# GitHub 上传指南

## 📋 上传到GitHub前的准备清单

### ✅ 已完成的文件
- [x] `README.md` - 包含GitHub徽章的完整文档
- [x] `LICENSE` - MIT许可证文件
- [x] `.gitignore` - 忽略不必要的文件
- [x] `.github/workflows/ci.yml` - GitHub Actions CI配置
- [x] `coverage.xml` - 代码覆盖率报告
- [x] 完整的源代码和测试

## 🚀 上传步骤

### 1. 在GitHub上创建新仓库
1. 访问 https://github.com/new
2. 仓库名称：`KMP`
3. 描述：`KMP (Knuth-Morris-Pratt) String Matching Algorithm in MoonBit`
4. 选择 Public
5. **不要**初始化 README、.gitignore 或 LICENSE（我们已经有了）

### 2. 上传代码
```bash
# 初始化Git仓库（如果还没有的话）
git init

# 添加GitHub远程仓库（替换YOUR_USERNAME为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/KMP.git

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: KMP algorithm with 98.78% test coverage"

# 推送到GitHub
git push -u origin main
```

### 3. 更新README中的链接
上传后，需要将README.md中的 `YOUR_USERNAME` 替换为你的实际GitHub用户名：

```markdown
# 将这些链接中的 YOUR_USERNAME 替换为你的GitHub用户名
[![Build Status](https://img.shields.io/github/actions/workflow/status/YOUR_USERNAME/KMP/ci.yml)](https://github.com/YOUR_USERNAME/KMP/actions)
[![codecov](https://codecov.io/gh/YOUR_USERNAME/KMP/branch/main/graph/badge.svg)](https://codecov.io/gh/YOUR_USERNAME/KMP)
```

### 4. 设置Codecov（可选但推荐）
1. 访问 https://codecov.io/
2. 使用GitHub账号登录
3. 添加你的KMP仓库
4. 获取Codecov token（如果需要私有仓库）

### 5. 验证GitHub Actions
- 上传后，GitHub Actions会自动运行
- 检查 `Actions` 标签页确认CI通过
- 构建状态徽章会自动更新

## 🎯 上传后的效果

你的GitHub仓库将显示：
- ✅ 专业的README与状态徽章
- ✅ 自动化的CI/CD流水线
- ✅ 代码覆盖率报告
- ✅ 完整的开源项目结构

## 📝 注意事项

1. **分支名称**：确保使用 `main` 作为主分支名
2. **用户名替换**：记得更新README中的所有 `YOUR_USERNAME`
3. **首次推送**：可能需要设置Git用户信息：
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

## 🔧 如果遇到问题

- **推送失败**：可能需要先 `git pull origin main --allow-unrelated-histories`
- **Actions失败**：检查MoonBit setup action是否正确
- **徽章不显示**：等待几分钟让GitHub Actions完成第一次运行

完成这些步骤后，你就有了一个专业的开源KMP算法项目！🎉