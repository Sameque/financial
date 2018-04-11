class ReportController < ApplicationController

  def spent
    # @spents = Spent.all.order(:date)
    # @valueSum = @spents.sum(:value)
  end

  def spentCategory
    if params['date']
      date = Date.parse(params['date'].values.join("-"))
    else
      date = Date.new
    end
    @spentsAll = Spent.joins(:expense, :category).where(expenses: {competence: (date.beginning_of_month)..date.end_of_month})

    @spents = @spentsAll.select(:category_id, 'sum(spents.value) as sum_value').group(:category_id)
    @spentSum = @spentsAll.sum('spents.value')
  end

end
