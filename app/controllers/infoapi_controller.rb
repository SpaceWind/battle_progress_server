class InfoapiController < ApplicationController
	
	def login
	require 'digest/sha2'
	require 'date'
		if (params[:login] == nil || params[:pass] == nil)
			result = {'success' => false, 'status' => 'incorrect user params'}
			render json: result
		else
			user = User.find_by login: params[:login], password: Digest::SHA2.hexdigest(params[:pass])
			if (user)
				new_apikey = rand(36**12).to_s(36)
				
				active_key = ActiveKey.find_by login: params[:login]
				if (active_key)
					active_key.destroy
				end
				active_key = ActiveKey.new
				active_key.apikey = new_apikey
				active_key.login = params[:login]
				active_key.last_updated = DateTime.now
				active_key.heroid = nil
				active_key.last_controlled = DateTime.now
				active_key.rolled_heroid = nil
				active_key.save
				
				result = {'success' => true, 'apikey' => new_apikey}
				render json: result
			else
				result = {'success' => false, 'status' => 'wrong login/pass combination'}
				render json: result
			end
	end
  end
  
  def signup
  require 'digest/sha2'
	if (params[:login] == nil || params[:pass] == nil)
		result = {'success' => false, 'status' => 'incorrect user'}
		render json: result
	elsif (User.find_by login: params[:login])
		result = {'success' => false, 'status' => 'user already exists'}
		render json: result
	else
		user = User.new
		user.login = params[:login]
		user.password = Digest::SHA2.hexdigest(params[:pass])
		user.save
		result = {'success' => true, 'status'=> 'user created'}
		render json: result
	end
  end
  
  def userExists
	result = nil
	if (params[:login] == nil)
		result = {'success' => false, 'status' => 'Incorrect login', 'exists' => false}
	elsif (User.find_by login: params[:login])
		result = {'success' => true, 'status' => 'user already exists', 'exists' => true}
	else
		result = {'success' => true, 'status' => 'OK', 'exists' => false}
	end
	render json: result
  end
  
  def ping
	result = {'success' => true, 'status' => 'Server is UP'}
	render json: result
  end
  
  
  def createTempHero
	gen_heroid = rand(36**16).to_s(36)
	uxh = UserXHero.new
	uxh.login = params[:login]
	uxh.heroid = gen_heroid
	uxh.save
	
	t = HDescriptor.new
	t.hid = gen_heroid
	t.hero_name = params[:name]
	t.mood = 500
	t.save
	result = {'hero' => t}
	render json: result
  end
  
  def createTempUserxHero
	uxh = UserXHero.new
	uxh.login = params[:login]
	uxh.heroid = params[:heroid]
	uxh.save
	result = {'OK' => uxh.heroid}
	render json: result
  end
  
  def heroes
  require 'date'
	active_key = ActiveKey.find_by apikey: params[:apikey]
	if (active_key == nil)
		result = {'success' => false, 'status' => 'wrong or inactive API Key. Try to login and get new one!'}
		render json: result
	else
		active_heroes = UserXHero.where('login' => active_key.login)
		heroNames = Array.new
		heroIds = Array.new
		active_heroes.each { |hero|
			heroDesc = HDescriptor.find_by(hid: hero.heroid)
			heroNames.push(heroDesc.hero_name)
			heroIds.push(heroDesc.hid)
		}
		result = {'success' => true, 'status' => 'OK', 'heroes' => heroIds, 'names' => heroNames}
		render json: result
	end
  end
end






