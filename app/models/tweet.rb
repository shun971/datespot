class Tweet < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user 
    has_many :tweet_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :tweet_tag_relations, dependent: :destroy
   has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end