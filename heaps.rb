require 'pp'

class MaxBinaryHeap
  attr_accessor :values

  @values = []

  def initialize
    @values = [41,39,33,18,27,12]
  end

  def insert(val)
    @values << val
    bubble_up
  end

  def bubble_up
    idx = @values.length - 1
    element = @values[idx]

    while idx > 0
      parent_idx = ((idx - 1) / 2).floor
      parent = @values[parent_idx]

      break if element <= parent

      @values[parent_idx] = element
      @values[idx] = parent
      idx = parent_idx
    end
  end

  def extract_max
    max = @values[0]
    last = @values.pop
    @values[0] = last

    sink_down

    max
  end

  def sink_down
    idx = 0
    length = @values.length
    element = @values[0]

    while true
      left_child_idx = 2 * idx + 1
      right_child_idx = 2 * idx + 2
      left_child = nil
      right_child = nil
      swap = nil

      if left_child_idx < length
        left_child = @values[left_child_idx]

        if left_child > element
          swap = left_child_idx
        end

        if right_child_idx < length
          right_child = @values[right_child_idx]

          if swap == nil && right_child > element || swap != nil && right_child > left_child

            swap = right_child_idx
          end
        end
      end

      break if swap == nil
      @values[idx] = @values[swap]
      @values[swap] = element
      idx = swap
    end
  end

  def show
    @values
  end
end

heap = MaxBinaryHeap.new
heap.insert(55)
heap.extract_max

pp heap.show