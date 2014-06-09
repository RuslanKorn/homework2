require 'spec_helper'

describe Movie do
  context ".all_ratings" do
    it 'No movies - no ratings' do
      expect(Movie.all_ratings).to eq([])
    end

    it 'One movie - one rating' do
      Movie.create(title: 'aaa', rating: 'R', release_date: '1992-02-05', description: 'Nice movie.')
      expect(Movie.all_ratings).to eq(['R'])
    end

    it 'Another movie - another rating' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: '1992-02-05', description: 'Nice movie.')
      expect(Movie.all_ratings).to eq(['PG'])
    end

    it 'Two movies - two ratings' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: '1992-02-05', description: 'Nice movie.')
      Movie.create(title: 'bbb', rating: 'R', release_date: '1992-02-05', description: 'Nice movie.')
      expect(Movie.all_ratings).to eq(['PG', 'R'])
    end

    it 'No duplicates' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: '1992-02-05', description: 'Nice movie.')
      Movie.create(title: 'bbb', rating: 'PG', release_date: '1992-02-05', description: 'Nice movie.')
      expect(Movie.all_ratings).to eq(['PG'])
    end
  end

  context ".list" do
    let!(:movie_one) {Movie.create(title: 'bbb', rating: 'PG', release_date: '1992-02-05', description: 'Nice movie.')}
    let!(:movie_two) {Movie.create(title: 'aaa', rating: 'G', release_date: '1994-02-05', description: 'Nice movie.')}
    let!(:movie_three) {Movie.create(title: 'zzz', rating: 'NC-17', release_date: '1990-02-05', description: 'Nice movie.')}
    it "Order by title ASC" do
      Movie.list(:order => 'title').should eq([movie_two, movie_one, movie_three])
    end

    it "Order by title DESC" do
      Movie.list(:order => 'title DESC').should eq([movie_three, movie_one, movie_two])
    end

    it "Order by release date ASC" do
      Movie.list(:order => 'release_date').should eq([movie_three, movie_one, movie_two])
    end

    it "Order by release date DESC" do
      Movie.list(:order => 'release_date DESC').should eq([movie_two, movie_one, movie_three])
    end

    it "One rating is select" do
      Movie.list(:rating => ['G']).should eq([movie_two])
    end

    it "All ratings is selected" do
      Movie.list(:rating => ['PG', 'G', 'NC-17']).should eq([movie_one, movie_two, movie_three])
    end

    it "Two ratings, order by title ASC" do
      Movie.list(:rating => ['G', 'NC-17'], :order => 'title').should eq([movie_two, movie_three])
    end

    it "Two ratings, order by title DESC" do
      Movie.list(:rating => ['G', 'NC-17'], :order => 'title DESC').should eq([movie_three, movie_two])
    end
    
    it "Two ratings, order by release date ASC" do
      Movie.list(:rating => ['G', 'NC-17'], :order => 'release_date').should eq([movie_three, movie_two])
    end

    it "Two ratings, order by release date DESC" do
      Movie.list(:rating => ['G', 'NC-17'], :order => 'release_date DESC').should eq([movie_two, movie_three])
    end

    it "Empty rating" do
      Movie.list(:rating => []).should eq([])
    end

  end
end
