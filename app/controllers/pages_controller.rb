class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def notreturned
    @rents = Rent.where("returned = ? and bring_back <= ?", false, Date.today).order(:bring_back)
  end

  def home
  end
end
