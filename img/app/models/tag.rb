class Tag < ActiveRecord::Base
    validates :str, presence: true
    belongs_to :image
end
