class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :word_lessons
  has_many :words, through: :word_lessons
end
