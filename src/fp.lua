local fp = {}

function fp.concat(first_tbl, second_tbl)
  local copy = {table.unpack(first_tbl)}

  for _, v in ipairs(second_tbl) do
    table.insert(copy, v)
  end

  return copy
end

function fp.pipe(fn, ...)
  local fns = {...}

  return function(...)
    return #fns == 0 and fn(...) or fp.pipe(table.unpack(fns))(fn(...))
  end
end

function fp.partial(fn, ...)
  local arguments = {...}

  return function(...)
    return fn(table.unpack(fp.concat(arguments, {...})))
  end
end

function fp.any_pass(predicate, ...)
  local rest = {...}

  return function(argument)
    if #rest == 0 then return predicate(argument) end

    return predicate(argument) or fp.any_pass(table.unpack(rest))(argument)
  end
end

return fp
