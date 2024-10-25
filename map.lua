local char, pairs, floor = string.char, pairs, math.floor
local concat, unpack = table.concat, unpack or table.unpack
local map_init = false
local map = { code1252_to_unicode = {}, unicode_to_code1252 = {} }

--- Initialize the map
function map:init()
    if not map_init then
        self.code1252_to_unicode = {
            [0x80] = 0x20AC, -- €
            [0x81] = 0x81, -- "?"
            [0x82] = 0x201A, -- ‚
            [0x83] = 0x0192, -- ƒ
            [0x84] = 0x201E, -- „
            [0x85] = 0x2026, -- …
            [0x86] = 0x2020, -- †
            [0x87] = 0x2021, -- ‡
            [0x88] = 0x02C6, -- ˆ
            [0x89] = 0x2030, -- ‰
            [0x8A] = 0x0160, -- ˇ
            [0x8B] = 0x2039, -- ›
            [0x8C] = 0x0152, -- Œ
            [0x8D] = 0x8D, -- "?"
            [0x8E] = 0x017D, -- ˝
            [0x8F] = 0x8F, -- "?"
            [0x90] = 0x90, -- "?"
            [0x91] = 0x2018, -- ‘
            [0x92] = 0x2019, -- ’
            [0x93] = 0x201C, -- “
            [0x94] = 0x201D, -- ”
            [0x95] = 0x2022, -- •
            [0x96] = 0x2013, -- –
            [0x97] = 0x2014, -- —
            [0x98] = 0x02DC, -- ˘
            [0x99] = 0x2122, -- ™
            [0x9A] = 0x0161, -- ˇ
            [0x9B] = 0x203A, -- ›
            [0x9C] = 0x0153, -- œ
            [0x9D] = 0x9D, -- "?"
            [0x9E] = 0x017E, -- ˝
            [0x9F] = 0x0178, -- Ÿ
            [0xA0] = 0x00A0, -- "?"
            [0xA1] = 0x00A1, -- "?"
            [0xA2] = 0x00A2, -- ¢
            [0xA3] = 0x00A3, -- £
            [0xA4] = 0x00A4, -- ¤
            [0xA5] = 0x00A5, -- ¥
            [0xA6] = 0x00A6, -- ¦
            [0xA7] = 0x00A7, -- §
            [0xA8] = 0x00A8, -- ¨
            [0xA9] = 0x00A9, -- ©
            [0xAA] = 0x00AA, -- ª
            [0xAB] = 0x00AB, -- «
            [0xAC] = 0x00AC, -- ¬
            [0xAD] = 0x00AD, -- 
            [0xAE] = 0x00AE, -- ®
            [0xAF] = 0x00AF, -- ¯
            [0xB0] = 0x00B0, -- °
            [0xB1] = 0x00B1, -- ±
            [0xB2] = 0x00B2, -- ²
            [0xB3] = 0x00B3, -- ³
            [0xB4] = 0x00B4, -- ´
            [0xB5] = 0x00B5, -- µ
            [0xB6] = 0x00B6, -- ¶
            [0xB7] = 0x00B7, -- ·
            [0xB8] = 0x00B8, -- ¸
            [0xB9] = 0x00B9, -- ¹
            [0xBA] = 0x00BA, -- º
            [0xBB] = 0x00BB, -- »
            [0xBC] = 0x00BC, -- ¼
            [0xBD] = 0x00BD, -- ½
            [0xBE] = 0x00BE, -- ¾
            [0xBF] = 0x00BF, -- ¿
            [0xC0] = 0x00C0, -- À
            [0xC1] = 0x00C1, -- Á
            [0xC2] = 0x00C2, -- Â
            [0xC3] = 0x00C3, -- Ã
            [0xC4] = 0x00C4, -- Ä
            [0xC5] = 0x00C5, -- Å
            [0xC6] = 0x00C6, -- Æ
            [0xC7] = 0x00C7, -- Ç
            [0xC8] = 0x00C8, -- È
            [0xC9] = 0x00C9, -- É
            [0xCA] = 0x00CA, -- Ê
            [0xCB] = 0x00CB, -- Ë
            [0xCC] = 0x00CC, -- Ì
            [0xCD] = 0x00CD, -- Í
            [0xCE] = 0x00CE, -- Î
            [0xCF] = 0x00CF, -- Ï
            [0xD0] = 0x00D0, -- Ð
            [0xD1] = 0x00D1, -- Ñ
            [0xD2] = 0x00D2, -- Ò
            [0xD3] = 0x00D3, -- Ó
            [0xD4] = 0x00D4, -- Ô
            [0xD5] = 0x00D5, -- Õ
            [0xD6] = 0x00D6, -- Ö
            [0xD7] = 0x00D7, -- ×
            [0xD8] = 0x00D8, -- Ø
            [0xD9] = 0x00D9, -- Ù
            [0xDA] = 0x00DA, -- Ú
            [0xDB] = 0x00DB, -- Û
            [0xDC] = 0x00DC, -- Ü
            [0xDD] = 0x00DD, -- Ý
            [0xDE] = 0x00DE, -- Þ
            [0xDF] = 0x00DF, -- ß
            [0xE0] = 0x00E0, -- à
            [0xE1] = 0x00E1, -- á
            [0xE2] = 0x00E2, -- â
            [0xE3] = 0x00E3, -- ã
            [0xE4] = 0x00E4, -- ä
            [0xE5] = 0x00E5, -- å
            [0xE6] = 0x00E6, -- æ
            [0xE7] = 0x00E7, -- ç
            [0xE8] = 0x00E8, -- è
            [0xE9] = 0x00E9, -- é
            [0xEA] = 0x00EA, -- ê
            [0xEB] = 0x00EB, -- ë
            [0xEC] = 0x00EC, -- ì
            [0xED] = 0x00ED, -- í
            [0xEE] = 0x00EE, -- î
            [0xEF] = 0x00EF, -- ï
            [0xF0] = 0x00F0, -- ð
            [0xF1] = 0x00F1, -- ñ
            [0xF2] = 0x00F2, -- ò
            [0xF3] = 0x00F3, -- ó
            [0xF4] = 0x00F4, -- ô
            [0xF5] = 0x00F5, -- õ
            [0xF6] = 0x00F6, -- ö
            [0xF7] = 0x00F7, -- ÷
            [0xF8] = 0x00F8, -- ø
            [0xF9] = 0x00F9, -- ù
            [0xFA] = 0x00FA, -- ú
            [0xFB] = 0x00FB, -- Û
            [0xFC] = 0x00FC, -- ü
            [0xFD] = 0x00FD, -- ý
            [0xFE] = 0x00FE, -- þ
            [0xFF] = 0x00FF, -- ÿ
        }

        for code1252, code in pairs(self.map_1252_to_unicode) do
            self.unicode_to_code1252[code] = code1252
        end

        map_init = true
    end
