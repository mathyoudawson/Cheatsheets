class ContactsMailer < ApplicationMailer
  default from: "admin@example.com"

  layout "mailer"

  def general_message(contact)
    @contact = contact
    mail :to => "mattdawson@outlook.com", :subject => "You Have a Message From Cheatsheets"
  end
end
