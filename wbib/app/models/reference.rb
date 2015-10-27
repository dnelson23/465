class Reference < ActiveRecord::Base
    validates :url, presence: true, length: {minimum: 1}
    belongs_to :topic
end