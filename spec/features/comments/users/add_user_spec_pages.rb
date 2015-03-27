describe "The blog creating and viewing process" do

  it "will allow user to be created" do
    user = FactoryGirl.create(:user, :email, :password)
  end
end
