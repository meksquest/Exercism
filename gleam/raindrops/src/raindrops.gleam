import gleam/int

pub fn convert(number: Int) -> String {
  case number {
    _ if number % 105 == 0 -> "PlingPlangPlong"
    _ if number % 35 == 0 -> "PlangPlong"
    _ if number % 21 == 0 -> "PlingPlong"
    _ if number % 15 == 0 -> "PlingPlang"
    _ if number % 3 == 0 -> "Pling"
    _ if number % 5 == 0 -> "Plang"
    _ if number % 7 == 0 -> "Plong"
    _ -> int.to_string(number)
  }
}
