local fp = require('fp')
local str = require('str')
local normalize = require('normalize')

return fp.pipe(
  fp.partial(str.strip, '^https?:'),
  fp.partial(str.strip, '^//'),
  fp.partial(str.strip, '^[^@/]+@'),
  normalize
)
