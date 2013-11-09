class User < ActiveRecord::Base
  validates :email, presence: true, 
                    format: { with: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ },
                    uniqueness: {case_sensitive: true}
  validates :name, presence: true, length: {maximum: 50}
  @@pw_len_min=6

  def self.login(email, pw)
      user=User.find_by_email(email)
      if user && user.password_digest==Digest::SHA256.hexdigest(email+pw)
        return user
      else
        return false
      end
    end

  def self.create_user! params
    puts params
    puts "hahahahha"
    errs=Hash.new	       
    user = User.new
    user.name = params[:name] 
    user.email = params[:email]
    if !user.valid?     
      user.errors.each do |key, value|
        errs[key.to_s]=value
      end
    end
    if params[:password].size < 6 
      if params[:password].size!=0
        errs['password']="is too short (minimum is #{@@pw_len_min})"
      else
        errs['password']="can't be blank"
      end
    end
    if params[:password]!=params[:password_confirmation]
      errs['password_confirmation']="Passwords don't match"
    end
    if errs.size==0
      user.password_digest = Digest::SHA256.hexdigest(params[:email]+params[:password])
      user.save!
      puts "login success!"
      return user
    else
      puts errs
      return errs
    end
end



end


