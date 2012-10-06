require 'twilio-ruby'
require 'geokit'

class UsersController < ApplicationController
  ACCOUNT_SID = "ACef220c780a91468684fce9903302ad3c"
  ACCOUNT_TOKEN = "3a44621b338f407704d8cc03de292aa8"
  # GET /users
  # GET /users.json
  def index
   
  end

  # GET /users/1
  # GET /users/1.json
  def show
   
  end

  # GET /users/new
  # GET /users/new.json
  def new
   
  end

  # GET /users/1/edit
  def edit
   
  end

  # POST /users
  # POST /users.json
  def create
    
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  
  end
  
  def ride_request
    phone_number = params[:number]
    logger.info params[:number]
    address = params[:body]
    @user = User.where(phone: phone_number).first
    if !@user
      @user = User.create!(phone: phone_number)
      logger.info "user created"
    else 
      logger.info "user already here"
    end
    make_request(address, @user)
  end
  
  def make_request(body, user)
    new_body = Geokit::Geocoders::YahooGeocoder.geocode body
    logger.info new_body
    @request = user.requests.build(address: body, coordinates: new_body.ll)
    if @request.save!
      alert_drivers
    end
  end
  
  def send_text()
    
  
end
