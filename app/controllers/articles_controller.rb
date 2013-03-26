class ArticlesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).paginate(page: params[:page])
    else
      @articles = Article.text_search(params[:query]).page(params[:page]).per_page(5)
      @articles_by_month = Article.find(:all, order: "created_at DESC").group_by {
                                         |article| article.created_at.strftime("%B %Y") } #for later use in article archiving
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:success] = "Article created"
      redirect_to articles_url
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:success] = "Article updated"
      redirect_to articles_url
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:error] = "Article destroyed"
    redirect_to articles_url
  end
end
