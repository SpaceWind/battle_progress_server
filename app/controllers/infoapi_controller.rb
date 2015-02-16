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
  
  
  def createTempHero
  uxh = UserXHero.new
	uxh.login = params[:login]
	uxh.heroid = params[:heroid]
	uxh.save
	result = {'OK' => uxh.heroid}
	render json: result
	hero = HeroDescriptor.new
	hero.hero = 'ferfcrf'
	#desc.heroid = 'IRCCFFCR'
	#desc.name = 'test hero '+params[:index]
	#desc.lvl = params[:lvl]
	#desc.mood = 0
	#desc.map = 'QQQQQQQQQQQQQQQQ'
	#desc.pack_max_size = 100
	#desc.exp = 7700
	#desc.exp_to_next_lvl = 12000
	#desc.x = 8
	#desc.y = 12
	#desc.class = params[:class]
	#desc.race = params[:race]
	#desc.save*/
	#result = {'heroid' => desc}
	#render json: result
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
	if (active_key == nil || ((DateTime.now - active_key.last_updated) / 1.hour) > 1)
		result = {'success' => false, 'status' => 'wrong or inactive API Key. Try to login and get new one!'}
		render json: result
	else
		active_heroes = UserXHero.where('login' => active_key.login)
		heroNames = Array.new
		heroIds = Array.new
		active_heroes.each { |hero|
			heroDesc = HeroDescriptor.find_by(heroid: hero.heroid)
			heroNames.push(heroDesc.name)
			heroIds.push(heroDesc.heroid)
		}
		result = {'success' => true, 'status' => 'OK', 'heroes' => heroIds, 'names' => heroNames}
		render json: result
	end
  end
end






