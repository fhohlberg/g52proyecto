class AdminsController < ApplicationController

  def show_graphs
    @rest = Restaurante.all
  end

end
