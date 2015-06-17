require_relative "lib/rebalancer"

portfolio = [
  {
    name: "GOOG",
    target: 0.6,
    current: 0.5096,
    shares: 52,
    price: 98
  },
  {
    name: "APPL",
    target: 0.3,
    current: 0.2992,
    shares: 136,
    price: 22
  },
  {
    name: "TSLA",
    target: 0.1,
    current: 0.1912,
    shares: 239,
    price: 8
  }
]

rebalancer = Portfolio::Rebalancer.new(portfolio)
puts rebalancer.go!
