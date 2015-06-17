##Wealthsimple coding challenge
Hey! This is my submission to Wealthsimple coding challenge.
This is a simple Portfolio rebalancer module that looks into current investment portfolio and outputs a set of buys and sells.

###Usage:
```
require_relative "lib/rebalancer"
rebalancer = Portfolio::Rebalancer.new(portfolio)
puts rebalancer.go!
```
Included example:
```
ruby app.rb
```

###Output:
```
buy X shares of FOO, sell Y shares of BAR
```

###Testing:
This module uses Rspec. Run tests with:
```
rspec specs/
```

###TODO (if were to spend additional time on the project i would):
 - Portfolio rebalancing based on the total amount of portfolio and share rebalancing between assets
 - Proper portfolio validation
 - Flexible API
   - Combine portfolios, add/remove assets
   - Different kinds of output formats
 - Thorough testing, include tests for big portfolios
 - Package module as a gem


## Thank you!

