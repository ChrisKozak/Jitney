require 'twilio-ruby'

class Texter
  ACCOUNT_SID = "ACef220c780a91468684fce9903302ad3c"
  ACCOUNT_TOKEN = "3a44621b338f407704d8cc03de292aa8"

  def self.send_text(phone, message)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, ACCOUNT_TOKEN)

    @account = @client.account
    @message = @account.sms.messages.create({:from => '+17738015482', :to => phone, :body => message})
  end
end