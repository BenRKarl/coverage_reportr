class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :hit_url
      t.string :hit_publication
      t.string :hit_title
      t.string :hit_author
      t.string :hit_date
      t.string :hit_sentiment

      t.timestamps
    end
  end
end
