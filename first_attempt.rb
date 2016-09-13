class Tree
  attr_accessor :children, :value

  def initialize(v)
    @value = v
    @children = []
  end

end

class KnightMoves
  attr_accessor :start, :scan

  def initialize(start)
    @start = start
    @scan = []
    @tree = nil
    @child = []
    valid_moves(@start)
  end

  def moves_tree(move)
    if @tree.nil?
      @tree = start
    end
      @child << move

      @tree << @child

      @tree.flatten!(1)

    print @tree
    #print @child
     # print tree.children[0].move
  end


  def valid_moves(ary)
        @scan = []
      a, b, c, d, e, f, g, h = [], [], [], [], [], [], [], []

    ary.map.with_index do |value, index|
      a << value - (index.even? ? 1 : 2)
      b << value - (index.even? ? 2 : 1)
      c << value + (index.even? ? 1 : 2)
      d << value + (index.even? ? 2 : 1)
      e << (index.even? ? value - 2 : value + 1)
      f << (index.even? ? value - 1 : value + 2)
      g << (index.even? ? value + 1 : value - 2)
      h << (index.even? ? value + 2 : value - 1)
      end
    @scan = [a, b, c, d, e, f, g, h]

    @scan.delete_if { |x| ary.include? x }

    out_of_bounds(@scan)

    scan_to_tree
    #somewhere here, we need to push valid to the tree.

  # @scan.each do |x|
#       valid_moves x
#    end
  end

  def out_of_bounds(moves)

    moves.delete_if do |x|
      x.any? { |i| i < 0 || i > 7 };
    end

  end

  def scan_to_tree
    moves_tree(@scan)
  end

end

guess = KnightMoves.new([0,0])
