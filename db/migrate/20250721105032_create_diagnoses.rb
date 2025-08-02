class CreateDiagnoses < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnoses do |t|
      t.string :relation_level
      t.string :mood_preference
      t.string :priority_point
      t.string :genre_preference
      t.string :avoid_point
      t.string :access_preference
      t.string :extra_needs

      t.timestamps
    end
  end
end
