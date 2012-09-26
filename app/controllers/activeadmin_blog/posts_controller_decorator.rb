ActiveadminBlog::PostsController.class_eval do
  before_filter :authenticate_user!, only: [:show]

  def search
    @search_query  = params[:q]
    @posts = ActiveadminBlog::BlogPost.blog_search(@search_query)
    @posts = @posts.page params[:page]
  end

  def category
    category_slug   = params[:slug]
    @category       = ActiveadminBlog::BlogCategory.where(slug: category_slug).first()
    @category_index = @blog_categories.to_a.index{ |c| c.slug == @category.slug } 
    
    @posts = ActiveadminBlog::BlogPost.published_in_category(category_slug)
    @posts = @posts.page params[:page]
  end
end