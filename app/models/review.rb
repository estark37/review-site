class Review < ActiveRecord::Base
  attr_accessible :contents, :line
  belongs_to :user
  belongs_to :snippet

  validates :user_id, :presence => true
  validates :contents, :presence => true
  validates :user_id, :presence => true
  validates :snippet_id, :presence => true

  default_scope :order => 'reviews.created_at DESC'

end
