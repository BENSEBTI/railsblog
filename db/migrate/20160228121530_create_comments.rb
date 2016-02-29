class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.string :email
      t.text :commentaire
      t.references :article, index: true, foreign_key: true
      t.timestamps
    end
  end
end
