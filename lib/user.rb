class User 
  require "set"

  attr_reader :name, :mentioned_names

  def initialize(name)
    @name            = name
    @mentioned_names = SortedSet.new
    @connections     = Array.new
  end

  def ==(other_user)
    name == other_user.name
  end

  def <=>(other_user)
    name <=> other_user.name
  end

  def add_mentioned_names(names)
    @mentioned_names.merge names
  end

  def connections(users, order)
    @connections[order] ||= 
      case order
      when 0
        SortedSet.new [self]
      when 1
        SortedSet.new users.select { |user| mentions?(user.name) && user.mentions?(name) }
      else
        connections_of_previous_orders = (0..(order - 1)).inject(SortedSet.new) { |connections, i| connections.merge connections(users, i) }
        found_connections = connections(users, order - 1).inject(SortedSet.new) { |found_connections, connection| found_connections.merge connection.connections(users, 1) }
        found_connections.subtract connections_of_previous_orders
      end
  end

  def mentions?(name)
    @mentioned_names.include? name
  end

end
