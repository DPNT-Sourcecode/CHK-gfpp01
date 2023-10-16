require_solution 'HLO'

describe Hello do
    it "says hello to the world" do
        expect(described_class.new.hello("test")).to eq "Hello, World!"
    end
end
