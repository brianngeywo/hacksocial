class Phone < ActiveRecord::Base
    belongs_to :shop
    validates :shop_id, presence: true
    
    
    private
        
end
