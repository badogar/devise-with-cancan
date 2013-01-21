class User < ActiveRecord::Base
  has_many :authentications
  has_many :authorizations

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me



def password_required?
  (authentications.empty? || !password.blank?) && super
end


	def self.create_from_hash!(hash)
	  create(:name => hash['user_info']['name'])
	end



def apply_omniauth(omniauth)
  authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
end



end
