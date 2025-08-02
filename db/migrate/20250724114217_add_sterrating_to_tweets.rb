class AddSterratingToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :sterrating, :float
  end
end
