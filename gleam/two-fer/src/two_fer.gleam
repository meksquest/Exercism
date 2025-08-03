import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  let term_of_address = case name {
    Some(name) -> name
    None -> "you"
  }
  "One for " <> term_of_address <> ", one for me."
}
