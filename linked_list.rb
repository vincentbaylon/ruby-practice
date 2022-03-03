require "pp"

class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def add(val)
    if (self.head.nil?)
      self.head = Node.new(val, nil)
    else
      last_node = self.head
      while (!last_node.next.nil?)
        last_node = last_node.next
      end
      last_node.next = Node.new(val, nil)
    end
  end

  def find(val)
    node = self.head
    while (!node.nil?)
      if (node.val == val)
        return true
      end
      node = node.next
    end

    false
  end

  def prepend(val)
    if head.nil?
      self.head = Node.new(val, nil)
    else
      old_head = head
      self.head = Node.new(val, old_head)
    end
  end

  def remove(val)
    return if head.nil?

    node = head
    prev_node = nil
    until (node.nil?)
      if (node.val == val)
        if !prev_node.nil?
          prev_node.next = node.next
          return
        else
          self.head = nil
          return
        end
      end
      prev_node = node
      node = node.next
    end
  end

  def shift
    return if head.nil?

    current_head = self.head
    self.head = current_head.next
  end

  def get(index)
    return if index < 0 || head.nil?

    counter = 0
    current = self.head
    while counter != index
      current = current.next
      counter += 1
    end
    current
  end

  def set(index, val)
    found_node = get(index)

    if found_node
      found_node.val = val
      return true
    end
    false
  end

  def insert(index, val)
    return if head.nil?

    current = get(index)
    temp = current.next
    new_node = Node.new(val, temp)
    current.next = new_node
  end

  def remove(index)
    return if head.nil?

    current = get(index - 1)
    current.next = current.next.next
  end

  def reverse
    return if head.nil?

    current = self.head
    prev_node = nil

    until (current.nil?)
      next_node = current.next
      current.next = prev_node
      prev_node = current
      current = next_node
    end
    self.head = prev_node
  end

  def print
    arr = []
    current = self.head

    while current
      arr << current.val
      current = current.next
    end

    pp arr
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

ll = LinkedList.new
ll.add(10)
ll.add(20)
ll.add(30)
ll.add(40)
ll.add(50)

ll.print
ll.reverse
ll.print
