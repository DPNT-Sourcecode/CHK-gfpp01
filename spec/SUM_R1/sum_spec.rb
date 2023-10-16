require '../spec_helper'

describe Sum do
    it "add the two numbers" do
        expect(Sum.new.sum(1, 2)).to eq 3
    end
end