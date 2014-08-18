class Gadget < ActiveRecord::Base
  belongs_to :user

  def self.search_by_name_or_description(keyword)
    where('name iLIKE ? OR description iLIKE ?', "%#{keyword}%", "%#{keyword}%")
  end
end
