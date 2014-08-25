RSpec.describe Team type: :model do
  it "has a valid factory" do
    expect(create(:team)).to be_valid
  end
end
