ActiveadminBlog::PostsController.class_eval do
  before_filter :authenticate_user!, only: [:show]

  def index
    @posts = ActiveadminBlog::BlogPost.published
    @posts = @posts.without_images
    @posts = @posts.page params[:page]
  end

  def search
    @search_query  = params[:q]
    @posts = ActiveadminBlog::BlogPost.blog_search(@search_query)
    @posts = @posts.page params[:page]
  end

  def category
    category_slug   = params[:slug]
    @category       = ActiveadminBlog::BlogCategory.where(slug: category_slug).first()
    @category_index = @blog_categories.to_a.index{ |c| c.slug == @category.slug } 
    
    if @category.slug == 'plakaty-sieminarov'
      @posts = ActiveadminBlog::BlogPost.published_in_category(category_slug)
      @posts = @posts.page params[:page]

      render 'images'
    else
      @posts = ActiveadminBlog::BlogPost.published_in_category(category_slug)
      @posts = @posts.without_images
      @posts = @posts.page params[:page]

      render 'category'
    end
  end
end