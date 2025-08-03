# KMP String Matching Algorithm


[![Build Status](https://img.shields.io/github/actions/workflow/status/CGaaaaaa/KMP/ci.yml)](https://github.com/CGaaaaaa/KMP/actions) [![codecov](https://codecov.io/gh/CGaaaaaa/KMP/branch/main/graph/badge.svg)](https://codecov.io/gh/CGaaaaaa/KMP) 

[简体中文](README.md) | **English**

A high-performance implementation of the KMP (Knuth-Morris-Pratt) string matching algorithm in MoonBit with comprehensive test coverage.

## ✨ Features

- 🚀 Efficient KMP string matching algorithm implementation
- 📊 98.78% code coverage
- 🧪 Comprehensive test suite (15 test cases)
- 📝 Detailed documentation and comments
- 🔧 Multiple matching modes: find all matches, first match, existence check

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/CGaaaaaa/KMP.git
cd KMP

# Run tests
moon test

# Generate coverage report
moon test --enable-coverage
moon coverage report -f html
```

### Usage Examples

```moonbit
// Find all match positions
let matches = kmp_search("ABABDABACDABABCABAB", "ABABCABAB")
// Result: [10]

// Find first match position
let first = find_first("ABABDABACDABABCABAB", "ABABCABAB")
// Result: 10

// Check if pattern exists
let contains = contains_pattern("ABABDABACDABABCABAB", "ABABCABAB")
// Result: true
```

## 📊 Test Coverage

This project maintains high-quality test coverage:

- **Total Coverage**: 98.78% (97/98 lines)
- **Test Cases**: 15 tests
- **Coverage Scenarios**: Including edge cases, error handling, performance tests

View detailed coverage report: `_coverage/index.html`

## 🛠️ Development

```bash
# Run all tests
moon test

# Run tests with coverage
moon test --enable-coverage

# Generate different format coverage reports
moon coverage report -f html      # HTML report
moon coverage report -f summary   # Terminal summary
moon coverage report -f cobertura # XML report
```

## 📝 API Documentation

### Core Functions

- `kmp_search(text: String, pattern: String) -> Array[Int]` - Find all match positions
- `find_first(text: String, pattern: String) -> Int` - Find first match position
- `contains_pattern(text: String, pattern: String) -> Bool` - Check if pattern exists
- `build_failure_table(pattern: String) -> Array[Int]` - Build KMP failure function table

### Algorithm Complexity

- **Time Complexity**: O(n + m) where n is text length, m is pattern length
- **Space Complexity**: O(m) for the failure function table
- **Preprocessing**: O(m) to build the failure table
- **Searching**: O(n) to scan through the text

## 🔍 Algorithm Details

The KMP algorithm uses a failure function (also called partial match table) to avoid unnecessary character comparisons when a mismatch occurs. This makes it more efficient than naive string matching algorithms.

### Key Components

1. **Failure Function Construction**: Builds a table that indicates how many characters can be skipped on mismatch
2. **Pattern Matching**: Uses the failure function to efficiently search through the text
3. **Multiple Match Support**: Can find all occurrences, not just the first one

## 🧪 Testing

The project includes comprehensive tests covering:

- ✅ Basic functionality tests
- ✅ Edge cases (empty strings, single characters)
- ✅ Multiple matches scenarios
- ✅ Performance validation
- ✅ Error handling

Run tests with:
```bash
moon test --enable-coverage
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit Issues and Pull Requests.

### Development Setup

1. Clone the repository
2. Install MoonBit
3. Run `moon test` to verify everything works
4. Make your changes
5. Ensure tests pass and coverage remains high
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Thanks to the MoonBit team for the excellent programming language
- Inspired by the classic KMP algorithm by Knuth, Morris, and Pratt
- Built with modern software engineering practices