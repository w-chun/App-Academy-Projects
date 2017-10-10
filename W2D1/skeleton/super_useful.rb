# PHASE 2
def convert_to_int(str)


rescue TypeError => e
    # if $!
    #   return nil
    # end
    return nil




end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class WrongFruit < StandardError
  # def initialize(msg = "suuuupr wrong fruit")
  #   super(msg)
  # end
  def message
    puts "no Fruit good"
  end
end

def reaction(maybe_fruit)

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise WrongFruit
  end


end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue WrongFruit => e
    e.message
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Not best friend, did not know each othher for 5 years" if yrs_known < 5
    raise "no name" if name.length < 2
    raise "no such thing" if fav_pastime.length < 2
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

feed_me_a_fruit
