# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    if page_title
      content_for(:title) { page_title }
    else
      content_for(:title) { "Linkatory" }
    end
  end
end
