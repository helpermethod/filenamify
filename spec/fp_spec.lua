local fp = require('fp')

describe('fp', function()
  local function add(a, b)
    return a + b
  end

  describe('pipe', function()
    it('should compose functions from left to right', function()
      assert.is_equal(10, fp.pipe(add, function(x) return x * 2 end)(2, 3))
    end)
  end)

  describe('partial', function()
    it('should partially apply the provided arguments', function()
      assert.is_equal(add(2,3), fp.partial(add, 2)(3))
    end)
  end)
end)
