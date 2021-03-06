class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @list = List.find params[:id]
    set_meta_tags description: ActionView::Base.full_sanitizer.sanitize(@list.description)
    @articles = @list.articles.where(state: 0).page(params[:page]).per(10)
    @category = @list.category
    @popular_articles = @category.articles.unscoped.where(state: 0).order(view: :desc).limit(4)
    @relate_articles = @category.articles.where(state: 0).limit(4)
  end
end
