class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :email, :name
  belongs_to :article

  validates :name, :email, :body, :presence => true
  validate :article_should_be_published

  #after_create :email_article_author

  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end

  # def email_article_author
  #   puts "We wil notify the #{article.user.email} in Chapter 9"
  # end
end
