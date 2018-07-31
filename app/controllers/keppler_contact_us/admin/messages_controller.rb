require_dependency 'keppler_contact_us/application_controller'
module KepplerContactUs
  module Admin
    # MessagesController
    class MessagesController < ApplicationController
      layout 'keppler_contact_us/admin/layouts/application'
      include ObjectQuery
      include KepplerContactUs::Concerns::Commons
      include KepplerContactUs::Concerns::History
      include KepplerContactUs::Concerns::DestroyMultiple


      # GET /messages
      def index 
        respond_to_formats(model.all)
        redirect_to_index if nothing_in_first_page?(@objects)
      end
      
      def new
        @object = model.new
      end

      # GET /messages/1
      def show
        @object.update(read: true)
      end

      # DELETE /messages/1
      def destroy
        @object.destroy
        redirect_to_index
      end

      def destroy_multiple
        model.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index
      end

      def favorite
        @object.update(favorite: (@object.favorite ? false : true))
      end

      def sort
        model.sorter(params[:row])
        redirect_to_index
      end
      
      def read
        @objects = @objects.where(read: true)
        @total = model.where(read: true).count
      end
      
      def unread
        @objects = @objects.where(read: false)
        @total = model.where(read: false).count
      end

      def favorites
        @objects = @objects.where(favorite: true)
        @total = model.where(favorite: true).count
      end

      def reply
        @to = params[:to]
        @subject = params[:subject]
      end 
      
      def share
        # @to = params[:to]
        @subject = params[:subject]
      end

      private

      # Only allow a trusted parameter 'white list' through.
      def message_params
        params.require(:message).permit(
          :name,
          :email,
          :subject,
          :content,
          :favorite,
          :read,
          :position,
          :deleted_at
        )
      end
    end
  end
end
