import gleam/list
import gleam/string

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  list.count(languages, fn(a) { !string.is_empty(a) })
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    [first] if first == "Gleam" -> True
    [first, ..] if first == "Gleam" -> True
    [_first, second] if second == "Gleam" -> True
    [_first, second, _] if second == "Gleam" -> True
    _ -> False
  }
}
