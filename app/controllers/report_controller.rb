class ReportController < ApplicationController

  def spent
    @spents = Spent.all.order(:date)
    @valueSum = @spents.sum(:value)
  end

end
