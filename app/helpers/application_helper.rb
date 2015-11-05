# Common functions accessible in all views
module ApplicationHelper
  # :reek:FeatureEnvy
  def gravatar_for(user, options = { size: 80 })
    g_id = Digest::MD5.hexdigest user.email
    g_url = "https://secure.gravatar.com/avatar/#{g_id}?s=#{options[:size]}"

    image_tag(g_url, alt: user.username, class: 'img-circle gravatar')
  end
end
