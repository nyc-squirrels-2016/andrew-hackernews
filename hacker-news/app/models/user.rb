class User < ActiveRecord::Base
  has_many :post_votes
  has_many :comment_votes
  has_many :posts
  has_many :comments
  validates :username, presence: true, uniqueness: true
  has_secure_password

  def post_voted?(post)
    post.post_votes.pluck(:user_id).include?(self.id)
  end

  def comment_voted?(comment)
    comment.comment_votes.pluck(:user_id).include?(self.id)
  end

end
