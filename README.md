# KMP 字符串匹配算法



[![Build Status](https://img.shields.io/github/actions/workflow/status/CGaaaaaa/KMP/ci.yml)](https://github.com/CGaaaaaa/KMP/actions) [![codecov](https://codecov.io/gh/CGaaaaaa/KMP/branch/main/graph/badge.svg)](https://codecov.io/gh/CGaaaaaa/KMP) 

**简体中文** | [English](README_EN.md)

KMP (Knuth-Morris-Pratt) 字符串匹配算法的 MoonBit 实现，具有完整的测试覆盖率和高性能。

## ✨ 特性

- 🚀 高效的 KMP 字符串匹配算法实现
- 📊 98.78% 的代码覆盖率
- 🧪 完整的单元测试套件 (15个测试用例)
- 📝 详细的中文注释和文档
- 🔧 支持多种匹配模式：查找所有匹配、首次匹配、存在性检查

## 🚀 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/CGaaaaaa/KMP.git
cd KMP

# 运行测试
moon test

# 生成覆盖率报告
moon test --enable-coverage
moon coverage report -f html
```

### 使用示例

```moonbit
// 查找所有匹配位置
let matches = kmp_search("ABABDABACDABABCABAB", "ABABCABAB")
// 结果: [10]

// 查找首次匹配位置
let first = find_first("ABABDABACDABABCABAB", "ABABCABAB")
// 结果: 10

// 检查是否包含模式
let contains = contains_pattern("ABABDABACDABABCABAB", "ABABCABAB")
// 结果: true
```

## 📊 测试覆盖率

本项目维持着高质量的测试覆盖率：

- **总覆盖率**: 98.78% (97/98 行)
- **测试用例**: 15 个
- **覆盖场景**: 包括边界情况、错误处理、性能测试等

查看详细覆盖率报告：`_coverage/index.html`

## 🛠️ 开发

```bash
# 运行所有测试
moon test

# 启用覆盖率的测试
moon test --enable-coverage

# 生成不同格式的覆盖率报告
moon coverage report -f html      # HTML报告
moon coverage report -f summary   # 终端摘要
moon coverage report -f cobertura # XML报告
```

## 📝 API 文档

### 核心函数

- `kmp_search(text: String, pattern: String) -> Array[Int]` - 查找所有匹配位置
- `find_first(text: String, pattern: String) -> Int` - 查找首次匹配位置
- `contains_pattern(text: String, pattern: String) -> Bool` - 检查是否包含模式
- `build_failure_table(pattern: String) -> Array[Int]` - 构建KMP失效函数表

### 算法复杂度

- **时间复杂度**: O(n + m)，其中 n 是文本长度，m 是模式长度
- **空间复杂度**: O(m)，用于存储失效函数表
- **预处理**: O(m) 构建失效函数表
- **搜索**: O(n) 扫描文本

## 🔍 算法详解

KMP算法使用失效函数（也称为部分匹配表）来避免在不匹配时进行不必要的字符比较，这使得它比朴素字符串匹配算法更高效。

### 关键组件

1. **失效函数构建**: 构建一个表，指示在不匹配时可以跳过多少个字符
2. **模式匹配**: 使用失效函数高效地搜索文本
3. **多重匹配支持**: 可以找到所有出现位置，而不仅仅是第一个

## 🧪 测试

项目包含全面的测试，涵盖：

- ✅ 基本功能测试
- ✅ 边界情况（空字符串、单字符）
- ✅ 多重匹配场景
- ✅ 性能验证
- ✅ 错误处理

运行测试：
```bash
moon test --enable-coverage
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。