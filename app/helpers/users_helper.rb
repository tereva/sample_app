module UsersHelper

# Returns the Gravatar (http://gravatar.com/) for the given user.
   def gravatar_for(user, options = { size: 50})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    #gravatar_url ="https://secure.gravatar.com/avatars/#{gravatar_id}.png?s=#{size}"

    gravatar_url = "tv.jpg"    
    if size==30 then gravatar_url="tv50.jpg" end  
    image_tag(gravatar_url, alt: user.name, class: "gravatar")

   end
end

