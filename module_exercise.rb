###################################
######      NAMESPACE        #####
###################################

# Provides a container to hold things like methods, classes and constants as a way to group them together logically and to help avoid conflicts with other methods and classes that may have the same name,
#typically written by someone else (**Ahem, gems**).


###################################
######    EXAMPLE MODULE      #####
###################################
#useful because classes all need to have unique names, so the following code
#won't override the established Array class built into Ruby
  # #
  # module Perimeter #CamelCase naming conventions
  #   class Array
  #     def initialize
  #       @size = 400
  #     end
  #   end
  # end#of module
  # #
  # our_array = Perimeter::Array.new
  # ruby_array = Array.new
  # #p is shorthand for print
  #  p our_array.class #tells you what the class of the object is
  #  p ruby_array.class
  # #
  #  p our_array.length #this will throw an error because we don't have a method defined for Perimeter module Arrays, the Perimeter::Array are in no way related to the built-in Ruby arrays

   #Wrapping in a module is a safe choice when you are using many gems and you don't know what variable and class names they use so that you can avoid a conflict of duplicate names

   #module and namespace are synonyms



###################################
#### WHY YOU SHOULD LOVE FAKER ###
###################################
#DOCUMENTATION
#https://github.com/stympy/faker#fakerhacker

# require "faker"
#
# puts Faker::Hacker.say_something_smart
# puts Faker::Hacker.adjective
# puts Faker::Hacker.verb
#---- Module::Class.method


#Notice the format of how we're calling the functionality of the Faker gem, How is Faker's code structured?

#if you make your own gem, wrap everything in your own module

###################################
###### TRAVELLER GEM STEP ONE #####
###################################
#DOCUMENTATION:
#https://github.com/kqdreger/traveller

#Testing out the traveller gem! <-------- not wrapped in a module

  require 'traveller'
  #
  traveller1 = Traveller.new("Seattle, Minnesota 98101")

   puts traveller1.city
   puts traveller1.zip
  #
  # traveller1.state = "Washington"
  #
  # puts traveller1.state


###################################
###### TRAVELLER GEM STEP TWO #####
###################################

#I want to create a new class for travellers, called traveller. What could possibly go wrong?
module Expedia #<------ to fix the conflict of duplicate names, we wrap ours in a module so the traveller gem can run the way we expect
  class Traveller
    attr_accessor :name, :email, :location
    def initialize(details_hash)
      @name = details_hash[:name]
      @email = details_hash[:email]
      @location = details_hash[:location]
    end
  end
end
  #Tests to use the Traveller Gem (after my class has been created. )
     traveller2 = Traveller.new("Chicago 60611 IL")
     puts traveller2.state

     location = Traveller.new("Seattle, Washington 98101")
     user1 = Expedia::Traveller.new(name: "name", email: "email", location: location) #<---- if we make our own user1 from the Traveller class in the Expedia module


  #Hmm. It doesn't work. Oh bother. (Instead of using the traveller class in the gem, the new class we wrote overran the traveller class in the gem, so we need to wrap it in a module.)
  #How would we possibly fix this so I don't have to change the name of MY class but still be able to use this gem?



  ###################################
  #########     CONSTANTS    ########
  ###################################

  #A Ruby constant is like a variable, except that its value is supposed to remain constant for the duration of the program. The Ruby interpreter does not actually enforce the constancy of constants, but it does issue a warning if a program changes the value of a constant

  #### NOTES ###

  # Constants defined within a class or module may be accessed anywhere within the class or module.

  # Outside the class or module, they may be accessed using the scope operator, :: prefixed by an expression that returns the appropriate class or module.

  # Constants defined outside any class or module may be accessed as it is or by using the scope operator with no prefix.
  # Constants may not be defined in methods.

  # Constants may be added to existing classes and modules from the outside by using the class or module name and the scope operator before the constant name.



        module Blackjack
          MAX_SCORE = 21 #<---- constant defined in the module, but not in the class

          module Player
              MAX_PLAYERS = 2 #<----- constant
              class Player
                def initialize
                end
              end
          end

          module Card
              MAX_VALUE = 13
              class Card
                def get_max_value()
                    return MAX_VALUE
                end
              end
          end
      end
      #
      MAX_SCORE = 50 #<--- constants with the same name outside the module
      MAX_PLAYERS = 4
      MAX_VALUE = 21
      #
      puts "MAX_SCORE - #{MAX_SCORE}" #<---- this is the max score from outside the module
      puts "Blackjack::MAX_SCORE - #{Blackjack::MAX_SCORE}" #<---this is the max score from inside the Blackjack module
      #
      # puts
      #
      puts "MAX_Players - #{MAX_PLAYERS}" #<---- this is the max player from outside the module
      puts "Blackjack::Player::MAX_Players - #{Blackjack::Player::MAX_PLAYERS}" #<---this is the max player from inside the Blackjack module

       puts "MAX_VALUE - #{MAX_VALUE}" #<---- this is the max value from outside the module
      puts "Blackjack::Card::get_max_value -  #{Blackjack::Card::Card.new().get_max_value()}" #<--- this is the max value from the card class in the card module in the Blackjack module 
