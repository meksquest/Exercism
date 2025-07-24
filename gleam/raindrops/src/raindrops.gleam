import gleam/int.{remainder, to_string}
import gleam/string.{is_empty}

pub fn convert(number: Int) -> String {
  let result =
    ""
    |> raindrop(number, 3, "Pling")
    |> raindrop(number, 5, "Plang")
    |> raindrop(number, 7, "Plong")

  case is_empty(result) {
    True -> to_string(number)
    False -> result
  }
}

fn raindrop(acc: String, number: Int, divisor: Int, sound: String) -> String {
  case remainder(number, divisor) {
    Ok(0) -> acc <> sound
    _ -> acc
  }
}
