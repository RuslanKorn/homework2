require 'spec_helper'

describe "Pages" do
  context "Root page" do
    it "should have the content 'Welcome!'" do
    Movie.create(title: 'MovieCool', rating: 'R', release_date: '1992-02-05', description: 'Nice movie.', image_url: '1.jpg')
    visit root_path
    expect(page).to have_content('Welcome!')
    end
  end

  context "Move list" do
    it "should have the link 'Movie Title'" do
    visit movies_path
    expect(page).to have_link('Movie Title')
    end

    it "should have the link 'Release Date'" do
    visit movies_path
    expect(page).to have_link('Release Date')
    end

    it "should have the content 'All Movies'" do
    visit movies_path
    expect(page).to have_content('All Movies')
    end
  end

  context "Add new movie" do
    it "should have the field 'Title'" do
    visit new_movie_path
    expect(page).to have_field('Title')
    end

    it "should have the field 'Rating'" do
    visit new_movie_path
    expect(page).to have_field('Rating')
    end

    it "should have the field 'Release date'" do
    visit new_movie_path
    expect(page).to have_field('Release date')
    end

    it "should have the field 'Image url'" do
    visit new_movie_path
    expect(page).to have_field('Image url')
    end

    it "should have the field 'Description'" do
    visit new_movie_path
    expect(page).to have_field('Description')
    end
  end
end
