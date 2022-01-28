require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { described_class.new}

  it "title should be present" do
  	subject.title = "book ticket"
  	subject.description = "ticket book ticket ascc fd"
  	subject.category = 1
  	subject.user_id = 1
  	expect(subject).to be_valid	
  end

end
