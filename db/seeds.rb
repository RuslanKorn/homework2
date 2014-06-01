[
  ["Star Wars", "PG", "1977-05-02"],
  ["Aladdin", "G", "1992-11-25"],
  ["The Terminator", "R", "1984-10-26"],
  ["When Harry Met Sally", "R", "1989-07-21"],
  ["The Help", "PG-13", "2011-08-10"],
  ["Chocolat", "PG-13", "2001-01-05"],
  ["Amelie", "R", "2001-04-25"],
  ["2001: A Space Odyssey", "G", "1968-04-06"],
  ["The Incredibles", "PG", "2004-11-05"],
  ["Raiders of the Lost Ark", "PG", "1981-06-12"],
  ["Chicken Run", "G", "2000-06-21"]
].each do |(title, rating, date)|
  Movie.create! title: title, rating: rating, release_date: Date.parse(date)
end
