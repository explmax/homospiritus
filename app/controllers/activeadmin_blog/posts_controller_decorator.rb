ActiveadminBlog::PostsController.class_eval do
  #before_filter :authenticate_user!
  before_filter :set_navigation_label

  def set_navigation_label
    @nav = "blog"
  end
end