local fp = require('fp')
local humanize = require('humanize')

local function replace_reserved_chars(s)
  -- see https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-file#naming-conventions
  return s:gsub('[<>:"/\\|%?*]+', '!')
end

return fp.pipe(humanize, replace_reserved_chars)
