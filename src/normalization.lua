local fp = require('fp')
local str = require('str')

local normalization = {}

local uppercase_percent_encoding = fp.partial(str.replace, '%%%x%x', string.upper)
-- compose predicates
local decode_unreserved_chars = fp.partial(str.replace, '%%(%x%x)', function(hex)
  local num = tonumber(hex, 16)
  -- alpha
  if num >= 65 and num <= 90 or
     num >= 97 and num <= 122 or
     -- digit   
     num >= 48 and num <=57 or
     num == 45 or
     num == 46 or
     num == 95 or
     num == 126 then
     -- 2D,2E,5F,7E
    return string.char(num)
  end
end)

normalization.normalize_percent_encoding = fp.pipe(
  uppercase_percent_encoding,
  decode_unreserved_chars
)
normalization.normalize_host = fp.pipe(string.lower)

return normalization
