class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |us|
        us.string :name
        us.string :password
        us.string :email
        # us.string :remember_session
    end
  end
end
