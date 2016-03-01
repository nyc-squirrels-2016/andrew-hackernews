class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_votes
  validates :body, presence: true
  validates :user_id, presence: true

  def vote_count
    vote_object = CommentVote.where(comment_id: self.id)
    total_count = vote_object.reduce(0){|sum, n| sum + n.total}
  end
end
