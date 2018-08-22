class PincodesController < ApplicationController
  before_action :set_pincode, only: [:show, :edit, :update, :destroy]
  include AuthHelper

  # GET /pincodes
  # GET /pincodes.json
  def index
    @pincodes = Pincode.all
  end

  # GET /pincodes/1
  # GET /pincodes/1.json
  def show
    token = session[:access_token]
    url = URI.parse(ENDPOINTS_URI)
    req = Net::HTTP::Get.new(url.request_uri)

    req['Authorization'] = 'Bearer ' + token

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')

    response = http.request(req)
    json = JSON.parse(response.body)

    puts json

    uri = json[0]['uri']
    
    puts 'Unlock the door with pin code'
    
    lockUrl = uri + '/code/1244'
    getlockURL = URI.parse(lockUrl)
    getlockReq = Net::HTTP::Put.new(getlockURL.request_uri)
    getlockReq['Authorization'] = 'Bearer ' + token
    getlockHttp = Net::HTTP.new(getlockURL.host, getlockURL.port)
    getlockHttp.use_ssl = true
    
    lockStatus = getlockHttp.request(getlockReq)
  end

  # GET /pincodes/new
  def new
    @pincode = Pincode.new
  end

  # GET /pincodes/1/edit
  def edit
  end

  # POST /pincodes
  # POST /pincodes.json
  def create
    @pincode = Pincode.new(pincode_params)

    respond_to do |format|
      if @pincode.save
        format.html { redirect_to @pincode, notice: 'Pincode was successfully created.' }
        format.json { render :show, status: :created, location: @pincode }
      else
        format.html { render :new }
        format.json { render json: @pincode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pincodes/1
  # PATCH/PUT /pincodes/1.json
  def update
    respond_to do |format|
      if @pincode.update(pincode_params)
        format.html { redirect_to @pincode, notice: 'Pincode was successfully updated.' }
        format.json { render :show, status: :ok, location: @pincode }
      else
        format.html { render :edit }
        format.json { render json: @pincode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pincodes/1
  # DELETE /pincodes/1.json
  def destroy
    @pincode.destroy
    respond_to do |format|
      format.html { redirect_to pincodes_url, notice: 'Pincode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pincode
      @pincode = Pincode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pincode_params
      params.require(:pincode).permit(:username, :pcode)
    end
end
