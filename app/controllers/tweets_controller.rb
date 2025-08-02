class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
def index
  @tweets = Tweet.all
  if params[:search] != nil && params[:search] != ''
      @tweets = Tweet.where("mood LIKE ? OR station LIKE ? OR genre LIKE ?", 
                    "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
  end
  if params[:tag_ids].present?
      tweet_ids = []
      params[:tag_ids].each do |key, value|
          if value == "1"
            tag_tweets = Tag.find_by(name: key).tweets
            @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
            puts key
          end
      end
      tweet_ids = tweet_ids.uniq
      @tweets = @tweets.where(id: tweet_ids) if tweet_ids.present?
  end
end
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id

    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:mood, :station, :price, :genre, :image, :overall,:sterrating, tag_ids: [])
  end
end
