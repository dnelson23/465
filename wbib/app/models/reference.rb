class Reference < ActiveRecord::Base
    validates :url, presence: true 
    belongs_to :topic
end