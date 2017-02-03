class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy, :bring]

  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent.where(returned: false)
    
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
    @rent.bring_back = Date.today + 7
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(rent_params)
    @book = Book.find(@rent.book_id)
    @book.available = false
    @book.save
    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: 'Criado com sucesso :D' }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { render :new }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rents/1
  # PATCH/PUT /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        @book = Book.find(@rent.book_id)
        @book.available = true
        @book.save
        format.html { redirect_to @rent, notice: 'Alterado com sucesso  :D' }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent.destroy
    respond_to do |format|
      format.html { redirect_to rents_url, notice: 'Rent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bring
    @rent.returned = true
    @rent.save

    returnedBook

    respond_to do |format|
      if @rent.bring_back < Date.today
        format.html { redirect_to notreturned_url, notice: 'Obrigado por devolver o livro :)' }
        format.json { head :no_content }
      else
        format.html { redirect_to rents_url, notice: 'Obrigado por devolver o livro :)' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    def returnedBook
      @book = Book.find(@rent.book_id)
      @book.available = true
      @book.save

      @student = Student.find(@rent.student_id)
      @student.blocked = false
      @student.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_params
      params.require(:rent).permit(:student_id, :book_id, :returned, :bring_back, :obs)
    end
end
