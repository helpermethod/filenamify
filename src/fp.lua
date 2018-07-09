local fp = {}

function fp.pipe(fn, ...)
  local fns = {...}

  return function(...)
    return #fns == 0 and fn(...) or fp.pipe(table.unpack(fns))(fn(...))
  end
end

function fp.partial(fn, ...)
  local initial = {...}
 
  return function(...)
    return fn(table.unpack(initial), ...)
  end
end

return fp
