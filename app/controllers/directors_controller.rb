class DirectorsController < ApplicationController
  def index
    render({ :template =>"director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id") # Ask Ben -> why is this "the_id", where are we fetching "the_id" from? 

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest
    matching_youngest = Director.where.not({ :dob => nil }).order({ :dob => :desc })
    @youngest_director = matching_youngest.at(0)
    render({ :template =>"director_templates/youngest"})
  end
  
  def oldest
    matching_oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc })
    @oldest_director = matching_oldest.at(0)
    render({ :template =>"director_templates/oldest"})
  end    
end 
