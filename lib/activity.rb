class Activity
  attr_reader :name,
              :base_cost,
              :cost_per_participant,
              :participants
  def initialize(name, base_cost, cost_per_participant, participants={})
    @name = name
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
    @participants = participants
    @all_owe = participants.clone
  end

  def add_participants(added_participants)
    @participants = @participants.merge(added_participants)
  end

  def total_cost
    @participants.values.sum
  end

  def fair_share
    total_cost / (@participants.values.length)
  end

  def owes
    names = @all_owe.keys
    @all_owe.values.map.with_index do |paid, index|
      @all_owe[names[index]] = fair_share - paid
    end
    @all_owe
  end
end
