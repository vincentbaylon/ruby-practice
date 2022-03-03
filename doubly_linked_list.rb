require "pp"

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    self.head = nil
    self.tail = nil
    self.length = 0
  end

  def add(val)
    new_node = Node.new(val, nil, self.tail)

    if self.head.nil?
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next = new_node
      new_node.prev = self.tail
      self.tail = new_node
    end

    self.length += 1
  end

  def print
    arr = []
    current = self.head

    while (current)
      arr << current.val
      current = current.next
    end

    pp arr
  end

  private

  class Node
    attr_accessor :val, :next, :prev

    def initialize(val, _next, prev)
      self.val = val
      self.next = _next
      self.prev = prev
    end
  end
end

ll = LinkedList.new

ll.add(10)
ll.add(20)
ll.add(30)
ll.add(40)
ll.add(50)

pp ll.length
