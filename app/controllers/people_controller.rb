class PeopleController < ApplicationController

  def show
    begin
      id_to_search = params[:id]
      people = People.find(id_to_search)
      render(json: people.as_json, status: :ok)
    rescue => error
      render_error(error.message)
    end
  end

  def index
    peoples = People.all
    render(json: peoples.as_json, status: :ok)
  end

  def create
    people = People.new(create_params)
    if people.save
      render(json: people.as_json, status: :ok)
    else
      render_error(people.errors)
    end
  end

  def update
    id_to_search = params[:id]
    people = People.find_by_id(id_to_search)
    if people.update(update_params)
      render(json: people.as_json, status: :ok)
    else
      render_error(people.errors)
    end
  end

  def destroy
    id_to_search = params[:id]
    people = People.find_by_id(id_to_search)
    if people.destroy
      render(json: people.as_json, status: :ok)
    else
      render_error(people.errors)
    end
  end

  private

  def render_error(message)
    render(json: {error: message}, status: :unprocessable_entity)
  end

  def create_params
    params.permit(:name, :birth_at)
  end

  def update_params
    params.permit(:name, :age)
  end
end