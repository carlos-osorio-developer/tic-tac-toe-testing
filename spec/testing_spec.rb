require_relative '../bin/main.rb'
require_relative '../lib/game_logic.rb'

describe Board do
    
    describe "#make_a_move" do      
      it "replace a number with the marker for a valid move" do        
        board1 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(board1.make_a_move("X", "X")).to eql(2)
      end
    end
  end