def two_sum(nums, target)
  prev_map = Hash.new

  i = 0
  while i < nums.length
    diff = target - nums[i]
    return [prev_map[:diff], i] if prev_map.has_value?(diff)

    prev_map[:nums[i]] = i
    i += 1
  end

  []
end

two_sum([2, 7, 11, 15], 9)
