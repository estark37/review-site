class Snippet < ActiveRecord::Base
  attr_accessible :code, :title, :language_id
  belongs_to :user

  validates :user_id, :presence => true
  validates :code, :presence => true
  validates :title, :presence => true
  validates :language_id, :presence => true

  default_scope :order => 'snippets.created_at DESC'
end
