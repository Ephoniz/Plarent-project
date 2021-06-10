class PlanetFilter
  attr_reader :galaxy, :radius, :atmosphere, :temperature, :price

  def initialize(params)
    @galaxy = params.dig(:search, :galaxy)
    @radius = params.dig(:search, :radius)
    @atmosphere = params.dig(:search, :atmosphere)
    @temperature = params.dig(:search, :temperature)
    @price = params.dig(:search, :price)
  end

  def filter!
    @planets = Planet.all
    filter_by_galaxy
    filter_by_radius
    filter_by_price
    filter_by_temperature
    filter_by_atmosphere

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

  def filter_by_temperature
    return unless temperature.present?

    @planets = @planets.where('temperature <= ?', temperature)
  end

  def filter_by_price
    return unless price.present?

    @planets = @planets.where('price <= ?', price)
  end

  def filter_by_atmosphere
    return unless atmosphere.present?

    @planets = @planets.where(atmosphere: atmosphere)
  end
end
