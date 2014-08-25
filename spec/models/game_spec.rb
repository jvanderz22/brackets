RSpec.describe Game, type: :model do
  it "has a valid factory" do
    expect(create(:game)).to be_valid
  end
end
