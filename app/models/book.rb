class Book < ApplicationRecord
  has_many :rents

  scope :byname, -> (byname) {where("name LIKE ?","%#{byname.downcase}%" )}

  def available?
    available ? "<font color='green'><strong>&#10004;</strong></font>".html_safe() : "<font color='red'><strong>X</strong></font>".html_safe()
  end

  def active?
    active ? "<font color='green'><strong>&#10004;</strong></font>".html_safe() : "<font color='red'><strong>X</strong></font>".html_safe()
  end
end
