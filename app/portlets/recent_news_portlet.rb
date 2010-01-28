class RecentNewsPortlet < Portlet
  
  def render
    order = "release_date DESC"
    if !@portlet.sort_by.blank? and !@portlet.sort_order.blank?
      order = "#{@portlet.sort_by} #{@portlet.sort_order}"
    end

    if @portlet.category_id.blank?
      @articles = NewsArticle.all.paginate(:page => params[:page], :per_page => @portlet.limit,:order => order)
    else
      @category = Category.find(@portlet.category_id)
      @articles = NewsArticle.all.paginate(:page => params[:page], :per_page => @portlet.limit,:conditions => ["category_id = ?", @category.id], :order => order)
    end
  end
    
end