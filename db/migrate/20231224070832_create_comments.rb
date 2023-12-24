class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :comments, :articles, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade
  end
end
