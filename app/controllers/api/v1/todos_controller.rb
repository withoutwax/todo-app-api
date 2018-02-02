module Api
  module V1
    class TodosController < ApplicationController

      def index
        todos = Todo.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded todo lists', data:todos}, status: :ok
      end

      def show
        todo = Todo.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded a single todo list', data:todo}, status: :ok
      end

      def create
        todo = Todo.new(todo_params)

        if todo.save
          render json: {status: 'SUCCESS', message:'Saved a todo list', data:todo}, status: :ok
        else
          render json: {status: 'ERROR', message:'Todo list not saved', data:todo.error}, status: :unprocessable_entity
        end
      end

      private
        def todo_params
          params.permit(:list)
        end
    end
  end
end
