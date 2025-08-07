pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(place, treasure) = place_location
  #(treasure, place)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  let second_treasure_location =
    place_location_to_treasure_location(place_location)
  second_treasure_location == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, place_location) = place

  count_matching_treasures(treasures, place_location)
}

fn count_matching_treasures(
  treasures: List(#(String, #(Int, String))),
  place_location: #(String, Int),
) -> Int {
  case treasures {
    [] -> 0
    [first_treasure, ..remaining_treasures] -> {
      let #(_, treasure_location) = first_treasure
      let matches = case
        treasure_location_matches_place_location(
          place_location,
          treasure_location,
        )
      {
        True -> 1
        False -> 0
      }
      matches + count_matching_treasures(remaining_treasures, place_location)
    }
  }
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(found_name, _) = found_treasure
  let #(place_name, _) = place
  let #(desired_name, _) = desired_treasure
  //Vintage Pirate Hat can be swapped for Model Ship in Large Bottle OR Antique Glass Fishnet Float at Harbor Managers Office
  case found_name, place_name, desired_name {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", desired
      if desired == "Crystal Crab" || desired == "Glass Starfish"
    -> True
    "Vintage Pirate Hat", place, desired
      if {
        desired == "Model Ship in Large Bottle"
        || desired == "Antique Glass Fishnet Float"
      }
      && place == "Harbor Managers Office"
    -> True
    _, _, _ -> False
  }
}
