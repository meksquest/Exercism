const value = 42

pub fn reply(guess: Int) -> String {
  case guess {
    i if i == value -> "Correct"
    i if i == value - 1 -> "So close"
    i if i == value + 1 -> "So close"
    i if i < value - 1 -> "Too low"
    i if i > value + 1 -> "Too high"
    _ -> "Something went wonky."
  }
}
