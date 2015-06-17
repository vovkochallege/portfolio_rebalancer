require_relative "../lib/rebalancer"

RSpec.describe Portfolio::Rebalancer do
  let(:rebalancer) { Portfolio::Rebalancer.new }

  context "invalid portfolio" do
    let(:asset){ { name: "GOOG", target: 0.5, current: 0.5, shares: 0, price: 0 } }
    let(:portfolio) {[asset]}

    it "raises exception for no portfolio" do
      expect{ rebalancer.go! }.to raise_error
    end

    it "raises exception for zero price of an asset" do
      expect{ rebalancer.go!(portfolio) }.to raise_error
    end
  end

  context "valid portfolio" do
    let(:balanced_asset){ { name: "NAME", target: 0.5, current: 0.5, shares: 10, price: 1 } }
    let(:unbalanced_asset){ { name: "NAME", target: 1, current: 0.5, shares: 10, price: 1 } }
    let(:portfolio) {[]}
    let(:subject) { rebalancer.go!(portfolio) }

    context "balanced portfolio" do
      before :each do
        portfolio << balanced_asset
      end

      it "returns empty line" do
        expect( subject ).to eq("")
      end
    end

    context "unbalanced portfolio" do
      before :each do
        portfolio << unbalanced_asset
      end

      it "returns instructions to balance" do
        expect( subject ).to match(/buy \d+ shares of [A-Z]+/)
      end
    end
  end
end


 
