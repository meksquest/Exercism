import gleam/string

pub fn first_letter(name: String) {
  let assert Ok(first_letter) = name |> string.trim |> string.first
  first_letter
}

pub fn initial(name: String) {
  name |> first_letter |> string.uppercase |> string.append(".")
}

pub fn initials(full_name: String) {
  case string.split(full_name, " ") {
    [first_name, last_name] -> {
      let first_initial = first_name |> initial
      let last_initial = last_name |> initial

      first_initial <> " " <> last_initial
    }
    _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let initials_1 = initials(full_name1)
  let initials_2 = initials(full_name2)

  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials_1 <> "  +  " <> initials_2 <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
