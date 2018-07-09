return function(s)
  -- see https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-file#naming-conventions
  return s:gsub('[<>:"/\\|%?*]', '!')
end
