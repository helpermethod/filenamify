local lambda = require('lamda')
local normalize = require('normalize')

local function strip(pattern, s)
  return s:gsub(pattern, '')
end

return lamda.pipe(
  lamda.partial(strip, '^https?:'),
  lamda.partial(strip, '^//'),
  lamda.partial(strip, '^[^@/]+@'),
  normalize
)
