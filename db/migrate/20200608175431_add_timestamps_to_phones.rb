class AddTimestampsToPhones < ActiveRecord::Migration[6.0]
  def change
    add_column :phones, :posted_on, :datetime
    add_column :phones, :updated_on, :datetime
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
