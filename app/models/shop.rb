class Shop < ActiveRecord::Base
    has_many :phones
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :email, uniqueness: { case_sensitive: false }   
    has_secure_password
    
    private
        
end
