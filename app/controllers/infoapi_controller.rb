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
				
				result = {'success' => true, 'apikey' => new_apikey, 'group' => user.group}
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
		user.realname = params[:realname]
		user.group = 'players'
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
  

	def self.getHeroDesc(statPrefix, genderPrefix, value)
		result_text = ''
		if (value <= 3)
			str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-2'
			result_text += str_text.value
		else
			if (value >=4 && value <=6)
				str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-1'
				result_text += str_text.value
			else
				if (value >= 7 && value <=9)
					str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':0'
					result_text += str_text.value
				else
					if (value >= 10 && value <=13)
						str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':1'
						result_text += str_text.value
					else
						if (value >= 14 && value <=18)
							str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':2'
							result_text += str_text.value
						else
							str_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':3'
							result_text += str_text.value
						end
					end
				end
			end
		end
		result_text
	end
	
	def self.getHeroDescMainStats(statPrefix, genderPrefix, value)
		result_text = ''
		if (value <= 45)
			hp_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':-1'
			result_text += hp_text.value
		else
			if (result_hp >=75)
				hp_text = Lib.find_by token:'heroDesc', item: genderPrefix + statPrefix + ':1'
				result_text += hp_text.value + ' '
			else
				result_text += ' '
			end
		end
		result_text
	end
	
	def rollHero
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		result_str = 10
		result_dex = 10
		result_mag = 10
		result_int = 10
		result_tra = 10
		result_vel = 10
		result_hp  = 60
		result_mana = 60
		result_text = ''
		result_value = 0
		gender_prefix = ''
		if (params[:gender] == 'female')
			gender_prefix = 'f'
		end
		
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				specs = ClassSpecs.find_by class_name: params[:class_name]
				if (specs)
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_str += specs.str*2 + current_random_value
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_dex += specs.dex*2 + current_random_value
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_mag += specs.mag*2 + current_random_value
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_int += specs.int*2 + current_random_value
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_tra += specs.tra*2 + current_random_value
					current_random_value = rand(7) - 3
					result_value += current_random_value
					result_vel += specs.vel*2 + current_random_value
					current_random_value = rand(31) - 16
					result_value += current_random_value / 5
					result_hp += specs.hp*2 + current_random_value
					current_random_value = rand(31) - 16
					result_value += current_random_value / 5
					result_mana += specs.mana*2 + current_random_value
					if (result_str < 0)
						result_str = 0
					end
					if (result_dex < 0)
						result_dex = 0
					end
					if (result_mag < 0)
						result_mag = 0
					end
					if (result_int < 0)
						result_int = 0
					end
					if (result_tra < 0)
						result_tra = 0
					end
					if (result_vel < 0)
						result_vel = 0
					end
					if (result_hp < 0)
						result_hp = 0
					end
					if (result_mana < 0)
						result_mana = 0
					end
					
					result_text += getHeroDesc('str', gender_prefix, result_str) + ' '
					result_text += getHeroDesc('dex', gender_prefix, result_dex) + ' '
					result_text += getHeroDesc('mag', gender_prefix, result_mag) + ' '
					result_text += getHeroDesc('int', gender_prefix, result_int) + ' '
					result_text += getHeroDesc('tra', gender_prefix, result_tra) + ' '
					result_text += getHeroDescMainStats('hp', gender_prefix, result_hp) + ' '
					result_text += getHeroDescMainStats('mana', gender_prefix, result_mana) + ' '
					result_text += getHeroDesc('vel', gender_prefix, result_vel)
				end
			end
		end

		result = {'success' => success, 'status' => status, 'quality' =>result_value, 'str' => result_str, 'dex' => result_dex, 'mag' => result_mag, 
		  'int'=> result_int, 'tra' => result_tra, 'vel' => result_vel, 'hp' => result_hp, 'mana' => result_mana, 'desc' => result_text}
		render json: result
	end
end






