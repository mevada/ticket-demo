require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  # let(:user) { create(:user) }
  it "create a ticket" do
  	get "/ticket/new"
  	expect(response).to render_template(:new)
  	post "/tickets", :params => { ticket => {:title => "ahmedabad"}}

  	expect(response).to redirect_to(assign(:ticket))
  	follow_redirect!

  	expect(response).to render_template(:show)
  	expect(response.body).to include("user create")
  end	

  it "does not render a different template" do
  	get "tickets/new"
  	expect(response).to_not render_template(:show)
  end	

end
