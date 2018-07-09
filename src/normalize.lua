local fp = require('fp')
local parse_url = require('parse_url')   
local str = require('str')

local upper_percent_encoding = fp.pipe(
  fp.partial(str.replace, '%%([a-f])', string.upper),
  fp.partial(str.replace, '%%.([a-f])', string.upper)
)

local normalize_host = fp.pipe(string.lower)

return function(url)
  local host, path, query = parse_url(url)

  return normalize_host(host) .. path .. query
end
