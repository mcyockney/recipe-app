class Chef < ActiveRecord::Base
    before_save {self.email=email.downcase}
    has_many :recipes
    has_many :likes
    validates :chefname, presence: true
    validates :chefname, length: {minimum: 3, maximum: 20}
    validates :email, presence: true, :email => true
    validates :email, uniqueness: {case_sensitive: false}
    
end
