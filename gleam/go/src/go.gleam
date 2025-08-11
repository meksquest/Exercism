import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let res =
    Ok(game)
    |> result.try(rule1)
    |> result.try(rule3)
    |> result.try(rule4)

  case res {
    Error(err) -> Game(..game, error: err)
    Ok(updated_game) ->
      Game(..updated_game, player: switch_player(updated_game.player))
      |> rule2()
  }
}

fn switch_player(player) {
  case player {
    Black -> White
    White -> Black
  }
}
