class UpdateUsersForSlackAuth < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :password_digest, :string if column_exists?(:users, :password_digest)

    add_column :users, :slack_id, :string, null: false
    add_column :users, :name, :string
    add_column :users, :avatar_url, :string

    add_index :users, :slack_id, unique: true
  end
end
