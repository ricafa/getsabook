class Rent < ApplicationRecord
  belongs_to :student, class_name: 'Student', foreign_key: 'student_id'
  belongs_to :book, class_name: 'Book', foreign_key: 'book_id'

  validates_presence_of :student_id, :book_id, :bring_back

  def retur
    returned ? "<font color='green'><strong>&#10004;</strong></font>".html_safe() : "<font color='red'><strong>X</strong></font>".html_safe()
  end

end
