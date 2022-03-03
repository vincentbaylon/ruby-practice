def two_sum(nums, target)
  prevMap = Hash.new

  i = 0
  while i < nums.length
    diff = target - nums[i]
    return [prevMap[:diff], i] if prevMap.has_value?(diff)

    prevMap[:nums[i]] = i
    i += 1
  end

  []
end

two_sum([2, 7, 11, 15], 9)
