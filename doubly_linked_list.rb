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

  def pop
    return if head.nil? || tail.nil?

    if (self.length == 1)
      self.head = nil
      self.tail = nil
    else
      tail = self.tail
      prev_node = tail.prev
      prev_node.next = nil
      tail.prev = nil
      self.tail = prev_node
    end
    self.length -= 1
  end

  def shift
    return if head.nil?

    if (self.length == 1)
      self.head = nil
      self.tail = nil
    else
      old_head = self.head
      self.head = old_head.next
      self.head.prev = nil
      old_head.next = nil
    end
    self.length -= 1
  end

  def unshift(val)
    new_node = Node.new(val, nil, nil)

    if (head.nil?)
      self.head = new_node
      self.tail = new_node
    elsif (self.length == 1)
      old_head = self.head
      self.head = new_node
      self.head.next = old_head
      self.tail = old_head
      self.tail.prev = self.head
    else
      old_head = self.head
      self.head = new_node
      self.head.next = old_head
      old_head.prev = self.head
    end
    self.length += 1
  end

  def get(index)
    return if index < 0 || index >= self.length

    middle = self.length / 2
    current = self.head

    if index < middle
      counter = 0

      while counter != index
        current = current.next
        counter += 1
      end
    else
      counter = self.length - 1
      current = self.tail

      while counter != index
        current = current.prev
        counter -= 1
      end
    end

    current
  end

  def set(index, val)
    get_node = get(index)

    if !get_node.nil?
      get_node.val = val
    end
  end

  def insert(index, val)
    return unshift(val) if index == 0
    return add(val) if index == self.length

    get_node = get(index - 1)

    if !get_node.nil?
      next_node = get_node.next
      new_node = Node.new(val, next_node, get_node)
      get_node.next = new_node
      next_node.prev = new_node
    end

    self.length += 1
  end

  def remove(index)
    return shift if index == 0
    return pop if index == self.length - 1

    get_node = get(index)

    if !get_node.nil?
      prev_node = get_node.prev
      next_node = get_node.next
      prev_node.next = next_node
      next_node.prev = prev_node
      get_node.next = nil
      get_node.prev = nil
    end

    self.length -= 1
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

ll.print

ll.remove(2)

ll.print
