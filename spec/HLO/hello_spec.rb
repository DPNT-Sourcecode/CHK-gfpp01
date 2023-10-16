require_solution 'HLO'

describe Hello do
    let(:friend_name) { "test" }

    it "says hello to the friend" do
        expect(described_class.new.hello("test")).to eq "Hello, #{friend_name}!"
    end
end

