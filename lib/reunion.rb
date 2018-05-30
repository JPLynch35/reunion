class Reunion
  attr_reader :location,
              :activities

  def initialize(location, activities)
    @location = location
    @activities = activities
  end

  def add_activities(added_activities)
    @activities += added_activities
  end

  def total_cost
    @activities.inject(0) do |collector, activity|
      collector += activity.total_cost
    end
  end

end
