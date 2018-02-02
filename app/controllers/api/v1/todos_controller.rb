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

      def update
        todo = Todo.find(params[:id])

        if todo.update_attributes(todo_params)
          render json: {status: 'SUCCESS', message:'Updated a todo list', data:todo}, status: :ok
        else
          render json: {status: 'ERROR', message:'Todo list not updated', data:todo.error}, status: :unprocessable_entity
        end
      end

      def destroy
        todo = Todo.find(params[:id])

        todo.destroy
        render json: {status: 'SUCCESS', message:'Deleted list', data:todo}, status: :ok
      end

      private
        def todo_params
          params.permit(:list)
        end
    end
  end
end
