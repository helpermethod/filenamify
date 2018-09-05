local parse_url = require('parse_url')

describe('parse_url', function()
  for i, pair in ipairs({
    { 'www.example.com', { 'www.example.com', '',  ''}},
    { 'www.example.com/display', { 'www.example.com', '/display', ''}},
    { 'www.example.com/display?lang=en&article=fred', { 'www.example.com', '/display', 'lang=en&article=fred'}}
  }) do
    local passed_in, expected = table.unpack(pair)

    it('should split the URL into host, path and query' .. '[' .. i .. ']', function()
      assert.is_same(expected, {parse_url(passed_in)})
    end)
  end
end)
