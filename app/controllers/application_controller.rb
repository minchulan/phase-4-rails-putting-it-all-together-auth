class ApplicationController < ActionController::API
include ActionController::Cookies
# rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
# rescue_from ActiveRecord::RecordInvalid, with: :invalid_record 
  
  before_action :authorized 

  private 

  def authorized
    return render json: {error: "Not Authorized"}, status: :unauthorized unless session.include? :user_id 
  end 

  def current_user
    User.find_by(id: session[:user_id])
  end 

  #memoization: avoiding multiple hits to our DB
  # first check to see if user variable has a value
  # if it does, return that value
  # if it doesn't, set it equal to the record we get back from our DB. 
  # prohibits multiple calls to the DB everytime current_user is invoked upon

  # def current_user 
  #   @user ||= User.find_by_id(session[:user_id])
  # end 

  # def record_not_found(errors)
  #   render json: errors.message, status: :not_found 
  # end 

  # def invalid_record(invalid)
  #   render json: invalid.record.errors, status: unprocessable_entity
  # end 

end
