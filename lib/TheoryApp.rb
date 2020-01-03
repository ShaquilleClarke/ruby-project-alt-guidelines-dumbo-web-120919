class TheoryApp
    attr_reader :theory
    
    
    def run
        welcome
        get_theorist_name
        get_theory
        update_theory
        sleep(2)
        leave_or_destroy
    end

   

    private

    def welcome
        puts "Hello"
        sleep(5)
        puts "I said hello"
        sleep(4)
        puts "Don't talk much do you?"
        sleep(5)
        puts "Seems you have something on your mind..."
        sleep(1)
        puts "Tell us your name and share your thoughts"
        sleep(0.5)
    end

    def get_theorist_name
        puts "First name first!"

       theorist_name = gets.chomp
       
        if theorist_name == "exit".downcase
            puts "Nice talk..."
            exit_to_main_menu
        else
            @theorist = Theorist.find_or_create_by(name: theorist_name)

            puts "Peace #{@theorist.name.capitalize}, tell us whats on your mind!"
        end
    end

    def get_theory
        new_theory = gets.chomp

        if new_theory == "exit".downcase
            puts "Nice talk..."
            exit_to_main_menu
        else
            @theory = Theory.find_or_create_by(content: new_theory, theorist_name: @theorist.name.capitalize)

            puts "Hmm.."
            sleep(0.9)
            puts "So #{@theory.content}?"
            sleep(2)
        end
    end

    def get_new_theory
        puts "Peace #{@theorist.name.capitalize}, tell us whats on your mind!"
        new_theory = gets.chomp

        if new_theory == "exit".downcase
            puts "Nice talk..."
            exit_to_main_menu
        else
            @theory = Theory.find_or_create_by(content: new_theory, theorist_name: @theorist.name.capitalize)

            puts "Hmm.."
            sleep(0.9)
            puts "So #{@theory.content}?"
            sleep(2)
            update_theory
            sleep(2)
            leave_or_destroy
        end
    end

    def update_theory
        puts "Thats an interesting theory"
        sleep(2)
        puts "Care to further elaborate?"

        theorist_response = gets.chomp

        if theorist_response == "No".downcase
            puts "Very well then"
            user_theory = UserTheory.new(theorist_id: @theorist.id, theory_id: @theory.id)
            exit_to_main_menu

        elsif theorist_response == "Exit".downcase
            puts "Very well then"
            exit_to_main_menu

        else
            @theory.update(content: theorist_response)
            user_theory = UserTheory.new(theorist_id: @theorist.id, theory_id: @theory.id)
            puts "Whoa!" 
            sleep(2)
            puts "Pretty heavy shit #{@theorist.name.capitalize}"
        end
    end

    def leave_or_destroy

        your_response = ""
        while your_response != 2

        puts "So what now?"
        puts "1. Go to main menu"
        puts "2. Destroy everything and exit app"

        print "Enter your selection: "
        your_response = gets.to_i 

        if your_response == 1
            exit_to_main_menu
        elsif your_response == 2
            puts "BURN THE BOOKS!!!"
            destroy_everything
            exit
        else
            puts "Invalid input."
        end
        end 
    end

    def destroy_everything
        t1 = UserTheory.where(theorist_id: 1..100, theory_id: 1..100).destroy_all
        
        t1
        
    end


    def exit_to_main_menu


        user_input = ""
        while user_input != 3

        puts "1.  Create New Theory"
        puts "2.  Destroy All Documents"
        puts "3.  Exit Application"

        print "Enter your selection: "
        user_input = gets.to_i

        if user_input == 1
            get_new_theory

        elsif user_input == 2
            puts "BURN THE BOOKS!!!"
            destroy_everything
            sleep(2)
            puts "Done!"
            exit_to_main_menu
        elsif user_input == 3
            exit
        else
            puts "Invalid input."
            exit_to_main_menu
        end
        end

    end
end


#needs to be able to exit at any time from any menu +
#needs to be able to exit at any time during response prompts +
#develop a README -
#make the app look wavy (music, transition screen, cool text colors) -
