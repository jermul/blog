class Article < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list
  acts_as_taggable

  validates :title,   presence: true, uniqueness: true
  validates :content, presence: true

  def self.text_search(query)
    if query.present?
      where("title @@ :q or content @@ :q", q: query)
    else
      scoped
    end
  end
end