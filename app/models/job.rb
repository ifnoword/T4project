class Job < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :title, :body
  validates :title, presence: true, length: {maximum: 70}
  validates :desc, presence: true, length: {minimum: 70}

  def self.create_job(params, user)
    job=user.jobs.build
    job.title = params[:title]
    job.desc = params[:desc]
    job.reqs = params[:reqs]
    job.link = params[:link]
    job.city = params[:city]
    job.state = params[:state]

    if job.valid?
      job.save!
    end

    return job
  end

  def self.update_attrbs params, job
    job.title = params[:title]
    job.desc = params[:desc]
    job.reqs = params[:reqs]
    job.link = params[:link]
    job.city = params[:city]
    job.state = params[:state]

    if job.valid?
      job.save!
    end

    return job

  end
end
