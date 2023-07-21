module ApplicationHelper
  def link_hashtags(text)
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end

  def google_maps_link(address)
    "https://www.google.com/maps/search/#{CGI.escape(address)}"
  end
end
