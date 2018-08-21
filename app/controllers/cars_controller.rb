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
    @car = Car.find_by("year = ? AND make LIKE ? AND model LIKE ?", year, make, model)
    render json: @car
  end

  def home
    # 'year' method is not necessary for single page app with full database...
    # year
  end
end
