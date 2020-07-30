require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("sweet", 2, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("sweet")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("sweet", "2", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect do 
        dessert.add_ingredient('flour')
        (dessert.ingredients).to include('flour')
      end
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect do
        before = dessert.ingredients
        dessert.mix!
        (before).to_not eq(dessert)
      end
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect do
        before = dessert.quantity
        dessert.eat(1)
        (dessert.quantity).to be(before-1)
      end
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(20) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(chef.titleize).and_return("Chef")
      expect(dessert.serve).to eq("Chef")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      
    end
  end
end
