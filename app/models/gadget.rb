class Gadget < ActiveRecord::Base
  belongs_to :user
  has_many :photos, inverse_of: :gadget, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  def self.search_by_name_or_description(keyword)
    where('name iLIKE ? OR description iLIKE ?', "%#{keyword}%", "%#{keyword}%")
  end
end
