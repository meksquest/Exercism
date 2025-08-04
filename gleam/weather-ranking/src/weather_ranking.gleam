import gleam/float
import gleam/list
import gleam/order.{type Order}

const shift: Float = 32.0

const scale: Float = 1.8

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. shift } /. scale
}

fn coerce_celsius(t: Temperature) {
  case t {
    Celsius(t) -> t
    Fahrenheit(t) -> fahrenheit_to_celsius(t)
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  float.compare(coerce_celsius(left), coerce_celsius(right))
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(city_a, city_b) {
    compare_temperature(city_a.temperature, city_b.temperature)
  })
}
