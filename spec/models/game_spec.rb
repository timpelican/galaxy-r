require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
    it "requires new game to be in waiting state" do
      expect(subject.waiting?).to be
    end
  end
end
