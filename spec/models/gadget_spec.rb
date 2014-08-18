require 'rails_helper'

RSpec.describe Gadget, type: :model do
  describe 'relations' do
    it 'belongs to a user' do
      gadget = create(:gadget, user: create(:user))
      expect(gadget.user.email).to eq('test@email.com')
    end
  end
end
