import gleam/list
import gleam/string

pub fn reverse(value: String) -> String {
  string.to_graphemes(value)
  |> list.reverse
  |> string.concat
}
