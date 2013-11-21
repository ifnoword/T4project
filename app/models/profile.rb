class Profile < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :title, :body
  validates :altemail, format: { with: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ },
                    :allow_blank => true
  validates :zipcode, format: { with: /^[0-9]*$/ },
                    :allow_blank => true
  def self.creat_profile params, user
    profile=user.build_profile
    profile[:name]=params[:name]
    profile[:altemail]=params[:altemail]
    profile[:desc]=params[:desc]
    profile[:zipcode]=params[:zipcode]
    profile[:addr1]=params[:addr1]
    profile[:addr2]=params[:addr2]
    profile[:city]=params[:city]
    profile[:state]=params[:state]
    #profile[:country]=params[:country]
    profile[:tel]=params[:tel]
    if profile.valid?
      profile.save!
    end

    return profile
  end

  def self.update_profile params, profile
    profile[:name]=params[:name]
    profile[:altemail]=params[:altemail]
    profile[:desc]=params[:desc]
    profile[:zipcode]=params[:zipcode]
    profile[:addr1]=params[:addr1]
    profile[:addr2]=params[:addr2]
    profile[:city]=params[:city]
    profile[:state]=params[:state]
    #profile[:country]=params[:country]
    profile[:tel]=params[:tel]
    if profile.valid?
      profile.save!
    end
    puts profile.errors.messages
    return profile
  end
end
