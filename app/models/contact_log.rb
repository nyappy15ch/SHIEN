class ContactLog < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :team
  belongs_to :user
  belongs_to :customer

  validates :comment, presence: true
  
  def notification_create(visiter_id, visited_id, customer_id, contact_log_id)
    Notification.create(visiter_id: visiter_id, visited_id: visited_id, customer_id: customer_id, contact_log_id: contact_log_id, checked:false)
    
  end
end
