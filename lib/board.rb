require 'terminal-table'
require 'tty-prompt'
require 'pry'
require 'game'
require 'application'


class Board
  attr_accessor :case_name

  @@count = 0
  @@winner_x = []
  @@winner_o = []
  def initialize
    @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end


  def choice
    #
    # JOUEUR 1
    #
    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 1?"
    puts "Tes choix : #{ouech}"
    @choice1 = gets.chomp.to_i
    @result1 = @choice1 - 1
    @@winner_x << @choice1
    @cases[@result1] = "X"
    @cases.map { |x| x == @result1 ? 'X' : x }
    @rows[@result1] = "X"
    if (@cases[0] == @cases[1] && @cases[0] == @cases[2]) || (@cases[3] == @cases[4] && @cases[3] == @cases[5]) || (@cases[6] == @cases[7] && @cases[6] == @cases[8] ) || (@cases[0] == @cases[3] && @cases[0] == @cses[6]) || (@cases[1] == @cases[4] && @cases[1] == @cases[7]) || (@cases[2] == @cases[5] && @cases[2] == @cases[8]) ||( @cases[0] == @cases[4] && @cases[0] == @cases[8]) || (@cases[2] == @cases[4] && @cases[2] == @cases[6])
      puts "Joueur 1 a gagné !"
      display_board
      Application.new.perform
    end
    #
    # JOUEUR 2
    #
    ouech = @cases.map {|x| Integer(x) rescue nil }.compact
    puts "Quel choix souhaites-tu, joueur 2?"
    puts "Tes choix : #{ouech}"
    @choice2 = gets.chomp.to_i
    @result2 = @choice2 - 1
    @cases[@result2] = "O"
    @@winner_o << @choice2
    @cases[@result2]
    @cases.map { |x| x == @result2 ? 'O' : x }
    @rows[@result2] = "O"
    @@count = @@count + 1
    if (@cases[0] == @cases[1] && @cases[0] == @cases[2]) || (@cases[3] == @cases[4] && @cases[3] == @cases[5]) || (@cases[6] == @cases[7] && @cases[6] == @cases[8] ) || (@cases[0] == @cases[3] && @cases[0] == @cses[6]) || (@cases[1] == @cases[4] && @cases[1] == @cases[7]) || (@cases[2] == @cases[5] && @cases[2] == @cases[8]) ||( @cases[0] == @cases[4] && @cases[0] == @cases[8]) || (@cases[2] == @cases[4] && @cases[2] == @cases[6])
      puts "Joueur 2 a gagné !"
      Application.new.perform
    end

  end


  def update_board
    @rows = []
    @rows << [@cases[0], @cases[1], @cases[2]]
    @rows << [@cases[3], @cases[4], @cases[5]]
    @rows << [@cases[6], @cases[7], @cases[8]]
    @table = Terminal::Table.new :rows => @rows
    puts @table
    if @@count < 4
      puts "Tour n°#{@@count}"
      choice
      update_board
    end
  end
end
