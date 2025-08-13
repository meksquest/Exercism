import gleam/list

pub fn today(days: List(Int)) -> Int {
  case list.first(days) {
    Ok(int) -> int
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [count, ..rest] -> [count + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case list.filter(days, fn(day_count) { day_count == 0 }) {
    [] -> False
    _ -> True
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [count, ..rest] -> count + total(rest)
    [] -> 0
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [count, ..rest] if count >= 5 -> 1 + busy_days(rest)
    [_count, ..rest] -> busy_days(rest)
    [] -> 0
  }
}
