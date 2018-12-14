module Api
  module V1
    class CheatsheetApisController < ApplicationController
      skip_before_action :verify_authenticity_token

      def show
        respond_to do |format|
          format.json { render json: { "message": "Successful GET request " } }
        end
      end

      def create
        @cheatsheet = Api::V1::DeserializerService.new(request.raw_post).process_json
        respond_to do |format|
          if @cheatsheet.save
            format.json { render json: { "message": "Cheatsheet sucessfully created" } }
          else
            format.json { render json: { "message": "Cheatsheets failed to save! #{@cheatsheet.errors.full_messages}"} }
          end
        end
      end

    end
  end
end
