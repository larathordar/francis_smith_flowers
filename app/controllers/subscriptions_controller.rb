class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
       Stripe.api_key = Rails.application.credentials.stripe_api_key

       plan_id = params[:plan_id]
       plan = Stripe::Plan.retrieve(plan_id)
       token = params[:stripeToken]
       email = params[:email]

       customer = Stripe::Customer.create(email: email, source: token)

       subscription = subscriptions.create(plan: plan.id)

       options = {
         stripe_id: customer.id,
         stripe_subscription_id: subscription.id,
         subscribed: true
       }

       options.merge!(
         card_last4: params[:user][:card_last4],
         card_exp_month: params[:user][:card_exp_month],
         card_exp_year: params[:user][:card_exp_year],
         card_type: params[:user][:card_type]
       ) if params[:user][:card_last4]

       current_user.update(options)

       redirect_to root_path, notice: "Your subscription was setup successfully!"
     end
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:name, :address, :postcode, :mobile_number, :deliverAddress, :deliverName, :frequency, :size, :delivery, :start)
    end
  end
