class Comment < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :post
  belongs_to :user

  after_create :sms
end

def sms
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => "I hate Twilio",
        :To => '4154105984',
        :From => '4159157590', }
        ).execute
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end
