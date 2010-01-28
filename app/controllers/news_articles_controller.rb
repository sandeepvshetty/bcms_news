class NewsArticlesController < ApplicationController
  
  def index
    @articles = NewsArticle.released.paginate(:page => params[:page], :per_page => 15, :order => "release_date desc")
  end
  
end