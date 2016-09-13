class Tree
  attr_accessor :children, :value

  def initialize(v)
    @value = v
    @children = []
  end
end

t = Tree.new(7)
t.children << Tree.new(3)
t.children << Tree.new(11)

puts t.value              # 7
puts t.children[0].value  # 3
puts t.children[1].value  # 11
