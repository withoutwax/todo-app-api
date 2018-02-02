module Api
  module v1
    class TodosController < ApplicationController

      def index
        @todos = Todo.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded todo lists', data:@todos}, status:ok
      end
      
    end
  end
end
