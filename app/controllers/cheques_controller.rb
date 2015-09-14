class ChequesController < ApplicationController
  before_action :set_cheque, only: [:show, :edit, :update, :destroy]

  # GET /cheques
  # GET /cheques.json
  def index
    begin 
      rid = (params["cheque"]["recipient_id"]).to_i
      if rid > 0
        @cheques = Cheque.where(recipient_id: rid)
      else
        @cheques = Cheque.all 
      end
    rescue NoMethodError
      @cheques = Cheque.all
    end
  end

  # GET /cheques/1
  # GET /cheques/1.json
  def show
  end

  # GET /cheques/new
  def new
    @cheque = Cheque.new
  end

  # GET /cheques/1/edit
  def edit
  end

  # POST /cheques
  # POST /cheques.json
  def create
    @cheque = Cheque.new(cheque_params)
    @cheque.amount_text = wordify_amount(@cheque.amount)

    respond_to do |format|
      if @cheque.save
        format.html { redirect_to @cheque, notice: 'Yippee!! Cheque was successfully created.' }
        format.json { render :show, status: :created, location: @cheque }
      else
        format.html { render :new }
        format.json { render json: @cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques/1
  # PATCH/PUT /cheques/1.json
  def update
    respond_to do |format|
      if @cheque.update(cheque_params)
        format.html { redirect_to @cheque, notice: 'Cheque was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque }
      else
        format.html { render :edit }
        format.json { render json: @cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques/1
  # DELETE /cheques/1.json
  def destroy
    @cheque.destroy
    respond_to do |format|
      format.html { redirect_to cheques_url, notice: 'Cheque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use Humanize gem to convert amount in numbers to amount in words
    def wordify_amount(amount)
      dollar, cents = amount.to_s.split('.')
      dollar.to_i.humanize.gsub("-", " ").gsub(" and ", " ").gsub(",", "").titleize + " Dollars and " + cents.to_i.humanize.gsub("-", " ").titleize + " Cents only."
    end
    
  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque
      @cheque = Cheque.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_params
      params.require(:cheque).permit(:date, :amount, :recipient_id)
    end
  end
