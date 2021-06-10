class PlanetFilter
  attr_reader :galaxy, :radius

  def initialize(params)
    @galaxy = params.dig(:search, :galaxy)
    @radius = params.dig(:search, :radius)
  end

  def filter!
    @planets = Planet.all
    filter_by_galaxy
    filter_by_radius
    # ...

    @planets
  end

  private

  def filter_by_galaxy
    return unless galaxy.present?

    @planets = @planets.where(galaxy: galaxy)
  end

  def filter_by_radius
    return unless radius.present?

    @planets = @planets.where('radius <= ?', radius)
  end
end
