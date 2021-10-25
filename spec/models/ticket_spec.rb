require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { Ticket.new(title: "book ticket!") }

  it "title should be present" do
  	subject.title = nil
  	expect(subject).to_not be_valid	
  end

  it "description should be present" do
  	subject.description = nil
  	expect(subject).to_not be_valid	
  end
end
