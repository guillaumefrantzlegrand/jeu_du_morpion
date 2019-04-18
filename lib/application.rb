require 'game'
require 'tty-prompt'


class Application
  def initialize
    @game = Game.new
  end

  def perform
    puts "Bienvenue dans notre jeu de morpion !"
    while true
      prompt = TTY::Prompt.new
      params = prompt.select("Souhaites-tu démarrer une partie ?", %w(Oui Non))
      if params == "Oui"
        puts "C'est parti !"
        @game.create_game
      else
        puts "Nous te regrettons déjà, reviens vite !"
        exit
      end
    end
  end

  # def round

  # end
end
