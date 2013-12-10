class User < ActiveRecord::Base
  has_one :profile
  has_many :jobs

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
      user.create_profile!
      puts "login success!"
      return user
    else

      return errs
    end
  end

  def self.update_attrbs (params, user)

    errs=Hash.new	       
    oldemail=user.email
    if params[:email].size!=0 && !params[:email].match(/^\s+$/)
      user.email = params[:email]
    end
    if !user.valid?

      user.errors.each do |key, value|
        errs[key.to_s]=value
      end
    end
    if params[:password].size!=0 && !params[:password].match(/^\s+$/)
      if params[:password].size < 6 
        errs['password']="is too short (minimum is #{@@pw_len_min})"
      end
      if params[:password]!=params[:password_confirmation]
        errs['password_confirmation']="Passwords don't match"
      end
    end
    if user.password_digest!=Digest::SHA256.hexdigest(oldemail+params[:oldpassword])
      errs['oldpassword']="Please enter your correct current password"
    end
    if errs.size==0
      pwd=params[:oldpassword]
      email=user.email
      if params[:password].size!=0
        pwd=params[:password]
      end
      user.password_digest = Digest::SHA256.hexdigest(email+pwd)
      user.save!
      return user
    else

      return errs
    end
  end
end


