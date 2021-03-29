require_relative '../lib/game_logic'

describe Board do
  describe '#check_valid_move' do
    it 'valid move returns true' do
      board1 = Board.new
      expect(board1.check_valid_move(3)).to eql(true)
    end

    it 'invalid move do not returns true' do
      board1 = Board.new
      expect(board1.check_valid_move(55)).not_to eql(true)
    end
  end

  describe '#win' do
    it 'winner player returns true' do
      board = Board.new
      player1 = Player.new('x')
      board.square[0] = player1.letter
      board.square[1] = player1.letter
      board.square[2] = player1.letter
      expect(board.win(player1)).to eql(true)
    end

    it 'empty board returns false' do
      board = Board.new
      player1 = Player.new('x')
      expect(board.win(player1)).to eql(false)
    end

    it 'a losing player returns false' do
      board = Board.new
      player1 = Player.new('x')
      board.square[0] = player1.letter
      expect(board.win(player1)).to eql(false)
    end
  end

  describe '#draw' do
    it 'return true if the game is over' do
      board = Board.new
      player1 = Player.new('x')
      board.square[0] = player1.letter
      board.square[1] = player1.letter
      board.square[2] = player1.letter
      board.square[3] = player1.letter
      board.square[4] = player1.letter
      board.square[5] = player1.letter
      board.square[6] = player1.letter
      board.square[7] = player1.letter
      board.square[8] = player1.letter
      expect(board.draw).to eql(true)
    end
  end
end


