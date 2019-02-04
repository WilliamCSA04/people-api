class PeoplesController < ApplicationController

  def index
    begin
      id_to_search = params[:id]
      people = People.find(id_to_search)
      render(json: people.as_json, status: :ok)
    rescue => error
      render(json: {error: error.message}, status: :unprocessable_entity)
    end
  end

  def all
    peoples = People.all
    render(json: peoples.as_json, status: :ok)
  end

  def create!
    begin
      people = People.create!(create_params)
      render(json: people.as_json, status: :ok)
    rescue => error
      render_exception(error.message)
    end
  end

  private

  def render_exception(message)
    render(json: {error: message}, status: :unprocessable_entity)
  end

  def create_params
    params.permit(:name, :birth_at)
  end

end