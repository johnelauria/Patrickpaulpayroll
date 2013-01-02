class HomeController < ApplicationController
  def main
    if ThirteenthMonth.last.year != Date.today.strftime("%Y").to_i
      ThirteenthMonth.create(year: Date.today.strftime("%Y").to_i)
    end
  end
end
