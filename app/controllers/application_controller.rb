class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_blog_categories

  def set_blog_categories
  	@blog_categories = ActiveadminBlog::BlogCategory.all()
  end
end
