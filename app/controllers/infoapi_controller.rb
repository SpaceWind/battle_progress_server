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
		
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				specs = ClassSpecs.find_by class_name: params[:class_name]
				if (specs)
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_str += specs.str*2 + current_random_value
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_dex += specs.dex*2 + current_random_value
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_mag += specs.mag*2 + current_random_value
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_int += specs.int*2 + current_random_value
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_tra += specs.tra*2 + current_random_value
					current_random_value = random(7) - 4
					result_value += current_random_value
					result_vel += specs.vel*2 + current_random_value
					current_random_value = random(31) - 16
					result_value += current_random_value / 5
					result_hp += specs.hp*2 + current_random_value
					current_random_value = random(31) - 16
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
					
					if (result_str <= 3)
						str_text = Lib.find_by token:'heroDesc', item: 'str:-2'
						result_text += str_text.value
					else
						if (result_str >=4 && result_str <=6)
							str_text = Lib.find_by token:'heroDesc', item: 'str:-1'
							result_text += str_text.value
						else
							if (result_str >= 7 && result_str <=9)
								str_text = Lib.find_by token:'heroDesc', item: 'str:0'
								result_text += str_text.value
							else
								if (result_str >= 10 && result_str <=13)
									str_text = Lib.find_by token:'heroDesc', item: 'str:1'
									result_text += str_text.value
								else
									if (result_str >= 14 && result_str <=18)
										str_text = Lib.find_by token:'heroDesc', item: 'str:2'
										result_text += str_text.value
									else
										str_text = Lib.find_by token:'heroDesc', item: 'str:3'
										result_text += str_text.value
									end
								end
							end
						end
					end
					result_text += ' '
					if (result_dex <= 3)
						dex_text = Lib.find_by token:'heroDesc', item: 'dex:-2'
						result_text += dex_text.value
					else
						if (result_dex >=4 && result_dex <=6)
							dex_text = Lib.find_by token:'heroDesc', item: 'dex:-1'
							result_text += dex_text.value
						else
							if (result_dex >= 7 && result_dex <=9)
								dex_text = Lib.find_by token:'heroDesc', item: 'dex:0'
								result_text += dex_text.value
							else
								if (result_dex >= 10 && result_dex <=13)
									dex_text = Lib.find_by token:'heroDesc', item: 'dex:1'
									result_text += dex_text.value
								else
									if (result_dex >= 14 && result_dex <=18)
										dex_text = Lib.find_by token:'heroDesc', item: 'dex:2'
										result_text += dex_text.value
									else
										dex_text = Lib.find_by token:'heroDesc', item: 'dex:3'
										result_text += dex_text.value
									end
								end
							end
						end
					end
					result_text += ' '
					if (result_mag <= 3)
						mag_text = Lib.find_by token:'heroDesc', item: 'mag:-2'
						result_text += mag_text.value
					else
						if (result_mag >=4 && result_mag <=6)
							mag_text = Lib.find_by token:'heroDesc', item: 'mag:-1'
							result_text += mag_text.value
						else
							if (result_mag >= 7 && result_mag <=9)
								mag_text = Lib.find_by token:'heroDesc', item: 'mag:0'
								result_text += mag_text.value
							else
								if (result_mag >= 10 && result_mag <=13)
									mag_text = Lib.find_by token:'heroDesc', item: 'mag:1'
									result_text += mag_text.value
								else
									if (result_mag >= 14 && result_mag <=18)
										mag_text = Lib.find_by token:'heroDesc', item: 'mag:2'
										result_text += mag_text.value
									else
										mag_text = Lib.find_by token:'heroDesc', item: 'mag:3'
										result_text += mag_text.value
									end
								end
							end
						end
					end
					result_text += ' '
					
					if (result_int <= 3)
						int_text = Lib.find_by token:'heroDesc', item: 'int:-2'
						result_text += int_text.value
					else
						if (result_int >=4 && result_int <=6)
							int_text = Lib.find_by token:'heroDesc', item: 'int:-1'
							result_text += int_text.value
						else
							if (result_int >= 7 && result_int <=9)
								int_text = Lib.find_by token:'heroDesc', item: 'int:0'
								result_text += int_text.value
							else
								if (result_int >= 10 && result_int <=13)
									int_text = Lib.find_by token:'heroDesc', item: 'int:1'
									result_text += int_text.value
								else
									if (result_int >= 14 && result_int <=18)
										int_text = Lib.find_by token:'heroDesc', item: 'int:2'
										result_text += int_text.value
									else
										int_text = Lib.find_by token:'heroDesc', item: 'int:3'
										result_text += int_text.value
									end
								end
							end
						end
					end
					result_text += ' '
					
					if (result_tra <= 3)
						tra_text = Lib.find_by token:'heroDesc', item: 'tra:-2'
						result_text += tra_text.value
					else
						if (result_tra >=4 && result_tra <=6)
							tra_text = Lib.find_by token:'heroDesc', item: 'tra:-1'
							result_text += tra_text.value
						else
							if (result_tra >= 7 && result_tra <=9)
								tra_text = Lib.find_by token:'heroDesc', item: 'tra:0'
								result_text += tra_text.value
							else
								if (result_tra >= 10 && result_tra <=13)
									tra_text = Lib.find_by token:'heroDesc', item: 'tra:1'
									result_text += tra_text.value
								else
									if (result_tra >= 14 && result_tra <=18)
										tra_text = Lib.find_by token:'heroDesc', item: 'tra:2'
										result_text += tra_text.value
									else
										tra_text = Lib.find_by token:'heroDesc', item: 'tra:3'
										result_text += tra_text.value
									end
								end
							end
						end
					end
					result_text += ' '
					if (result_hp <= 45)
						hp_text = Lib.find_by token:'heroDesc', item: 'hp:-1'
						result_text += hp_text.value + ' '
					else
						if (result_hp >=75)
							hp_text = Lib.find_by token:'heroDesc', item: 'hp:1'
							result_text += hp_text.value + ' '
						else
							result_text += ' '
						end
					end
					
					if (result_mana <= 45)
						mana_text = Lib.find_by token:'heroDesc', item: 'mana:-1'
						result_text += mana_text.value + ' '
					else
						if (result_mana >=75)
							mana_text = Lib.find_by token:'heroDesc', item: 'mana:1'
							result_text += mana_text.value + ' '
						else
							result_text += ' '
						end
					end
					
					if (result_vel <= 3)
						vel_text = Lib.find_by token:'heroDesc', item: 'vel:-2'
						result_text += vel_text.value
					else
						if (result_vel >=4 && result_vel <=6)
							vel_text = Lib.find_by token:'heroDesc', item: 'vel:-1'
							result_text += vel_text.value
						else
							if (result_vel >= 7 && result_vel <=9)
								vel_text = Lib.find_by token:'heroDesc', item: 'vel:0'
								result_text += vel_text.value
							else
								if (result_vel >= 10 && result_vel <=13)
									vel_text = Lib.find_by token:'heroDesc', item: 'vel:1'
									result_text += vel_text.value
								else
									if (result_vel >= 14 && result_vel <=18)
										vel_text = Lib.find_by token:'heroDesc', item: 'vel:2'
										result_text += vel_text.value
									else
										vel_text = Lib.find_by token:'heroDesc', item: 'vel:3'
										result_text += vel_text.value
									end
								end
							end
						end
					end
					
				end
			end
		end

		result = {'success' => success, 'status' => status, 'quality' =>result_value, 'str' => result_str, 'dex' => result_dex, 'mag' => result_mag, 
		  'int'=> result_int, 'tra' => result_tra, 'vel' => result_vel, 'hp' => result_hp, 'mana' => result_mana, 'desc' => result_text}
		render json: result
	end
end






