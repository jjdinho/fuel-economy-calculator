require 'pg'

class CarsController < ApplicationController
  def year
    # Not necessary for single page app with full database...

    # cars = Car.select('year')
    # @years = cars.map do |car|
    #   car.year
    # end
    # @years = @years.uniq.sort

    # render json: @years, callback: 'yearsQuery'
  end

  def make
    year = params[:year].to_i
    cars = Car.select('make').where(year: year)
    @makes = cars.map do |car|
      car.make
    end
    @makes = @makes.uniq.sort
    render json: @makes
  end

  def model
    year = params[:year].to_i
    make = params[:make]
    cars = Car.where("year = ? AND make LIKE ?", year, make)
    @models = cars.map do |car|
      car.model
    end
    @models = @models.uniq.sort
    render json: @models
  end

  def result
    year = params[:year].to_i
    make = params[:make]
    model = params[:model]
    miles = params[:miles].to_i
    @car = Car.find_by("year = ? AND make LIKE ? AND model LIKE ?", year, make, model)
    @miles_info = calculate_mileage_info(@car, miles)
    @result = {car: @car, fuel: @miles_info}
    render json: @result
  end

  def home
    # 'year' method is not necessary for single page app with full database...
    # year
  end

  private

  def calculate_mileage_info(car, miles)
    world_trips = miles / 24901
    gallons_consumed = miles / car.mileage
    {trips: world_trips, gallons: gallons_consumed}
  end
end
