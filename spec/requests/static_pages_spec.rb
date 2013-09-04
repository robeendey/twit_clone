require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Twitta'" do
      visit '/static_pages/home'
      page.should have_content('Twitta')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: "Twitta | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Twitta'" do
      visit '/static_pages/help'
      page.should have_content('Twitta')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', text: "Twitta | Help")
    end
  end

  describe "About page" do

    it "should have the content 'Twitta'" do
      visit '/static_pages/about'
      page.should have_content('Twitta')
    end

    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', text: "Twitta | About")
    end
  end
end