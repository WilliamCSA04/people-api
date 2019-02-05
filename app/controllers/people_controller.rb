class PeopleController < ApplicationController

  def show
    begin
      id_to_search = params[:id]
      person = Person.find(id_to_search)
      render(json: person.as_json, status: :ok)
    rescue => error
      render_error(error.message)
    end
  end

  def index
    persons = Person.all
    render(json: persons.as_json, status: :ok)
  end

  def create
    person = Person.new(create_params)
    if person.save
      render(json: person.as_json, status: :ok)
    else
      render_error(person.errors)
    end
  end

  def update
    id_to_search = params[:id]
    person = Person.find_by_id(id_to_search)
    if person.update(update_params)
      render(json: person.as_json, status: :ok)
    else
      render_error(person.errors)
    end
  end

  def destroy
    id_to_search = params[:id]
    person = Person.find_by_id(id_to_search)
    if person.destroy
      render(json: person.as_json, status: :ok)
    else
      render_error(person.errors)
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