
class Node
  attr_accessor :value, :child_left, :child_right, :parent_node

  def initialize(value=nil, child_left=nil, child_right=nil, parent_node = nil)
    @value = value
    @child_right = child_right
    @child_left = child_left
    @parent_node = parent_node
  end
end

class BinaryTree
  attr_reader :root_node

  def initialize(value = nil)
    @root_node = Node.new(value)
  end

  def build_tree(arr)
    arr.each { |node| insert node }
  end

  def insert(value)
    if @root_node.nil?
      @root_node = Node.new(value)
    else
      insert_at_node(@root_node, value)
    end
  end

  def insert_at_node(node, value)
    return Node.new(value) if not node
    if node.value > value
      node.child_left = insert_at_node(node.child_left, value)
    elsif node.value < value
      node.child_right = insert_at_node(node.child_right, value)
    end
    return node
  end

  def search(value)
    return nil if @root_node.nil?
    return search_at_node(@root_node, value)
  end

  def search_at_node(node, value)
    return nil if node.nil?

    return node if value == node.value
    return search_at_node(node.child_left, value) if value < node.value
    return search_at_node(node.right_right, value)
  end

  def size
    return get_size(@root_node, 0) - 1
  end

  def get_size(node, size)
    unless node
      return 1
    end
    return size_rec(node.child_left, size) + size_rec(node.child_right, size)
  end

  def view_tree(current_node = @root_node)
    current = current_node.value
    left = current_node.child_left == nil ? "nil" : current_node.child_left.value
    right = current_node.child_right == nil ? "nil" : current_node.child_right.value
      if current_node.child_left == nil && current_node.child_right == nil
        puts "Node #{current}: Is a Leaf Node"
      else
        puts "Node #{current}: Left: #{left} | Right: #{right}"
      end
    view_tree(current_node.child_left) if current_node.child_left != nil
    view_tree(current_node.child_right) if current_node.child_right != nil
  end

  def bfs(key)
    search = [@root_node]
    until search.empty?
      current = search.shift
      return current if current.value == key
      search.push current.child_left unless current.child_left.nil?
      search.push current.child_right unless current.child_right.nil?
    end
    nil
  end

  def dfs(key)
    search = [@root_node]
    until search.empty?
      current = search.pop
      return current if current.value == key
      search.push current.child_right unless current.child_right.nil?
      search.push current.child_left unless current.child_left.nil?
    end
    nil
  end

  def dfs_rec(key)
    dfs_rec_engine(key, @root_node)
  end

  def dfs_rec_engine(key, node)
    return nil if node.nil?
    return node if node.value == key

    left_search = dfs_rec_engine(key, node.child_left)
    return left_search unless left_search.nil?
    right_search = dfs_rec_engine(key, node.child_right)
    return right_search unless right_search.nil?
    nil
  end

  def levels
    return levels_rec(@root_node , 0)
  end

  def levels_rec(node , levels)
    return levels if not node
    levels += 1
    left_level = levels_rec(node.child_left , levels)
    right_level = levels_rec(node.child_right , levels)
    return (left_level > right_level ? left_level : right_level)
  end

end


mytree = BinaryTree.new(18)
mytree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts "The Binary Tree"
puts mytree.view_tree,""

puts "BFS Mode"
puts mytree.bfs(9)
puts mytree.bfs(67),""

puts "DFS Mode"
puts mytree.dfs(23)
puts mytree.dfs(7),""

puts "DFS recursive"
puts mytree.dfs_rec(8),""

puts "Levels"
puts mytree.levels







# (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
