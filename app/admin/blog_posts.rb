ActiveAdmin.register ActiveadminBlog::BlogPost, :as => "Post" do
  menu :label => "Blog"

  actions :all, :except => [:show]

  controller do
    def index
      redirect_to all_admin_posts_path
    end
  end

  form do |f|
    render :partial => "form", :locals => { :f => f }
  end

  collection_action :tags, :method => :get do
    tags = ActiveadminBlog::BlogPost.all.collect{ |p| p.tags }.join(",").split(',').uniq
    render :json => tags
  end

  collection_action :all do
    @page_title = "All Posts"
    @posts      = ActiveadminBlog::BlogPost.all.without_images
    @categories = ActiveadminBlog::BlogCategory.all
  end
end
