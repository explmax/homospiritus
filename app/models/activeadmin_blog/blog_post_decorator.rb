ActiveadminBlog::BlogPost.class_eval do
  def excerpt
    html = Nokogiri::HTML(content)
    begin
      ps = html.css('p').select{|p| not p.content.empty? }
      p1 = ps[0].content
      p2 = ps[1].content
      "<p>#{p1}</p><p>#{p2}</p>"
    rescue
      ""
    end
  end

  scope :without_images, where(:tags.ne => 'image')

  paginates_per 100
end