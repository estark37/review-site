class Language < ActiveRecord::Base
  attr_accessible :name
  has_many :snippets

  validates :name, :presence => true
end
