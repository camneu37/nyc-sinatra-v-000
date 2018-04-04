class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.landmarks << Landmark.find_or_create_by(params[:landmark]) if !params[:landmark][:name].empty?
    figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find_by_id(params[:id])
    figure.update(params[:figure])
    figure.landmarks << Landmark.find_or_create(params[:landmark]) if !params[:landmark][:name].empty?
    figure.titles << Title.find_or_create_by(params[:title]) if !params[:title][:name].empty?
    redirect "/figures/#{figure.id}"
  end

end
