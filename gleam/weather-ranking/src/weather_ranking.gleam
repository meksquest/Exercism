import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let left_celsius = case left {
    Celsius(c_temp) -> c_temp
    Fahrenheit(f_temp) -> fahrenheit_to_celsius(f_temp)
  }

  let right_celsius = case right {
    Celsius(c_temp) -> c_temp
    Fahrenheit(f_temp) -> fahrenheit_to_celsius(f_temp)
  }

  case left_celsius, right_celsius {
    left, right if left >. right -> order.Gt
    left, right if left <. right -> order.Lt
    _, _ -> order.Eq
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(city_a, city_b) {
    compare_temperature(city_a.temperature, city_b.temperature)
  })
}
