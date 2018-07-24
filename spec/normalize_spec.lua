local normalize = require('normalize')

describe('normalize', function()
  for i, pair in ipairs({ 
    {'www.Example.com', 'www.example.com'},
    {'www.example.com/a%c2%b1b', 'www.example.com/a%C2%B1b'}
  }) do
    local input, output = table.unpack(pair)

    it('should transform a URL into a normalized URL' .. '[' .. i .. ']', function()
      assert.is_equal(output, normalize(input))
    end)
  end
end)
