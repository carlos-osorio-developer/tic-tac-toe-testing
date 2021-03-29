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

    describe "#win" do
      it "winner player returns true" do
        board = Board.new
        player1 = Player.new("x")
        board.square[0] = player1.letter
        board.square[1] = player1.letter
        board.square[2] = player1.letter
        expect(board.win(player1)).to eql(true) 
      end
    end
  end