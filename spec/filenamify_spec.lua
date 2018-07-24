local filenamify = require('filenamify')

describe('filenamify', function()
  it('should create a valid filename', function()
    assert.is_equal('www.example.com', filenamify('http://www.example.com'))
  end)
end)
