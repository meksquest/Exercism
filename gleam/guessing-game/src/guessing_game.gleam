const value = 42

pub fn reply(guess: Int) -> String {
  case guess {
    _ if guess == value -> "Correct"
    _ if guess < value - 1 -> "Too low"
    _ if guess > value + 1 -> "Too high"
    _ -> "So close"
  }
}
