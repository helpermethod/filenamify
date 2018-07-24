return function(url)
  return url:match('([^/?#]*)(/?[^?#]*)(%??[^#]*)')
end
