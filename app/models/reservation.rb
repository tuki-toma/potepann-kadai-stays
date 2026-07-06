class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :check_in_date,presence:true,check_in:true
  validates :check_out_date,presence:true,comparison:{greater_than: :check_in_date}
  validates :people,presence:true,numericality:{greater_than_or_equal_to:1}

  def reservation_price
    (check_out_date-check_in_date).to_i*room.price*people
  end
  
  def stay_days
    (check_out_date-check_in_date).to_i
  end
end