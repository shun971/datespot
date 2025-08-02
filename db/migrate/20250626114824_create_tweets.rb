class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :mood
      t.string :station
      t.string :price
      t.string :genre

      t.timestamps
    end
  end
end
