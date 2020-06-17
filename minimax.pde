
void bestMove() {
  // AI to make its turn
  if (turn=='O') {
    int bestScore = -10000;
    PVector move= new PVector( 0, 0 );
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (board.squares[i][j].type == 'E') {
          board.squares[i][j].type= 'O';
          int score = minimax(board, false);
          board.squares[i][j].type = 'E';
          if (score > bestScore) {
            bestScore = score;
            move = new PVector( i, j );
          }
        }
      }
    }
    board.squares[(int)move.x][(int)move.y].type = 'O';
    turn='X';
  }
}



int minimax(Board b, boolean isMaximizing) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {

      char result=b.Won();
      if (result!='E') {
        if (result=='X') {
          return -10;
        } else
          return 10;
      }
      if(b.Draw()){
        return 0;
      }
    }
  }


  if (isMaximizing) {
    int bestScore = -10000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (b.squares[i][j].type == 'E') {
          b.squares[i][j].type = 'O';//changed
          int score = minimax(b, false);
          b.squares[i][j].type = 'E';
          bestScore = max(score, bestScore);
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = 10000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (b.squares[i][j].type == 'E') {
          b.squares[i][j].type = 'X';
          int score = minimax(board, true);
          b.squares[i][j].type = 'E';
          bestScore = min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}
