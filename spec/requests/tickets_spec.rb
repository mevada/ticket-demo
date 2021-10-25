require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  let(:user) { create(:user) }

  describe "index" do
    it "assign all user tickets" do
      get tickets_path
      expect(assigns(:tickets)).to eq(ticket.all)
      
    end	

   
  end
end
