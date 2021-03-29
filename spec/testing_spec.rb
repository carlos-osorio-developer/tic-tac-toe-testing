require_relative '../bin/main.rb'
require_relative '../lib/game_logic.rb'

describe Board do
    describe "#check_valid_move" do      
      it "valid move returns true" do        
        board1 = Board.new
        expect(board1.check_valid_move(3)).to eql(true)
      end

      it "invalid move do not returns true" do        
        board1 = Board.new
        expect(board1.check_valid_move(55)).not_to eql(true)
      end
    end
  end