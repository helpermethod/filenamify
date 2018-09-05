local normalization = require('normalization')

describe('normalization', function()
  describe('normalize_host', function()
    it('should normalize the host', function()
      assert.is_equal('www.example.com', normalization.normalize_host('www.Example.com'))
    end)
  end)
  describe('normalize_percent_encoding', function()
    for i, pair in ipairs({ 
      {'www.example.com/a%c2%b1b', 'www.example.com/a%C2%B1b'},
      {'www.example.com/%7Eusername', 'www.example.com/~username'}
    }) do
      local passed_in, expected = table.unpack(pair)

      it('should normalize percent encodings' .. '[' .. i .. ']', function()
        assert.is_equal(expected, normalization.normalize_percent_encoding(passed_in))
      end)
    end
  end)
  describe('sort_query_params', function()
    it('should sort the query parameters', function()
      assert.is_same('article=fred&lang=en', normalization.normalize_query('lang=en&article=fred'))
    end)
  end)
end)
