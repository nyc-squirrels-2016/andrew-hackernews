class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_votes
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true

  def vote_count
    vote_object = PostVote.where(post_id: self.id)
    total_count = vote_object.reduce(0){|sum, n| sum + n.total}
  end

end
