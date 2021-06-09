class PagesController < ApplicationController
  def home
    @planets = Planet.all.first(8)
  end
end
