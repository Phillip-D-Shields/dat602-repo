// cheeky console board display
const printBoard = () => {
    let board = [...Array(STATE.grid_size)].map((_) => Array(STATE.grid_size).fill("_"));
    // console.log(board);
    board.forEach(row => row += "\n");
    playerOne_segs.forEach(seg => {
        const segCoordinates = seg[2];
        // console.log(segCoordinates);
        board[segCoordinates[0]][segCoordinates[1]] = "1";
    })
    playerTwo_segs.forEach(seg => {
      const segCoordinates = seg[2];
    //   console.log(segCoordinates);
      board[segCoordinates[0]][segCoordinates[1]] = "2";
    })
    return console.log(board.map(row => row.join(" ") + "\n").join(""))
}



const STATE = {
    // [player_id, [x.velocity, y.velocity]]
    players: [
      [1, [0, 1]],
      [2, [1, 0]],
    ],
    snakes_segs: [
      //   [seg_id, player_id, [x.coordinate, y.coordinate]]
      [1, 1, [1, 3]],
      [2, 1, [1, 4]],
      [3, 1, [1, 5]],
      [4, 2, [5, 2]],
      [5, 2, [5, 3]],
      [6, 2, [5, 4]],
    ],
    grid_size: 10,
  };
  
  // CREATE player tables
  let [playerOne, playerTwo] = [...STATE.players];
  
  // console.log(playerOne);
  // console.log(playerTwo);
  
  // WHERE that filters according to player ID in snake_segs
  const segFilter = (inputArray) => {
    let result = [[], []];
    inputArray.forEach((seg) => {
      // console.log(seg);
      var player = seg[1];
      // console.log(player);
      result[`${player - 1}`].push(seg);
    });
  
    return result;
  };
  
  // CREATE player_segs table for each player
  let [playerOne_segs, playerTwo_segs] = segFilter(STATE.snakes_segs);
  
  console.log('board before update');
  printBoard();

//   console.log('PlayerOne_segs before first update');
//   console.log(playerOne_segs);
//   console.log('PlayerTwo_segs before first update');
//   console.log(playerTwo_segs);
  
  // helper function to check any border breach
  const updateIsClear = (x) => {
      return x > 0 && x <= STATE.grid_size;
  }
  
  //  UPDATE and INSERT new head position into STATE
  const updatePosition = (playerSegs, playerVelocity) => {
    // the last element will be the head, easier to find and move from the head
    const playerHead = playerSegs[playerSegs.length - 1];
  //   console.log(playerHead);
    const playerHeadPosition = playerHead[2];
  //   console.log(playerHeadPosition);
  
    // new segment to INSERT into STATE.snake_segs 
    let newSegment = [(STATE.snakes_segs.length + 1), playerHead[1], []];
  
    // UPDATE new segment with acceptable movement
    // throws error if position is off board
    playerHeadPosition.forEach((_, idx) => {
      const newHeadPosition = playerHeadPosition[idx] + playerVelocity[idx];
  
      if (!updateIsClear(newHeadPosition)) throw Error('out of play');
      else newSegment[2].push(newHeadPosition);
    });
  
    // INSERT new head into snake_segs
    STATE.snakes_segs.push(newSegment);
  };
  
  // UPDATE each players snake according to current velocity
  updatePosition(playerOne_segs, playerOne[1]);
  updatePosition(playerTwo_segs, playerTwo[1]);
  
  // UPDATE each players_segs with updated state
  [playerOne_segs, playerTwo_segs] = segFilter(STATE.snakes_segs);
  
//   console.log('PlayerOne_segs after first update');
//   console.log(playerOne_segs);
//   console.log('PlayerTwo_segs after first update');
//   console.log(playerTwo_segs);

console.log('board after update');
  printBoard();