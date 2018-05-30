class Activity
  attr_reader :name,
              :participants
  def initialize(name, participants={})
    @name = name
    @participants = participants
  end

  def add_participants(added_participants)
    @participants = @participants.merge(added_participants)
  end

end
