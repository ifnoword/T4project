class User < ActiveRecord::Base
  attr_accessible :name, :email , :password #, :password_confirmation      
 # has_secure_password

 # before_save{|user| user.email = user.email.downcase}
 # validates :name, presence: true #, length: {maximum: 50}
 # VALID_EMAIL_REGEX = /\A[\w+\-­‐.]+@[a-­‐z\d\-­‐.]+\.[a-­‐z]+\z/i	
 
#  validates :email, presence: true #, format: {with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: false}
 # validates :password, presence: true, length: {minimum: 6}
 
# validates :password_confirmation, presence: true


 # def self.create_user! params
 #  user = User.new(params)
#    user.save!
#if user.valid?  
 # return false
 # else
 #   return user.errors
  #end
 
def self.login(email, pw)
    user=User.find_by_email(email)
    #a encrytion algo. should be applied on pw
    if user && user.password==pw
      return user
    else
      return false
    end
  end



  def self.create_user! params
       if User.exists?(:email => params[:email])	
		return false
	else
	 User.create!({:email => params[:email], :password => params[:password], :name => params[:name] })
        		
	end		
end



end


