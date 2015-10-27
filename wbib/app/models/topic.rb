class Topic < ActiveRecord::Base

    validates :title, presence: true, length: {minimum: 1}
    validates :description, presence: true, length: {minimum: 1}
    has_many :references, dependent: :destroy

end