class CreateApiV1Chirps < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_chirps do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
