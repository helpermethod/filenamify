local str = {}

function str.strip(pattern, s)
  return s:gsub(pattern, '')
end

function str.replace(pattern, replacement, s)
  return s:gsub(pattern, replacement)
end

return str
