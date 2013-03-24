module ArticlesHelper
  def join_tags(article)
  	article.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
  end
end
