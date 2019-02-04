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

end