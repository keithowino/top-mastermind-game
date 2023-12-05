
class Canvas
  def initialize
    @pegs = ["white", "red", "black", "blue", "green", "yellow", "purple", "maroon"]
    build_canvas
    bypas_code
    replay
  end

  def build_canvas
    puts "\n====================="
    puts "    MASTERMIND V1   "
    puts "=====================\n\n"
    puts "For a detailed walkthrough on game play check out this link https://www.youtube.com/watch?v=wsYPsrzCKiA&ab_channel=wikiHow from wikiHow.\n\n"
    puts "For this first version the mastermind will be the computer. Be advised that as it's still a work in progress dublicate predictions per pair is not allowed, attempting this might lead to missleading prediction in later trials.\n\n"
    puts "The engine will chose on random 4 different colored pegs from this list bellow:\n\n"
    puts "#{@pegs.to_s}\n\n"
    puts "Your mission should chose is to cipher the code and identify this 4 identical pegs in the same order they were picked up by the engine. Prediction limit is set to 10 trials. After each prediction the O symbol(s) represent the number of pegs you correctly positioned, similarly the X symbol(s) represent the number of pegs that are present in the masterminds code but positioned wrongly in your current prediction. If none of the two symbols are present then the entire prediction is false.\n\n"
  end

  def bypas_code
    bot_pick = @pegs.shuffle[1..4]
    input = ""
    interval = 0

    until input == bot_pick || interval == 10
      puts "\nTurn #{interval + 1} : Enter prediction."
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
      elsif feedback.size < 1
        remark = "NO MATCH FOUND"
      else
        remark = "CODE BYPAS ERROR >> #{bot_pick}" if interval == 9
      end

      output = "#{feedback} #{remark}"
      puts output
      interval += 1
    end
  end

  def replay
    puts "\n================================\n\nWant to play again (YES/ NO)? "
    play = gets.chomp.upcase

    sleep 3

    if play == "YES"
      bypas_code
      replay
    elsif play == "NO"
      puts "\nSee you soon..."
    else
      puts "\nINPUT INVALID"
      replay
    end
  end
end

Canvas.new