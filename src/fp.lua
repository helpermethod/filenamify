local fp = {}

function fp.join(separator, tbl)
  return table.concat(tbl, separator)
end

function fp.concat(tbl1, tbl2)
  local copy = {table.unpack(tbl1)}

  for _, v in ipairs(tbl2) do
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

function fp.sort(comparator, tbl)
  local copy = {table.unpack(tbl)}

  table.sort(copy, comparator)

  return copy
end

return fp
