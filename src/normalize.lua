local parse_url = require('parse_url')
local normalization = require('normalization')

return function(url)
  local host, path, query = parse_url(normalization.normalize_percent_encoding(url))

  return normalization.normalize_host(host) .. path .. query
end
