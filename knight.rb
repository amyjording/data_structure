  class Moves
    attr_reader :position, :parent

    def initialize(position, parent = nil)
      @position = position
      @parent = parent
    end
  end

    def make_board
      board = []
      x = [0, 1, 2, 3, 4, 5, 6, 7]
      y = [0, 1, 2, 3, 4, 5, 6, 7]

      x.each { |i| y.each { |n| board << [i, n] }}

    end

    def knight_moves(start, finish)
      node = Moves.new(start)
      queue = []
      visited = [] << start

      loop do
        break if node.position == finish

        possible_moves(node).each do |move|
          unless visited.include?(move)
            visited << move
            queue.unshift(Moves.new(move, node))
          end
          next
        end
        node = queue.pop
      end
      print_parents(node)
    end

    def possible_moves(node)
      x = node.position.first
      y = node.position.last
      moves = [
          [x + 2, y + 1], [x + 2, y - 1],
          [x - 2, y + 1], [x - 2, y - 1],
          [x + 1, y + 2], [x + 1, y - 2],
          [x - 1, y + 2], [x - 1, y - 2]
        ]
        moves.delete_if { |e| out_of_board?(e) }
    end

    def out_of_board?(position)
      position[0] < 0 || position[0] > 7 || position[1] < 0 || position[1] > 7
    end

    def print_parents(node)
      path = [] << node.position
      until node.parent.nil?
        path << node.parent.position
        node = node.parent
      end

    puts "The knight reached destination in #{path.size - 1} moves. Here's how:"
    path.reverse.each { |move| p move }
  end

  knight_moves([0, 0], [6, 6])
  knight_moves([0, 0], [3, 3])
  knight_moves([1, 2], [4, 7])
