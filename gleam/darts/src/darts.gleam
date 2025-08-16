pub fn score(x: Float, y: Float) -> Int {
  let dist2 = x *. x +. y *. y

  case dist2 {
    d if d <=. 1.0 -> 10
    d if d <=. 25.0 -> 5
    d if d <=. 100.0 -> 1
    _ -> 0
  }
}
