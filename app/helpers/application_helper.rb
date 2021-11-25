module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    hash = Digest::MD5.hexdigest(user.email)
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}"
    image_tag(image_src, alt: user.username, class: "rounded mx-auto d-block shadow")
  end

end
