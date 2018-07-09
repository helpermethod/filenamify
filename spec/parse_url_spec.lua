local parse_url = require('parse_url')

describe('parse_url', function()
  for _, pair in ipairs({
    { 'www.ietf.org/rfc/rfc2396.txt', { 'www.ietf.org', '/rfc/rfc2396.txt', ''}}
  }) do
    local input, output = table.unpack(pair)

    it('should split the URL ' .. input .. ' into host, query and params', function()
      assert.is_same(output, {parse_url(input)})
    end)
  end
end)
