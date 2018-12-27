require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      user.activation_token = User.new_token
      expect(mail.subject).to eq("Account Activation")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome to Cheatsheets! Click on the link below to activate your account:")
      expect(mail.body.encoded).to match(user.name)
      expect(mail.body.encoded).to match(user.activation_token)
      expect(mail.body.encoded).to match(CGI.escape(user.email))
    end
  end

  describe "password_reset" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      user.reset_token = User.new_token
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
      expect(mail.body.encoded).to match("To reset your password click the link below:")
      expect(mail.body.encoded).to match(user.reset_token)
      expect(mail.body.encoded).to match(CGI.escape(user.email))
          end

    it "renders the body" do
      # For some unknown reason mail had an evaluation error here but didn't in the activation spec. Unsure why this happens. Would prefer to seperate but can't
    end
  end

end
