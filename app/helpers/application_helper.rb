module ApplicationHelper

  # Returns a base title on a per-page basis, or base title | page title when included.
  def full_title(page_title)
  	base_title = "Little Okins"
  	return base_title if page_title.empty?
  	return "#{base_title} | #{page_title}"
  end
  
end
