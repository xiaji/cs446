module CurrentConsidering
  extend ActiveSupport::Concern
  private
  def set_considering
    @considering = Considering.find(session[:considering_id])
  rescue ActiveRecord::RecordNotFound 
    @considering = Considering.create
    session[:considering_id] = @considering.id
  end 
end