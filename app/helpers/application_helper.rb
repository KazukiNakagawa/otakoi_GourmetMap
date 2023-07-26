module ApplicationHelper
  def link_hashtags(text)
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end

  def google_maps_link(address)
    "https://www.google.com/maps/search/#{CGI.escape(address)}"
  end

  def page_title(page_title = '')
    base_title = 'オタ恋グルメマップ'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
