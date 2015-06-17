module Portfolio
  class Rebalancer

    def initialize(portfolio = [])
      @portfolio = portfolio
    end

    def go!(portfolio = @portfolio)
      raise Exception.new("Empty Portfolio") if portfolio.empty?

      @results = portfolio.map do |asset|
        raise Exception.new("Price can't be null") if asset[:price] == 0
 
        target_delta = asset[:target] - asset[:current]
        total_amount = asset[:shares] * asset[:price]
        room_amount = total_amount * target_delta

        delta_shares = (room_amount / asset[:price]).round

        verb = if delta_shares < 0 
          "sell"
        else
          "buy"
        end

        unless delta_shares == 0
          "#{verb} #{delta_shares.abs} shares of #{asset[:name]}"
        end
      end.compact()

      @results.join(", ")
    end

  end
end
