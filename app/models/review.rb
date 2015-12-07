class Review < ActiveRecord::Base
    belongs_to :chef
    belongs_to :recipe
    #validates_uniqueness_of :chef, scope: :recipe

    validates :review_entry, presence: true
    validates :review_entry, length: {minimum: 5, maximum: 500}
end