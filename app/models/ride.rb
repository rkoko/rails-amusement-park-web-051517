
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height

    #CREATE RIDE
     #@ride = Ride.new(user_id: self.user.id, attraction_id: self.attraction.id)
      #SUBTRACT TICKETS
      #binding.pry
      self.user.tickets -= self.attraction.tickets
      #DEAL WITH NAUSEA
      if self.user.nausea + self.attraction.nausea_rating >= 10
        self.user.nausea = 10
      elsif self.user.nausea + self.attraction.nausea_rating < 1
        self.user.nausea = 1
      else
        self.user.nausea += self.attraction.nausea_rating
      end
      #DEAL WITH HAPPINESS
      if self.user.happiness + self.attraction.happiness_rating >= 10
        self.user.happiness = 10
      elsif self.user.happiness + self.attraction.happiness_rating < 1
        self.user.happiness = 1
      else
        self.user.happiness += self.attraction.happiness_rating
      end
      self.user.save
      "Thanks for riding #{self.attraction.name}"


    elsif self.user.tickets <= self.attraction.tickets && self.user.height <= self.attraction.min_height
      #### return error message exlaining both
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets <= self.attraction.tickets && self.user.height >= self.attraction.min_height
      #### return error message that user does not have enough tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.tickets >= self.attraction.tickets && self.user.height <= self.attraction.min_height
      #### return error message that user is not tall enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end

  end



end