end

--- Flush the map
function map:flush()
    self.code1252_to_unicode = {}
    self.unicode_to_code1252 = {}
    map_init = false
end

--- Convert a utf8 string to a unicode code
---@param str string
---@param pos integer?
---@return integer
---@return integer?
function map:utf8ToUnicode(str, pos)
    local _pos = pos or 1
    local code, size = str:byte(_pos), 1

    if code >= 0xC0 and code < 0xFE then
        local mask = 64
        code = code - 128

        repeat
            local nextByte = str:byte(_pos + size) or 0
            if nextByte >= 0x80 and nextByte < 0xC0 then
                code, size = (code - mask - 2) * 64 + nextByte, size + 1
            else
                code, size = str:byte(_pos), 1
            end
            mask = mask * 32
        until code < mask
    end

    return code, size
end

--- Convert a unicode code to a utf8 string
---@param code integer
---@return string
function map:unicodeToUtf8(code)
    local t, h = {}, 128
    local _code = code

    while _code >= h do
        t[#t + 1] = 128 + (_code % 64)
        _code = floor(_code / 64)
    end

    t[#t + 1] = 256 - 2 * h + _code
    return char(unpack(t)):reverse()
end

--- Convert a code1252 string to a utf8 string
---@param str1252 string
---@return string
function map:code1252ToUtf8(str1252)
    self:init()
    local result = {}
    local str = str1252

    for pos = 1, #str do
        local code = str:byte(pos)
        local utf8_code = self:unicodeToUtf8(self.code1252_to_unicode[code] or code)
        result[#result + 1] = utf8_code
    end

    return concat(result)
end

--- Convert a utf8 string to a code1252 string
---@param utf8str string
---@return string
function map:utf8ToCode1252(utf8str)
    self:init()
    local result, pos = {}, 1
    local str = utf8str

    while pos <= #str do
        local code, size = self:utf8ToUnicode(str, pos)
        pos = pos + size
        code = code < 128 and code or self.unicode_to_code1252[code] or ('?'):byte()
        result[#result + 1] = char(code)
    end

    return concat(result)
end

return map