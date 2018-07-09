local filenamify = require('filenamify')

describe('filenamify', function()
  it('should create a valid filename', function()
    assert.is_equal('www.ietf.org!rfc!rfc2396.txt', filenamify('http://www.ietf.org/rfc/rfc2396.txt'))
  end)
end)
