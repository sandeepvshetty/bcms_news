class NewsArchivePortlet < Portlet

  def render
    if self.category_id.blank?
      @articles = NewsArticle.all.paginate(:page => params[:page], :per_page => self.limit,:order => "release_date desc")
    else
      @category = Category.find(self.category_id)
      @articles = NewsArticle.all.paginate(:page => params[:page], :per_page => self.limit,:conditions => ["category_id = ?", @category.id], :order => "release_date desc")
    end
  end

end