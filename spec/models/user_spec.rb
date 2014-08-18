require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it 'has many gadgets' do
      user = create(:user)
      create_list(:gadget, 5, user: user)
      expect(user.gadgets.size).to eq(5)
    end
  end
end
