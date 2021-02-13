require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
    it "requires new game to be in waiting state" do
      expect(subject.waiting?).to be
    end
    it "requires deleted game to delete all attached races" do
      subject.name = "Alpha"
      subject.save!
      race = subject.races.create(name: "Bob")
      race.save!
      subject.destroy!
      # Should be no Races left in the DB at this point
      # TODO: this is likely to fail as soon as we have fixtures
      # TODO: find a better way to test
      race = Race.take
      expect(race).to be_nil
    end
  end
end
