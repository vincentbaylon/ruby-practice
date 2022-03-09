require "pp"

class PriorityQueue
  attr_accessor :values

  @values = []

  def initialize
    @values = []
  end

  def enqueque(val, priority)
    new_node = Node.new(val, priority)
    @values << new_node
    bubble_up
  end

  def bubble_up
    idx = @values.length - 1
    element = @values[idx]

    while idx > 0
      parent_idx = ((idx - 1) / 2).floor
      parent = @values[parent_idx]

      break if element.priority >= parent.priority

      @values[parent_idx] = element
      @values[idx] = parent
      idx = parent_idx
    end
  end

  def dequeque
    min = @values[0]
    last = @values.pop
    @values[0] = last

    sink_down

    min
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

        if left_child.priority < element.priority
          swap = left_child_idx
        end

        if right_child_idx < length
          right_child = @values[right_child_idx]

          if swap == nil && right_child.priority > element.priority || swap != nil && right_child.priority < left_child.priority
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

  private

  class Node
    attr_accessor :val, :priority

    def initialize(val, priority)
      @val = val
      @priority = priority
    end
  end
end

ER = PriorityQueue.new
ER.enqueque("common cold", 5)
ER.enqueque("gunshot wound", 1)
ER.enqueque("high fever", 4)
ER.enqueque("broken arm", 2)
ER.enqueque("glass in foot", 3)

pp ER.show
pp ER.dequeque
pp ER.dequeque
pp ER.dequeque
pp ER.dequeque
pp ER.dequeque
