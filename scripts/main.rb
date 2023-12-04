
class Canvas
  def initialize
    @pegs = ["white", "red", "black", "blue", "green", "yellow", "purple", "maroon"]
    build_canvas
    bypas_code
  end

  def build_canvas
    puts "\n====================="
    puts "    MASTERMIND V1   "
    puts "=====================\n\n"
    puts "For a detailed walkthrough on how this game is played be advised to check out this video https://www.youtube.com/watch?v=wsYPsrzCKiA&ab_channel=wikiHow from wikiHow.\n\n"
    puts "For this first version the mastermind will be the computer.\n\n"
    puts "If you have not fully grassped the logic then just follow the guidlines issued as we go...\n\n"
    puts "The engine will chose on random 4 different colored pegs in the list bellow:\n\n"
    puts "#{@pegs.to_s}\n\n"
    puts "Your mission should chose is to identify this 4 identical pegs in the same order they were picked up by the engine. You will have 10 trials to figure this out. The O symbol(s) represent the number of pegs you picked that are of the same color and position as that of the mastermind and the X symbol(s) represent the number of pegs that are present in the masterminds code but positioned wrongly in your code predictions.\n\n"
  end

  def bypas_code
    puts "\nBellow this line attempt to identify the masterminds peg code. In each attempt on a ten turns interval chose 4 pegs that you predict could be in the same order as that of the mastermids. Keep in mind the rules of the game.\n\n"
    bot_pick = @pegs.shuffle[1..4]
    input = ""
    interval = 0

    until input == bot_pick || interval == 3
      puts "\nTurn #{interval + 1}"
      input = gets.chomp.split(" ")
      count = 0

      o_feedback = ""
      x_feedback = ""
      remark = ""

      input.each_with_index do |value, index|
        if input[index] == bot_pick[count]
          # * Here we indicate how many of the values match.
          o_feedback << "O "
        else
          # * Here we check how many values that were picked by the engine that can be found in our array but not in the same order as that of the engines.
          x_feedback << "X " if bot_pick.include?(input[index])
        end
        count += 1
      end

      feedback = "#{o_feedback}#{x_feedback}"

      if feedback == "O O O O "
        remark = "CODE BYPASED"
      else
        remark = "CODE BYPAS ERROR >> #{bot_pick}" if interval == 2
      end

      output = "#{feedback} #{remark}"
      puts output
      interval += 1
    end
  end
end

Canvas.new