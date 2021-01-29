# your code goes here
class Person
    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    attr_reader :name
    attr_reader :happiness
    attr_accessor :hygiene
    attr_accessor :bank_account

    def happiness=(happiness)
        @happiness = happiness
        @happiness = @happiness.clamp(0,10)
    end
    def hygiene=(hygiene)
        @hygiene = hygiene
        @hygiene = @hygiene.clamp(0,10)
    end
    def happy?
        @happiness > 7? true : false
    end
    def clean?
        @hygiene > 7? true : false
    end
    def get_paid(value)
        @bank_account += value
        return "all about the benjamins"
    end
    def take_bath
        self.hygiene=(@hygiene += 4)
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end
    def work_out
        self.happiness=(@happiness += 2)
        self.hygiene=(@hygiene -= 3)
        return "♪ another one bites the dust ♫"
    end
    def call_friend(friend)
        self.happiness=(@happiness += 3)
        friend.happiness += 3
        callee = "#{friend.name}"
        caller = "#{self.name}"
        return "Hi #{callee}! It's #{caller}. How are you?"
    end
    def start_conversation(person, topic)
        convo = {
            politics: {
                value: -2, 
                response: "blah blah partisan blah lobbyist"
            } ,
            weather: {
                value: 1, 
                response: "blah blah sun blah rain"
            }
        }

        if convo.include?(:"#{topic}")
            self.happiness += convo[:"#{topic}"][:value]
            person.happiness += convo[:"#{topic}"][:value]
            return convo[:"#{topic}"][:response]
        else
            return "blah blah blah blah blah"
        end
    end
end
