class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user # liaison avec entite user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140} 
  # par defaut extraction en ordre decroissant de created_at
  default_scope order: 'microposts.created_at DESC'
end
