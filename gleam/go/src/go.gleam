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
  let game = rule_check(game, rule1) |> rule_check(rule3) |> rule_check(rule4)
  case game {
    Game(
      error: "",
      player: player,
      white_captured_stones: _,
      black_captured_stones: _,
    ) -> Game(..game, player: switch_player(player)) |> rule2()
    _ -> game
  }
}

fn rule_check(game: Game, rule: fn(Game) -> Result(Game, String)) -> Game {
  case game |> rule {
    Ok(game) -> game
    Error(msg) -> Game(..game, error: msg)
  }
}

fn switch_player(player: Player) -> Player {
  case player {
    White -> Black
    Black -> White
  }
}
