import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed_remark = string.trim(remark)
  let is_question = string.ends_with(trimmed_remark, "?")
  let is_yelled =
    trimmed_remark != ""
    && string.uppercase(trimmed_remark) == trimmed_remark
    && string.lowercase(trimmed_remark) != trimmed_remark
  let is_silence = trimmed_remark == ""

  case is_question, is_yelled, is_silence {
    _, _, True -> "Fine. Be that way!"
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}
