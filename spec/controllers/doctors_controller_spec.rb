require '../rails_helper'

RSpec.describe DoctorsController, :type => :controller do

  let(:valid_attributes) {
    {name: 'jim'}
  }

  describe "GET index" do
    it "assigns all doctors as @doctors" do
      doctor = Doctor.create! valid_attributes
      get :index
      expect(assigns(:doctors)).to eq([doctor])
    end

    it "should respond with json" do
      doctor = Doctor.create! valid_attributes
      get :index, {name: "jim"}
      parsed_body = JSON.parse(response.body) 
      expect(parsed_body[0]["name"]).to eq("jim")
    end
  end
end