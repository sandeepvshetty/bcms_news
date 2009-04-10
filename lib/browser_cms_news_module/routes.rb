module Cms::Routes
  def routes_for_browser_cms_news_module
    
    news_article '/news/articles/:year/:month/:day/:slug',
      :controller => 'cms/content',
      :action => 'show',
      :page_path => ['news','article'],
      :prepare_with => {
        :content_type => 'NewsArticle',
        :method => 'prepare_params_for_details!'
      },
      :year => /\d{4,}/,
      :month => /\d{2}/,
      :day => /\d{2}/
    
    news_articles '/news/articles.:format', :controller => "news_articles", :conditions => {:method => :get}
    
    namespace(:cms) do |cms|
      cms.content_blocks :news_articles
    end  
  end
end
