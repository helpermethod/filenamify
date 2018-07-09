local fp = require('fp')

return function(url)
  return url:match('([^/?#]*)(/?[^?#]*)(%??[^#]*)')
end
