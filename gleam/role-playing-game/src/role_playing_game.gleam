import gleam/int.{max}
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    0, level if level > 9 ->
      Some(Player(..player, health: 100, mana: option.Some(100)))
    0, _ -> Some(Player(..player, health: 100))
    _, _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) ->
      case mana {
        m if m < cost -> #(player, 0)

        m -> #(Player(..player, mana: Some(m - cost)), cost * 2)
      }

    None -> #(Player(..player, health: player.health - cost |> max(0)), 0)
  }
}
