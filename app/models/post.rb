class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> {order(:created_at => :desc)}, dependent: :destroy

  def belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end

  def is_liked user
    Like.find_by(user_id: user.id, post_id: id)
  end
end