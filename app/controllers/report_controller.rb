class ReportController < ApplicationController


  def provision
    if params['date']
      date = Date.parse(params['date'].values.join("-"))
    else
      date = DateTime.now
    end
    # @spents = Spent
    #                 .joins(:expense, :category)
    #                 .where(expenses: {competence: (date.beginning_of_month)..date.end_of_month})
    # @spents = @spents.select(:category_id, 'sum(spents.value) as sum_value').group(:category_id).order('sum(spents.value) desc')

    @spents = Spent.select(:category_id, 'sum(spents.value) as sum_value')
                    .joins(:expense, :category)
                    .where(expenses: {competence: (date.beginning_of_month)..date.end_of_month})
                    .group(:category_id)
                    .order('sum(spents.value) desc')
    @dateSelected = date
    @spentSum = Spent.joins(:expense, :category).where(expenses: {competence: (date.beginning_of_month)..date.end_of_month})

    @provisions = Provision.all
  end

  def spent
    @spents = Spent.all.order(:date)
    # @valueSum = @spents.sum(:value)
  end

  def spentCategory
    if params['date']
      date = Date.parse(params['date'].values.join("-"))
    else
      date = DateTime.now
    end

    @spentsAll = Spent.joins(:expense, :category).where(expenses: {competence: (date.beginning_of_month)..date.end_of_month})
    @spents = @spentsAll.select(:category_id, 'sum(spents.value) as sum_value').group(:category_id).order('sum(spents.value) desc')
    @dateSelected = date
    @spentSum = @spentsAll.sum('spents.value')
  end

  def expense
    if params['date']
      date = Date.parse(params['date'].values.join("-"))
    else
      date = DateTime.now
    end

    @expenses = Expense.where(competence: (date.beginning_of_month)..date.end_of_month).order(competence: :desc, number: :desc)
    @dateSelected = date.strftime("%B")
  end

end
