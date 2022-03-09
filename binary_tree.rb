require "pp"

class BinaryTree
  attr_accessor :root, :size

  def initialize
    @root = nil
    @size = 0
  end

  def add_root(val)
    @root = TreeNode.new(val)
  end

  def insert(val)
    new_node = TreeNode.new(val)
    return @root = new_node if @root == nil

    current = @root

    while true
      return false if current.val == val
      if val > current.val
        return current.right = new_node if current.right.nil?
        current = current.right
      else
        return current.left = new_node if current.left.nil?
        current = current.left
      end
    end
  end

  def find(val)
    return false if @root == nil

    current = @root
    found = false

    while current && !found
      if val > current.val
        current = current.right
      elsif val < current.val
        current = current.left
      else
        return true
      end
    end
    return false
  end

  def bfs
    node = @root
    data = []
    queue = []

    queue.push(node)

    while queue.length > 0
      node = queue.shift
      data.push(node.val)
      if node.left
        queue.push(node.left)
      end
      if node.right
        queue.push(node.right)
      end
    end

    data
  end

  def dfs_pre
    @dfs_data = []

    node = @root

    traverse(node)

    @dfs_data
  end

  def traverse(node)
    node = node
    @dfs_data << node.val

    if node.left
      traverse(node.left)
    end

    if node.right
      traverse(node.right)
    end
  end

  def dfs_post
    @dfs_data = []

    node = @root

    traverse_post(node)

    @dfs_data
  end

  def traverse_post(node)
    node = node

    if node.left
      traverse_post(node.left)
    end

    if node.right
      traverse_post(node.right)
    end

    @dfs_data << node.val
  end

  def dfs_order
    @dfs_data = []

    node = @root

    traverse_order(node)

    @dfs_data
  end

  def traverse_order(node)
    node = node

    if node.left
      traverse_order(node.left)
    end

    @dfs_data << node.val

    if node.right
      traverse_order(node.right)
    end
  end

  private

  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
      @val = val
      @left = nil
      @right = nil
    end
  end
end

tree = BinaryTree.new
tree.add_root(10)
tree.insert(6)
tree.insert(15)
tree.insert(3)
tree.insert(8)
tree.insert(20)
# tree.root.right = Node.new(5)
# tree.root.left = Node.new(7)
# tree.root.left.right = Node.new(9)

pp tree.dfs_order
