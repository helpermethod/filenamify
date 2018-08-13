local fp = require('fp')

describe('fp', function()
  local function add(a, b)
    return a + b
  end

  describe('concat', function()
    it('should return a new table consisting of the elements of the first table followed by the elements of the second table', function()
      assert.is_same({1, 2, 3}, fp.concat({1, 2}, {3}))
    end)
  end)

  describe('pipe', function()
    it('should compose functions from left to right', function()
      assert.is_equal(10, fp.pipe(add, function(x) return x * 2 end)(2, 3))
    end)
  end)

  describe('partial', function()
    it('should partially apply the provided arguments', function()
      assert.is_equal(5, fp.partial(add, 2)(3))
    end)
  end)

  describe('any_pass', function()
    it('should return a new predicate that returns true for a given argument if at least one of the provided predicates is satisfied by the argument', function()
      local function is_string(x) return type(x) == 'string' end
      local function is_number(x) return type(x) == 'number' end

      assert.is_true(fp.any_pass(is_string, is_number)(2))
    end)
  end)
end)
