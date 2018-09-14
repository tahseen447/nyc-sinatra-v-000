class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(:name => params[:name])
    end
    if !params[:landmark][:name].empty? || !params[:landmark][:year_completed].empty?
      @figure.landmarks << Landmark.create(:name =>params[:landmark][:name], :year_completed =>params[:landmark][:year_completed])
    end
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit'


end
