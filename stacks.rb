require "pp"

class Stack
  attr_accessor :first, :last, :size

  def initialize
    self.first = first
    self.last = last
    self.size = 0
  end

  def push(val)
    new_node = Node.new(val, nil)

    if first.nil?
      self.first = new_node
      self.last = new_node
    else
      temp = self.first
      self.first = new_node
      self.first.next = temp
    end

    self.size += 1
  end

  def pop
    return if first.nil?

    temp = self.first
    if (self.first == self.last)
      self.last = nil
    end
    self.first = self.first.next
    self.size -= 1
    pp temp.val
  end

  private

  class Node
    attr_accessor :val, :next

    def initialize(val, _next)
      self.val = val
      self.next = _next
    end
  end
end

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.push(40)
stack.push(50)

pp stack.size

stack.pop
stack.pop
stack.pop
pp stack.size
