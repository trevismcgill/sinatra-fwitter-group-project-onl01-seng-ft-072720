class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |x|
      x.string :username
      x.text :email
      x.string :password_digest
    end
  end
end
