module ApplicationHelper
  def link_hashtags(text)
    text.gsub(/#(\w+)/) { |match| link_to(match, hashtag_path($1)) }
  end
end
