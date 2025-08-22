import gleam/set.{type Set}

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let updated_collection =
    collection |> set.delete(my_card) |> set.insert(their_card)
  case
    set.contains(collection, my_card) && !set.contains(collection, their_card)
  {
    True -> #(True, updated_collection)
    False -> #(False, updated_collection)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  todo
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  todo
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  todo
}
