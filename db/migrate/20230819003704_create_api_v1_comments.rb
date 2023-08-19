class CreateApiV1Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :api_v1_chirp, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
