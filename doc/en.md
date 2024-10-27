 # lua-charset-converter

## English

### Overview
`lua-charset-converter` is a Lua module designed for converting character sets, including Windows-1252 to UTF-8, UTF-8 to Windows-1252, Unicode to UTF-8, and UTF-8 to Unicode. This module aims to provide an easy-to-use interface for developers who need to handle different character encodings in their applications.

### Features
- Convert Windows-1252 encoded strings to UTF-8.
- Convert UTF-8 strings to Windows-1252 encoding.
- Convert Unicode code points to UTF-8 strings.
- Convert UTF-8 strings back to Unicode code points.
- Flush conversion tables to reset state. (optional and only if you use the methods 'code1252ToUtf8' and 'utf8ToCode1252')

### Installation
To use the `lua-charset-converter` module, ensure you have Lua installed on your system. You can then include the module in your Lua scripts using:

```lua
local map = require("map")
```

### Usage

Here are some examples of how to use the module:

```lua
local map = require("map")

-- Convert Windows-1252 to UTF-8
local utf8String = map:code1252ToUtf8("\x80\x81\x82\xA2\xA3")

-- Convert UTF-8 to Windows-1252
local win1252String = map:utf8ToCode1252("€ƒ„¢£")

-- Convert Unicode to UTF-8
local utf8FromUnicode = map:unicodeToUtf8(0x20AC)

-- Convert UTF-8 to Unicode
local unicodeFromUtf8 = map:utf8ToUnicode("€")
```

### Running the tests

To ensure the module works as expected, run the provided test suite using:

```bash
lua test_map.lua
```

### Lua version

This module has been tested with Lua 5.4.*, but it should work with almost all versions of Lua, including LuaJIT.

### Contribution

Contributions are welcome! If you have suggestions for improvements to the module, please open an issue or propose a pull request.