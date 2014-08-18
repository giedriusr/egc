require 'rails_helper'

RSpec.describe Gadget, type: :model do
  describe 'relations' do
    it 'belongs to a user' do
      gadget = create(:gadget, user: create(:user))
      expect(gadget.user.email).to eq('test@email.com')
    end
  end

  describe '#search_by_name_or_description' do
    it 'finds by name' do
      create(:gadget, name: 'coolest gadget')
      gadgets = Gadget.search_by_name_or_description('cool')
      expect(gadgets.count).to eq(1)
    end
  end
end
