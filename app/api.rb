require 'bundler/setup'
require 'sinatra/base'
require 'json'

$data = JSON.parse(File.read('data.json'))
$movies = $data['movies']
$directors = $data['directors']

class Api < Sinatra::Base

	get '/hello' do
		'Hello world!'
	end

	get '/movies' do
		content_type :json
		$movies.to_json
	end

	get '/movies/:id' do
		content_type :json
		id = params[:id]
		puts id
		puts id.scan(/\D/).empty?

		if id.scan(/\D/).empty? and $movies[id.to_i - 1]
			$movies[id.to_i - 1].to_json
		else
			'Error. Params id is not an integer or does not exists'
		end
	end

	get '/directors' do
		content_type :json
		$directors.to_json
	end

	get '/directors/:id' do
		content_type :json
		id = params[:id]
		puts id
		puts id.scan(/\D/).empty?

		if id.scan(/\D/).empty? and $directors[id.to_i - 1]
			$directors[id.to_i - 1].to_json
		else
			'Error. Params id is not an integer or does not exists'
		end
	end

end
