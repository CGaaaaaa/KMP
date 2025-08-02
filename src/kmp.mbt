// KMP (Knuth-Morris-Pratt) 字符串匹配算法

// 构建部分匹配表（失效函数）
pub fn build_failure_table(pattern: String) -> Array[Int] {
  let m = pattern.length()
  let failure = 
  Array::make(m, 0)
  
  // 初始化第一个位置
  failure[0] = 0
  
  // j是当前处理的位置，k是最长相等前后缀的长度
  let mut j = 1
  let mut k = 0
  
  while j < m {
    if pattern.charcode_at(j) == pattern.charcode_at(k) {
      // 前后缀匹配，k增加
      k += 1
      failure[j] = k
      j += 1
    } else if k > 0 {
      // 前后缀不匹配但可回退
      k = failure[k - 1]
    } else {
      // 无法回退，无相等前后缀
      failure[j] = 0
      j += 1
    }
  }
  
  failure
}

// 在文本中查找模式串的所有位置
pub fn kmp_search(text: String, pattern: String) -> Array[Int] {
  let m = pattern.length()
  
  // 空模式串特殊处理
  if m == 0 {
    Array::make(0, 0)
  } else {
    let n = text.length()
    let failure = build_failure_table(pattern)
    let mut matches = Array::make(0, 0)
    
    // i是文本指针，j是模式串指针
    let mut i = 0
    let mut j = 0
    
    while i < n {
      if j < m && text.charcode_at(i) == pattern.charcode_at(j) {
        // 字符匹配
        i += 1

        
        j += 1
        
        // 找到完整匹配
        if j == m {
          // 使用 + 运算符连接数组
          matches = matches + Array::make(1, i - m)
          // 继续寻找下一个匹配
          j = failure[j - 1]
        }
      } else if j > 0 {
        // 失配但可回退
        j = failure[j - 1]
      } else {
        // 第一个字符就失配
        i += 1
      }
    }
    
    matches
  }
}

// 检查文本中是否存在模式串
pub fn contains_pattern(text: String, pattern: String) -> Bool {
  let matches = kmp_search(text, pattern)
  matches.length() > 0
}

// 查找模式串在文本中的第一次出现位置
pub fn find_first(text: String, pattern: String) -> Int {
  // 朴素匹配，简化版
  let n = text.length()
  let m = pattern.length()
  
  if m == 0 {
    return 0
  }
  
  if m > n {
    return -1
  }
  
  // 简单匹配
  let mut i = 0
  while i <= n - m {
    let mut j = 0
    let mut matched = true
    
    while j < m {
      if text.charcode_at(i + j) != pattern.charcode_at(j) {
        matched = false
        break
      }
      j += 1
    }
    
    if matched {
      return i
    }
    
    i += 1
  }
  
  -1
}

// 测试函数
pub fn test_kmp() -> Unit {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  let result = find_first(text, pattern)
  println(result.to_string())
}

// KMP简化实现
pub fn hello() -> String {
  "Hello from KMP"
}

// 预处理部分匹配表
pub fn build_table(_pattern: String) -> Int {
  0 // 简化实现
}

// 查找模式串在文本中首次出现的位置
pub fn find(_text: String, _pattern: String) -> Int {
  // 简化实现，返回第一个匹配位置或-1 
  if _pattern.length() == 0 {
    0
  } else {
    -1 // 简化版本
  }
}
// 运行所有演示测试的公开函数
pub fn run_all_demo_tests() -> Unit {
  println("===== KMP算法测试开始 =====")

  // 测试1: 查找所有匹配位置
  test_kmp_search()

  // 测试2: 查找第一个匹配位置
  test_find_first()

  // 测试3: 检查模式是否存在
  test_contains_pattern()

  // 测试5: 不存在的模式
  test_nonexistent_pattern()

  // 测试6: 多次匹配
  test_multiple_matches()
  println("===== 所有测试完成 =====")
}

// 主函数 - 运行所有测试
fn main {
  run_all_demo_tests()
}

// 测试1: 查找所有匹配位置
pub fn test_kmp_search() -> Unit {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  println("\n测试1: 查找所有匹配位置")
  println("文本: " + text)
  println("模式: " + pattern)
  let result = kmp_search(text, pattern)
  println("匹配位置: " + result.to_string() + " (预期: [10])")
}

// 测试2: 查找第一个匹配位置
pub fn test_find_first() -> Unit {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  println("\n测试2: 查找第一个匹配位置")
  println("文本: " + text)
  println("模式: " + pattern)
  let result = find_first(text, pattern)
  println("首次匹配位置: " + result.to_string() + " (预期: 10)")
}

// 测试3: 检查模式是否存在
pub fn test_contains_pattern() -> Unit {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  println("\n测试3: 检查模式是否存在")
  println("文本: " + text)
  println("模式: " + pattern)
  let result = contains_pattern(text, pattern)
  println("是否包含模式: " + result.to_string() + " (预期: true)")
}

// 测试5: 不存在的模式
pub fn test_nonexistent_pattern() -> Unit {
  let text = "ABABDABACDABABCABAB"
  let pattern = "XYZ"
  println("\n测试5: 不存在的模式")
  println("文本: " + text)
  println("模式: " + pattern)
  
  // 测试所有匹配位置
  let all_matches = kmp_search(text, pattern)
  println("所有匹配位置: " + all_matches.to_string() + " (预期: [])")
  
  // 测试第一个匹配位置
  let first_match = find_first(text, pattern)
  println("首次匹配位置: " + first_match.to_string() + " (预期: -1)")
  
  // 测试模式是否存在
  let exists = contains_pattern(text, pattern)
  println("是否包含模式: " + exists.to_string() + " (预期: false)")
}

// 测试6: 多次匹配
pub fn test_multiple_matches() -> Unit {
  let text = "ABABABAB"
  let pattern = "ABAB"
  println("\n测试6: 多次匹配")
  println("文本: " + text)
  println("模式: " + pattern)
  
  // 测试所有匹配位置
  let all_matches = kmp_search(text, pattern)
  println("所有匹配位置: " + all_matches.to_string() + " (预期: [0, 2, 4])")
  
  // 测试第一个匹配位置
  let first_match = find_first(text, pattern)
  println("首次匹配位置: " + first_match.to_string() + " (预期: 0)")
  
  // 测试模式是否存在
  let exists = contains_pattern(text, pattern)
  println("是否包含模式: " + exists.to_string() + " (预期: true)")
}