class Word < ActiveRecord::Base
  belongs_to :category
  has_many :word_answers
  has_many :lessons, through: :word_lessons
  validates :content, uniqueness: {case_sensitive: true},
      presence: true

  def json_data
    {
      id: id,
      content: content,
      answers: word_answers.as_json
    }    
  end
end
