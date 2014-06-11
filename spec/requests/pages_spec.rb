require 'spec_helper'

describe "Pages" do
  describe "Movie list" do
    it "should have the content 'All Movies'" do
    visit movies_path
    expect(page).to have_content('All Movies')
    end

    it "should have the link 'Movie Title' and 'Release Date'" do
    visit movies_path
    expect(page).to have_link('Movie Title', 'Release Date')
    end
    
  end
end
