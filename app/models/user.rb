class User < ActiveRecord::Base
  attr_accessible :name, :email , :password    
 # has_secure_password

 
  validates :name, presence: true , length: {maximum: 50}
 # VALID_EMAIL_REGEX = /\A[\w+\-­‐.]+@[a-­‐z\d\-­‐.]+\.[a-­‐z]+\z/i	 
 # validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true , length: {minimum: 6}


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
	user = User.new({:email => params[:email], :password => params[:password], :name => params[:name] })        		
		if user.valid?
			user.save!			
			return false
		else
			user.errors
		end
	end		
end



end


