# frozen_string_literal: true

require 'news-api'
require 'cgi'

class MyNewsItemsController < SessionController
  before_action :set_representative, except: %i[new search create]
  before_action :set_representatives_list
  before_action :set_issues_list
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.create
  end

  def search
    @news_item = NewsItem.new(news_item_params)
    @issue = params[:news_item]['issue_id']

    api_key = Rails.application.credentials[:GOOGLE_NEWS_API_KEY]
    newsapi = News.new(api_key)
    response = newsapi.get_everything(
      q:        CGI.escape([@news_item.representative.name, @issue].join(' AND ')),
      pagesize: 5
    )
    @top = response.map do |article|
      hash = {
        title:          article.title,
        description:    article.description,
        serialized_obj: article.to_json
      }
      OpenStruct.new(hash)
    end

    @available_ratings = Rating.available_rating_values

    render :search, error: 'An error occurred when searching for the news item.'
  end

  def create
    old_news_item = JSON.parse(params[:news_item_attributes], object_class: NewsItem)
    news_article = GoogleNewsEverything.parse_hash(JSON.parse(params[:news_article]))
    if NewsItem.import_google_news_object(news_article, old_news_item.representative, old_news_item.issue)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  def index
    @news_item = NewsItem.new(news_item_params)
    rep_id = params[:news_item]['representative_id'].to_s
    @rep = Representative.find(rep_id).name.to_s.split[-1].to_s
    @issue_id = params[:news_item]['issue_id']
    api_key = Rails.application.credentials[:GOOGLE_NEWS_API_KEY]
    newsapi = News.new(api_key)
    @q_val = CGI.escape("#{@rep} AND #{@issue_id.split.join(' AND ')}")
    @top = newsapi.get_everything(q: @q_val, pagesize: 5)
    @available_ratings = Rating.available_rating_values
    render :search, error: 'An error occurred when searching for the news item.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_issues_list
    @issues_list = Issue.all.map(&:name)
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue_id)
  end
end
