class Queue
  attr_accessor :first, :last, :size

  def initialize
    self.first = first
    self.last = last
    self.size = 0
  end

  def enqueue(val)
    new_node = Node.new(val, nil)

    if (self.first.nil?)
      self.first = new_node
      self.last = new_node
    else
      self.last.next = new_node
      self.last = new_node
    end

    self.size += 1
  end

  def dequeue
    return if self.first.nil?

    temp = self.first
    if (self.first == self.last)
      self.last = nil
    end
    self.first = self.first.next
    self.size -= 1
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

q = Queue.new
q.enqueue(10)
q.enqueue(20)
q.enqueue(30)
q.enqueue(40)
q.enqueue(50)

pp q

q.dequeue
q.dequeue
q.dequeue
q.dequeue
q.dequeue

pp q
