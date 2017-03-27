module Api::V1
  class RequestsController < ApplicationController
    before_action :authenticate, :generate_proxy_request
    # POST /requests/menus
    def create_menu
      @menu = @proxy_request.create_a_menu(params[:title])
      render json: @menu, status: @menu['code']
    end

    # PUT /requests/menus/:id
    def update_menu
      @menu = @proxy_request.update_menu(params[:id], params[:title])
      render json: @menu, status: @menu['code']
    end

    # DELETE /requests/menus/:id
    def destroy_menu
      @response = @proxy_request.delete_menu(params[:id])
      render json: @response, status: @response['code']
    end

    # POST /requests/menus/:menu_id/recipes
    def create_menu_recipe
      @menu_recipe = @proxy_request.add_recipe_to_menu(params[:menu_id], params[:recipe_id])
      render json: @menu_recipe, status: @menu_recipe['code']
    end

    # DELETE /requests/menus/:menu_id/recipes/:id
    def destroy_menu_recipe
      @response = @proxy_request.remove_recipe_from_menu(params[:menu_id], params[:id])
      render json: @response, status: @response['code']
    end

    # POST /requests/recipes
    def create_recipe
      @recipe = @proxy_request.create_recipe(params[:recipe_description], params[:recipe_name])
      render json: @recipe, status: @recipe['code']
    end

    # PUT /requests/recipes/:id
    def update_recipe
      @recipe = @proxy_request.update_recipe(params[:recipe_description], params[:recipe_name], params[:id])
      render json: @recipe, status: @recipe['code']
    end

    # DELETE /requests/recipes/:id
    def destroy_recipe
      @response = @proxy_request.delete_recipe(params[:id])
      render json: @response, status: @response['code']
    end

    private

    def generate_proxy_request
      @proxy_request = Request.new
    end

  end
end
