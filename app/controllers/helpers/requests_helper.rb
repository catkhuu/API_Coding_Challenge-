module RequestsHelper
  BASE_URL = 'https://plated-coding-challenge.herokuapp.com'
  AUTHORIZATION_HEADER = { Authorization: 'Token token=' + ENV['PLATED_API_KEY'] }

  def create_menu(title)
    RestClient.post BASE_URL + '/v1/menus.json', { title: title }, AUTHORIZATION_HEADER
  end

  def update_menu(menu_id, title)
    RestClient.put BASE_URL + "/v1/menus/#{menu_id}.json", { title: title }, AUTHORIZATION_HEADER
  end

  def delete_menu(menu_id)
    RestClient.delete BASE_URL + "/v1/menus/#{menu_id}.json", AUTHORIZATION_HEADER
  end

  def add_recipe_to_menu(menu_id, recipe_id)
    RestClient.post BASE_URL + "/v1/menus/#{menu_id}/recipes", { recipe_id: recipe_id }, AUTHORIZATION_HEADER
  end

  def remove_recipe_from_menu(menu_id, recipe_id)
    RestClient.delete BASE_URL + "/v1/menus/#{menu_id}/recipes/#{recipe_id}.json", AUTHORIZATION_HEADER
  end

  def create_recipe(recipe_description, recipe_name)
    RestClient.post BASE_URL + '/v1/recipes.json', { name: recipe_name, description: recipe_description }, AUTHORIZATION_HEADER
  end

  def update_recipe(recipe_description, recipe_name, recipe_id)
    RestClient.put BASE_URL + "/v1/recipes/#{recipe_id}.json", { name: recipe_name, description: recipe_description }, AUTHORIZATION_HEADER
  end

  def delete_recipe(recipe_id)
    RestClient.delete BASE_URL + "/v1/recipes/#{recipe_id}.json", AUTHORIZATION_HEADER
  end
end
