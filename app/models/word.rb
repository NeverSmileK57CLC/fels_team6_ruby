class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lessons, through: :word_lessons
  accepts_nested_attributes_for :word_answers

  def json_data
    {
      id: id,
      content: content,
      answers: word_answers.as_json
    }    
  end
end
