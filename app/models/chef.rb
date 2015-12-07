class Chef < ActiveRecord::Base
    has_secure_password
    before_save {self.email=email.downcase}
    has_many :recipes
    has_many :likes
    has_many :reviews, dependent: :destroy
    validates :chefname, presence: true
    validates :chefname, length: {minimum: 3, maximum: 20}
    validates :email, presence: true, :email => true
    validates :email, uniqueness: {case_sensitive: false}

    
end
