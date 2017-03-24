module Api::V1
  class RequestsController < ApplicationController
    before_action :authenticate
    # POST /requests/menus
    def create_menu
    end

    # PUT /requests/menus/:id
    def update_menu
    end

    # DELETE /requests/menus/:id
    def destroy_menu
    end

    # POST /requests/menus/:menu_id/recipes
    def create_menu_recipe
    end

    # DELETE /requests/menus/:menu_id/recipes/:id
    def destroy_menu_recipe
    end

    # POST /requests/recipes
    def create_recipe
    end

    # PUT /requests/recipes/:id
    def update_recipe
    end

    # DELETE /requests/recipes/:id
    def destroy_recipe
    end

  end
end
