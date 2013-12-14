require 'spec_helper'

describe Job do
  describe 'adding job to database' do
    it'should assign param values then save' do
      fake_jobs = double('jobs1')
      fake_user = double('user1')
      fake_values = double('values1')
      fake_values.should_receive(:title=).with("title")
      fake_values.should_receive(:descp=).with("desc")
      fake_values.should_receive(:reqs=).with("reqs")
      fake_values.should_receive(:desire=).with("desire")
      fake_values.should_receive(:link=).with("link")
      fake_values.should_receive(:city=).with("city")
      fake_values.should_receive(:state=).with("state")
      fake_values.should_receive(:companyname=).with("companyname")
      fake_values.should_receive(:valid?).and_return(true)
      fake_values.should_receive(:save!)
      fake_jobs.should_receive(:build).and_return(fake_values)
      fake_user.should_receive(:jobs).and_return(fake_jobs)
      retval = Job.create_job({:title => "title", :descp => "desc", :reqs => "reqs", :desire => "desire", :link => "link", :city => "city", :state => "state", :companyname => "companyname"}, fake_user)
      retval == fake_values
    end
  end
  describe 'updating job in databas' do
    it'should update param values then save' do
      fake_values = double('values1')
      fake_values.should_receive(:title=).with("title")
      fake_values.should_receive(:descp=).with("desc")
      fake_values.should_receive(:reqs=).with("reqs")
      fake_values.should_receive(:desire=).with("desire")
      fake_values.should_receive(:link=).with("link")
      fake_values.should_receive(:city=).with("city")
      fake_values.should_receive(:state=).with("state")
      fake_values.should_receive(:companyname=).with("companyname")
      fake_values.should_receive(:valid?).and_return(true)
      fake_values.should_receive(:save!)
      retval = Job.update_attrbs({:title => "title", :descp => "desc", :reqs => "reqs", :desire => "desire", :link => "link", :city => "city", :state => "state", :companyname => "companyname"}, fake_values)
      retval == fake_values
    end
  end
end
