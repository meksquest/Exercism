import gleam/float
import gleam/result

pub fn score(x: Float, y: Float) -> Int {
  let distance_squared =
    float.square_root(x *. x +. y *. y) |> result.unwrap(0.0)
  case distance_squared {
    d if d <=. 1.0 -> 10
    d if d <=. 5.0 -> 5
    d if d <=. 10.0 -> 1
    _ -> 0
  }
}
