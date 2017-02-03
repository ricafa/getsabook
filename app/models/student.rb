class Student < ApplicationRecord
  has_many :rents
  validates_presence_of :name

  scope :byname, -> (byname) {where("name LIKE ?","%#{byname.downcase}%" )}

  def active?
    active ? "<font color='green'><strong>&#10004;</strong></font>".html_safe() : "<font color='red'><strong>X</strong></font>".html_safe()
  end

  def blocked?
    blocked ? "<font color='red'><strong>X</strong></font>".html_safe() : "<font color='green'><strong>&#10004;</strong></font>".html_safe()
  end

  def rented
    @r = Rent.where("returned =  ? and bring_back <= ? and student_id = ?", false, Date.today, id)
    if @r.count > 1
      name+" - #{@r.count} Livros pendentes"
    elsif @r.count == 1
      name+" - 1 Livro pendente"
    else
      name
    end
  end

  def pending
    @r = Rent.where("returned =  ? and bring_back <= ? and student_id = ?", false, Date.today, id)
    @r.count
  end

  def name_with_phone
    if phone.blank?
      name
    else
      name.to_s+" - "+phone.to_s
    end
  end

end
