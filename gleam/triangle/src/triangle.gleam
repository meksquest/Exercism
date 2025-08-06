pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && is_triangle(a, b, c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case a, b, c {
    a, b, c if a == c -> is_triangle(a, b, c) && True
    a, b, c if a == b -> is_triangle(a, b, c) && True
    a, b, c if b == c -> is_triangle(a, b, c) && True
    _, _, _ -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  !equilateral(a, b, c) && !isosceles(a, b, c) && is_triangle(a, b, c)
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  let no_side_0 = a != 0.0 && b != 0.0 && c != 0.0
  no_side_0 && { a +. b >=. c } && { b +. c >=. a } && { a +. c >=. b }
}
