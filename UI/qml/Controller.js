.pragma library

var player = 1

function setPlayerPlaying(e)
{
	info.playerPlaying = e ? player : 0
}

function changePlayer()
{
	player = 3 - player;
}

function enablePlay(e)
{
	setPlayerPlaying(e);
	board.canPlay = e;
}

function begin()
{
	enablePlay(true)
}

function playCol(x) {
	if (x >= board.columns) return false;

	enablePlay(false)
	var y = board.rows - 1
	while (y >= 0) {
		if (playIndex(x + y * board.columns)) {
			changePlayer()
			enablePlay(true)
			return true
		}
		y--
	}

	enablePlay(true)

	return false
}

function playIndex(index) {
	if (balls_repeater.itemAt(index).play(player)) {
		return true
	}
	else {
		return false
	}
}

function new_game()
{
	console.log("new game")
	win(Math.floor(Math.random()*2) + 1);
	reset();
}

function reset() {
	enablePlay(false)
	for (var i = 0; i < board.nbCells; i++) balls_repeater.itemAt(i).reset();
	player = 1
	enablePlay(true)
}

function win(player) {
	var obj = player == 1 ? main.info.info_player1 : main.info.info_player2
	obj.points++
}

function exit() {
	Qt.quit()
}