class Image < ActiveRecord::Base
    require 'digest'

    validates :filename, presence: true

    belongs_to :user
    has_many :users, through: :image_users 
    has_many :image_users
    has_many :tags

end
