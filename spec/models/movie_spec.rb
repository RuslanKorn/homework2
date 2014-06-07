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
end