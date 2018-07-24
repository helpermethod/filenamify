local fp = require('fp')
local str = require('str')

local normalization = {}

local uppercase_percent_encoding = fp.partial(str.replace, '%%%x%x', string.upper)

local function is_alpha(num)
  return num >= 65 and num <= 90 or (num >= 97 and num <= 122)
end

local function is_digit(num)
  return num >= 48 and num <= 122
end

local function is_hypen(num)
  return num == 45
end

local function is_period(num)
  return num == 46
end

local function is_underscore(num)
  return num == 95
end

local function is_tilde(num)
  return num == 126
end

local is_unreserved = fp.any_pass(
  is_alpha,
  is_digit,
  is_hyphen,
  is_period,
  is_underscore,
  is_tilde
)
local decode_unreserved_chars = fp.partial(str.replace, '%%(%x%x)', function(hex)
  local num = tonumber(hex, 16)

  return is_unreserved(num) and string.char(num) or '%' .. hex
end)

normalization.normalize_percent_encoding = fp.pipe(
  uppercase_percent_encoding,
  decode_unreserved_chars
)
normalization.normalize_host = fp.pipe(string.lower)

return normalization
