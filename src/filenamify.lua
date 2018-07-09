local fp = require('fp')
local humanize = require('humanize')
local replace_reserved_chars = require('replace_reserved_chars')

return fp.pipe(humanize, replace_reserved_chars)
