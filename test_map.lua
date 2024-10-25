-- Load the map module
local map = require("map") -- Ensure the module path is correct
local char = string.char

-- Simple function to compare expected and actual results
local function assertEqual(actual, expected, message)
    if actual ~= expected then
        error(message or ("Expected %s but got %s"):format(tostring(expected), tostring(actual)), 3)
    else
        print("Test passed:", message)
    end
end

-- Test conversion from Code1252 to UTF-8
local function testCode1252ToUtf8()
    local test_str1252 = char(0x80, 0x81, 0x82, 0xA2, 0xA3) -- Example string in Code1252
    local utf8_result = map:code1252ToUtf8(test_str1252)
    print("Conversion from Code1252 to UTF-8: " .. utf8_result)
    assertEqual(utf8_result, "€ƒ„¢£", "Code1252 to UTF-8 conversion test failed") -- Replace with expected result
end

-- Test conversion from UTF-8 to Code1252
local function testUtf8ToCode1252()
    local test_utf8 = "€ƒ„¢£" -- Example UTF-8 string
    local code1252_result = map:utf8ToCode1252(test_utf8)
    print("Conversion from UTF-8 to Code1252: " .. code1252_result)
    assertEqual(code1252_result, char(0x80, 0x81, 0x82, 0xA2, 0xA3), "UTF-8 to Code1252 conversion test failed") -- Replace with expected result
end

-- Test conversion from Unicode to UTF-8
local function testUnicodeToUtf8()
    local unicode_code = 0x20AC -- € (Euro sign)
    local utf8_from_unicode = map:unicodeToUtf8(unicode_code)
    print("Conversion from Unicode to UTF-8: " .. utf8_from_unicode)
    assertEqual(utf8_from_unicode, "€", "Unicode to UTF-8 conversion test failed")
end

-- Test conversion from UTF-8 to Unicode
local function testUtf8ToUnicode()
    local utf8_from_unicode = "€" -- Using the previous result
    local unicode_from_utf8, size = map:utf8ToUnicode(utf8_from_unicode)
    print("Conversion from UTF-8 to Unicode: " .. ("U+%X"):format(unicode_from_utf8))
    assertEqual(unicode_from_utf8, 0x20AC, "UTF-8 to Unicode conversion test failed")
end

-- Optional: Cleanup the table in map
local function testFlush()
    map:flush() -- Call the flush method to clean up
    print("Flush operation completed.")
end

-- Run all tests
local function runTests()
    print("Running tests...")
    testCode1252ToUtf8()
    testUtf8ToCode1252()
    testUnicodeToUtf8()
    testUtf8ToUnicode()
    testFlush()
    print("All tests passed!")
end

runTests()