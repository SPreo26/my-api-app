  json.id show.id
  json.datetime show.datetime
  json.artsists show.artsists
  #if a show >>has many<< art(s)ists:
  #json.artsists show.artsists.each do |artsist|
  #  json.name artsist.name
  #end
  json.venue show.venue
  json.city show.city
  json.region show.region
  json.country show.country
