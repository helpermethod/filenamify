local fp = require('fp')
local normalize = require('normalize')

local function strip(pattern, s)
  return s:gsub(pattern, '')
end

return fp.pipe(
  fp.partial(strip, '^https?:'),
  fp.partial(strip, '^//'),
  fp.partial(strip, '^[^@/]+@'),
  normalize
)
