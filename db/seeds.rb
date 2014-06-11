[
  ["Star Wars", "PG", "1977-05-02", "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the universe from the Empire's world-destroying battle-station, while also attempting to rescue Princess Leia from the evil Darth Vader."],
  ["Aladdin", "G", "1992-11-25", "Aladdin, a street urchin, accidentally meets Princess Jasmine, who is in the city undercover. They love each other, but she can only marry a prince."],
  ["The Terminator", "R", "1984-10-26", "A human-looking indestructible cyborg is sent from 2029 to 1984 to assassinate a waitress, whose unborn son will lead humanity in a war against the machines, while a soldier from that war is sent to protect her at all costs."],
  ["When Harry Met Sally", "R", "1989-07-21", "Harry and Sally have known each other for years, and are very good friends, but they fear sex would ruin the friendship."],
  ["The Help", "PG-13", "2011-08-10", "An aspiring author during the civil rights movement of the 1960s decides to write a book detailing the African-American maids' point of view on the white families for which they work, and the hardships they go through on a daily basis."],
  ["Chocolat", "PG-13", "2001-01-05", "A woman and her daughter open a chocolate shop in a small French village that shakes up the rigid morality of the community."],
  ["Amelie", "R", "2001-04-25", "Amelie, an innocent and naive girl in Paris, with her own sense of justice, decides to help those around her and along the way, discovers love."],
  ["2001: A Space Odyssey", "G", "1968-04-06", "Humanity finds a mysterious, obviously artificial, object buried beneath the Lunar surface and, with the intelligent computer H.A.L. 9000, sets off on a quest."],
  ["The Incredibles", "PG", "2004-11-05", "A family of undercover superheroes, while trying to live the quiet suburban life, are forced into action to save the world."],
  ["Raiders of the Lost Ark", "PG", "1981-06-12", "Archeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant before the Nazis."],
  ["Hostel", "NC-17", "2006-09-26", "Three backpackers head to a Slovak city that promises to meet their hedonistic expectations, with no idea of the hell that awaits them."],
  ["Chicken Run", "G", "2000-06-21", "Chicken Run is a comedy escape drama with a touch of passion set on a sinister Yorks chicken farm in 1950s England."]
].each do |(title, rating, date, description)|
  Movie.create! title: title, rating: rating, release_date: Date.parse(date), description: description
end
