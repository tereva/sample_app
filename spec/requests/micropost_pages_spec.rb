require 'spec_helper'

describe "MicropostPages" do

 subject{ page }
 let(:user) { FactoryGirl.create(:user) }
 before { sign_in user }

 describe "micropost creation" do
 
  before { visit root_path }

  describe "with invalid information" do
   
   it "should not create a micropost" do
   expect { click_button "Post" }.should_not change(Micropost, :count)
   end

   describe "error messages" do
    before { click_button "Post" }
    it { should have_content('error') }
   end

  end #with invalid information


  describe "with valid information" do

   before { fill_in 'micropost_content', with: "Lorem ipsum" }
   
    it "should create a micropost" do
     expect { click_button "Post" }.should change(Micropost, :count).by(1)
    end # "should create a micropost"

  end # with valid infermation

 end # micropost creation

 describe "micropost destruction" do
  
  describe "as correct user" do
   before do 
    FactoryGirl.create(:micropost, user: user)
    visit root_path
   end 
   it "should delete a micropost" do
    expect { click_link "delete" }.should change(Micropost, :count).by(-1)
   end
  end

  describe "of post created by other users" do
   before do 
    FactoryGirl.create(:micropost, user: FactoryGirl.create(:user))
    visit root_path
   end 
    it { should_not have_link('delete') }
  end # "of post created by other users"

 
 end # "micropost destruction"

end

