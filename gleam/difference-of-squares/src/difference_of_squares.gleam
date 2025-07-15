import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let numbers = list.range(1, n)
  let assert Ok(sum) = numbers |> list.reduce(fn(acc, x) { acc + x })
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  let numbers = list.range(1, n)
  let assert Ok(sum) = numbers |> list.reduce(fn(acc, x) { acc + { x * x } })
  sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
