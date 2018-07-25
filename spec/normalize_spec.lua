local normalize = require('normalize')

describe('normalize', function()
  for i, pair in ipairs({ 
    {'www.Example.com', 'www.example.com'},
    {'www.example.com/a%c2%b1b', 'www.example.com/a%C2%B1b'},
    {'www.example.com/%7Eusername', 'www.example.com/~username'}
  }) do
    local passed_in, expected = table.unpack(pair)

    it('should transform a URL into a normalized URL' .. '[' .. i .. ']', function()
      assert.is_equal(expected, normalize(passed_in))
    end)
  end
end)
