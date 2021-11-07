class CreateWeblinks < ActiveRecord::Migration[6.1]
  def change
    create_table :weblinks do |t|
      t.string :link
      t.string :short_link
      t.integer :click_count

      t.timestamps
    end
  end
end
