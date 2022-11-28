def Hangmans(countAttempts)

    picture = File.open(countAttempts.to_s + ".txt"){ |file| file.read }
    puts picture
    
end


words = File.open('wordss.txt'){ |file| file.read }
words = words.split()
puts("HANGMAN")


loop do
    guessWord = words[rand(words.length - 1)]

    blanks = ''
    
    for i in 0...guessWord.length
        blanks += '_'
    end
    
    attempts = 9
    Hangmans(attempts)

    loop do
        puts(blanks)
        puts('Enter a letter: ')
        letter = gets.chomp

        if (letter.class != String)
            while (letter.class != String)
                print('ERROR: Enter a LETTER: ')
            end
        end
        if (guessWord.include? letter)
            puts('Right!')

            for i in 0...guessWord.length
                if (letter == guessWord[i])
                  blanks[i] = letter
                end
            end
            
            if (blanks == guessWord)
                puts('YOU WON!!')
                puts('The word was -> ' + guessWord)
                break;
            end
        else
            puts('Wrong!')
            attempts -= 1
    
            Hangmans(attempts)
    
            if  (attempts == 0)
                puts('YOU LOSE!')
                puts('The word was -> ' + guessWord)
                break
            end
            print('Attempts left ')
            puts(attempts)
        end
    end

    print('Wanna play again? (Yes - 1, No - 0):  ')
    choice = gets.chomp

    if (choice.to_i == 0)
        break
    end
end




