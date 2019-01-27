class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      redirect_to root_path
      flash[:success] = 'Email successfully delivered'
    else
      render :new
    end
  end

  def thanks
    flash[:success] = 'Email successfully delivered'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
