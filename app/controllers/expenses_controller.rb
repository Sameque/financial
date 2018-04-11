class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: %i[edit new update create]
  before_action :set_spents, only: %i[show]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all.paginate(page: params[:page], per_page: 8)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    # @spents = spent
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @spents = Spent.all.order(:date).where('closed = false')
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_spents
      @spents =  Spent.where("expense_id = #{@expense.id}").order(:date)
    end

    def set_person
      @people = Person.all.order(:name)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:number, :value, :description, :references, :paid, :person_id, :competence)
    end
end
