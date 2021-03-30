require_relative '../lib/game_logic'

describe Board do
  let(:board1) { Board.new }
  let(:player1) { Player.new('x') }

  describe '#check_valid_move' do
    it 'valid move returns true' do      
      expect(board1.check_valid_move(3)).to eql(true)
    end

    it 'invalid move do not returns true' do      
      expect(board1.check_valid_move(55)).not_to eql(true)
    end
  end

  describe '#win' do
    it 'winner player returns true' do           
      board1.square[0..2] = Array.new(3,player1.letter)
      expect(board1.win(player1)).to eql(true)
    end

    it 'empty board returns false' do
      expect(board1.win(player1)).to eql(false)
    end

    it 'a losing player returns false' do     
      board1.square[0] = board1.square
      expect(board1.win(player1)).to eql(false)
    end
  end

  describe '#draw' do
    it 'return true if the game is over' do      
      board1.square[0..8] = Array.new(9,player1.letter)            
      expect(board1.draw).to eql(true)
    end
  end
end
