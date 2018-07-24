local parse_url = require('parse_url')

describe('parse_url', function()
  for i, pair in ipairs({
    { 'www.example.com', { 'www.example.com', '', ''}},
    { 'www.example.com/foo', { 'www.example.com', '/foo', ''}}
  }) do
    local input, output = table.unpack(pair)

    it('should split the URL into host, path and query' .. '[' .. i .. ']', function()
      assert.is_same(output, {parse_url(input)})
    end)
  end
end)
