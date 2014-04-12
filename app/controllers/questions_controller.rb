class QuestionsController < ApplicationController


  def index

  end

  def ask


    counter_passed = params[:counter]

    counter_passed_array = counter_passed.split("|")

    @name = params[:name]

    if counter_passed_array.length > 1

      render :summary

    else

      @question = Question.random_question(counter_passed_array)

    @choice1 = @question.choice_1.split("|")
    @choice2 = @question.choice_2.split("|")
    @choice3 = @question.choice_3.split("|")
    @choice4 = @question.choice_4.split("|")

    counter_passed_array << @question.id

    @counter_to_pass = counter_passed_array.join("|")
    @question_number = counter_passed_array.length - 1

    end

  end

  def validate

    @name = params[:player_name]
    choice = params[:answer]

    question_id = params[:question_id]

    @counter_to_pass = params[:counter]

    @question = Question.find(question_id)

    @answer = Question.answer_question(question_id,choice)

    @question_number = (@counter_to_pass.split("|")).length - 1


  end

  def summary
    @name = params[:player_name]
  end

end
