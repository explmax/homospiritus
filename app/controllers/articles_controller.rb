class ArticlesController < ApplicationController
  before_filter :load_categories

  def load_categories
    @categories = ActiveadminBlog::BlogCategory.all
  end
end