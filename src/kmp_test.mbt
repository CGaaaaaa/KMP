// KMP算法的单元测试

test "查找所有匹配位置" {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  let result = kmp_search(text, pattern)
  // 验证结果
  inspect(result.length(), content="1")
  inspect(result[0], content="10")
}

test "查找第一个匹配位置" {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  let result = find_first(text, pattern)
  inspect(result, content="10")
}

test "检查模式是否存在" {
  let text = "ABABDABACDABABCABAB"
  let pattern = "ABABCABAB"
  let result = contains_pattern(text, pattern)
  inspect(result, content="true")
}

test "不存在的模式" {
  let text = "ABABDABACDABABCABAB"
  let pattern = "XYZ"
  
  // 测试所有匹配位置
  let all_matches = kmp_search(text, pattern)
  inspect(all_matches.length(), content="0")
  
  // 测试第一个匹配位置
  let first_match = find_first(text, pattern)
  inspect(first_match, content="-1")
  
  // 测试模式是否存在
  let exists = contains_pattern(text, pattern)
  inspect(exists, content="false")
}

test "多次匹配" {
  let text = "ABABABAB"
  let pattern = "ABAB"
  
  // 测试所有匹配位置
  let all_matches = kmp_search(text, pattern)
  inspect(all_matches.length(), content="3")
  inspect(all_matches[0], content="0")
  inspect(all_matches[1], content="2")
  inspect(all_matches[2], content="4")
  
  // 测试第一个匹配位置
  let first_match = find_first(text, pattern)
  inspect(first_match, content="0")
  
  // 测试模式是否存在
  let exists = contains_pattern(text, pattern)
  inspect(exists, content="true")
}

test "构建失效函数表" {
  let pattern = "ABABCABAB"
  let failure = build_failure_table(pattern)
  
  // 验证失效函数表的部分值
  inspect(failure[0], content="0")
  inspect(failure[1], content="0")
  inspect(failure[2], content="1")
  inspect(failure[3], content="2")
  inspect(failure[4], content="0")
}

test "空模式串处理" {
  let text = "ABCD"
  let pattern = ""
  
  let matches = kmp_search(text, pattern)
  inspect(matches.length(), content="0")
  
  let first = find_first(text, pattern)
  inspect(first, content="0")
  
  let contains = contains_pattern(text, pattern)
  inspect(contains, content="false")
}

test "模式串长于文本" {
  let text = "ABC"
  let pattern = "ABCDEF"
  
  let first = find_first(text, pattern)
  inspect(first, content="-1")
  
  let contains = contains_pattern(text, pattern)
  inspect(contains, content="false")
}

test "hello函数" {
  let result = hello()
  inspect(result, content="Hello from KMP")
}

test "简化函数" {
  let table_result = build_table("test")
  inspect(table_result, content="0")
  
  let find_result1 = find("text", "")
  inspect(find_result1, content="0")
  
  let find_result2 = find("text", "pattern")
  inspect(find_result2, content="-1")
}

test "test_kmp函数" {
  // 测试test_kmp函数的执行
  test_kmp()
}

test "所有演示测试函数" {
  // 测试所有的演示函数
  test_kmp_search()
  test_find_first()
  test_contains_pattern()
  test_nonexistent_pattern()
  test_multiple_matches()
}

// 添加一个测试来间接测试main函数的逻辑
test "main函数逻辑验证" {
  // 验证main函数中调用的所有函数都能正常工作
  // 这里我们手动执行main函数中的逻辑，但不调用println
  
  // 测试1: 查找所有匹配位置 (对应test_kmp_search的逻辑)
  let text1 = "ABABDABACDABABCABAB"
  let pattern1 = "ABABCABAB"
  let result1 = kmp_search(text1, pattern1)
  inspect(result1.length(), content="1")
  inspect(result1[0], content="10")
  
  // 测试2: 查找第一个匹配位置 (对应test_find_first的逻辑)
  let result2 = find_first(text1, pattern1)
  inspect(result2, content="10")
  
  // 测试3: 检查模式是否存在 (对应test_contains_pattern的逻辑)
  let result3 = contains_pattern(text1, pattern1)
  inspect(result3, content="true")
  
  // 测试5: 不存在的模式 (对应test_nonexistent_pattern的逻辑)
  let text2 = "ABABDABACDABABCABAB"
  let pattern2 = "XYZ"
  let all_matches = kmp_search(text2, pattern2)
  inspect(all_matches.length(), content="0")
  let first_match = find_first(text2, pattern2)
  inspect(first_match, content="-1")
  let exists = contains_pattern(text2, pattern2)
  inspect(exists, content="false")
  
  // 测试6: 多次匹配 (对应test_multiple_matches的逻辑)
  let text3 = "ABABABAB"
  let pattern3 = "ABAB"
  let all_matches2 = kmp_search(text3, pattern3)
  inspect(all_matches2.length(), content="3")
  inspect(all_matches2[0], content="0")
  inspect(all_matches2[1], content="2")
  inspect(all_matches2[2], content="4")
  let first_match2 = find_first(text3, pattern3)
  inspect(first_match2, content="0")
  let exists2 = contains_pattern(text3, pattern3)
  inspect(exists2, content="true")
}

// 添加更多边界情况测试来提高覆盖率
test "更多边界情况" {
  // 测试单字符模式
  let single_result = kmp_search("ABCABC", "A")
  inspect(single_result.length(), content="2")
  inspect(single_result[0], content="0")
  inspect(single_result[1], content="3")
  
  // 测试相同字符的字符串
  let same_chars = kmp_search("AAAA", "AA")
  inspect(same_chars.length(), content="3")
  inspect(same_chars[0], content="0")
  inspect(same_chars[1], content="1")
  inspect(same_chars[2], content="2")
  
  // 测试完全匹配
  let full_match = kmp_search("ABCD", "ABCD")
  inspect(full_match.length(), content="1")
  inspect(full_match[0], content="0")
  
  // 测试模式在文本开头
  let start_match = find_first("ABCDEF", "ABC")
  inspect(start_match, content="0")
  
  // 测试模式在文本结尾
  let end_match = find_first("DEFABC", "ABC")
  inspect(end_match, content="3")
}

test "main函数逻辑测试" {
  // 测试main函数的逻辑（通过调用run_all_demo_tests）
  // 这会覆盖main函数中的所有逻辑
  run_all_demo_tests()
}