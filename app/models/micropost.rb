class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user # liaison avec entite user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140} 
  # par defaut extraction en ordre decroissant de created_at
  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
  # Convient pour un nombre reduit de followeds
  # followed_user_ids = user.followed_user_ids
  # where("user_id IN (?) OR user_id = ?", followed_user_ids, user)

  # Sinon utilisation de SQL subselect :

  followed_user_ids = "SELECT followed_id FROM relationships
                 WHERE follower_id = :user_id"
  where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
  user_id: user.id)
  end

end
