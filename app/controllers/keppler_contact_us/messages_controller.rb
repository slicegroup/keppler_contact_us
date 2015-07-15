#Generado con Keppler.
require_dependency "keppler_contact_us/application_controller"

module KepplerContactUs
  class MessagesController < ApplicationController  
    before_filter :authenticate_user!
    layout 'admin/application', except: [:new]
    load_and_authorize_resource
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    # GET /messages
    def index
      messages = Message.searching(@query).all
      @objects, @total = messages.page(@current_page), messages.size
      redirect_to messages_path(page: @current_page.to_i.pred, search: @query) if !@objects.first_page? and @objects.size.zero?
    end

    # GET /messages/1
    def show
      message = Message.find_by(id: params[:id])
      message.update(read: true)
    end

    # POST /messages
    def create
      @message = Message.new(message_params)
      ContactMailer.contact(message_params).deliver
      if @message.save
        redirect_to KepplerContactUs.redirection, notice: 'Message was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /messages/1
    def update
      if @message.update(message_params)
        redirect_to @message, notice: 'Message was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /messages/1
    def destroy
      @message.destroy
      redirect_to messages_url, notice: 'Message was successfully destroyed.'
    end

    def destroy_multiple
      Message.destroy redefine_ids(params[:multiple_ids])
      redirect_to messages_path(page: @current_page, search: @query), notice: "Usuarios eliminados satisfactoriamente" 
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = Message.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def message_params
        params.require(:message).permit(:name, :subject, :email, :content, :read)
      end
  end
end
