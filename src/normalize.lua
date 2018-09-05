local parse_url = require('parse_url')
local normalization = require('normalization')

return function(url)
  local host, path, query = parse_url(normalization.normalize_percent_encoding(url))
  local normalized_query = normalization.normalize_query(query)

  return normalization.normalize_host(host) .. path .. (normalized_query == '' and '' or '?' .. normalized_query)
end
