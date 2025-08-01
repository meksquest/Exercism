import gleam/option.{type Option}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    0, level if level > 9 ->
      option.Some(Player(..player, health: 100, mana: option.Some(100)))
    0, _ -> option.Some(Player(..player, health: 100))
    _, _ -> option.None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    option.None -> {
      // No mana pool: reduce health by cost, but not below 0
      let new_health = case player.health - cost {
        h if h < 0 -> 0
        h -> h
      }
      #(Player(..player, health: new_health), 0)
    }
    option.Some(mana) if mana >= cost -> {
      // Enough mana: reduce mana by cost, do damage
      #(Player(..player, mana: option.Some(mana - cost)), cost * 2)
    }
    option.Some(_) -> {
      // Not enough mana: do nothing
      #(player, 0)
    }
  }
}
