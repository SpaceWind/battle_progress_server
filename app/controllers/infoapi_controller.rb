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
		userCount = User.count
		user = User.new
		user.login = params[:login]
		user.password = Digest::SHA2.hexdigest(params[:pass])
		user.realname = params[:realname]
		if (userCount == 0)
			user.group = 'admins'
		else
			user.group = 'players'
		end
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
					
					result_text += Lib.getHeroDesc('str', gender_prefix, result_str) + ' 'Lolka не такой уж и сильный, как кажется на первый взгляд. Да, он может врезать и дать пинка, но сильный противник без проблем уничтожит наглого асверка, поэтому тот предпочитает запугивать, а не драться по-настоящему. Неуклющий мишка – так называли Lolka, когда он был маленьким. У него все летит из рук, он ничего не умеет делать хорошо и качественно. Тонкие искусства ему недоступны. С удовольствием отучившись на мага, Lolka начал промышлять магией самостоятельно. Его заклинания закалились в бою, и он просто обожает их использовать. Там кастанёт, тут кастанёт. И сидит радуется всем назло! Тупорылый имбецил, он не может промолвить даже пару слов и постоянно испражняется под себя. Такое элитное поведение вызывает у всех вокруг насмешки, а в детстве это привело Lolka к настоящей травле. Ох уж этот Lolka – он настоящая душа компании, то пошутит, то пританцовывать начнет. Вокруг себя он мгновенно собирает народ, и люди его любят. Он делится с ними своей радостью и своим вечно хорошим настроением. И всем становится хорошо. А еще герой благословлен матушкой землей, из-за чего он сильнее чем он мог быть до этого. А еще герой проклят небесами и поэтому ему зачастую не хватает сил сколдовать что-либо реально сильное. Красавчик асверок, он стройно выглядит, подтянутый сексуальный тип без единой морщинки и прыщика. Настоящий боец. По крайней мере таким он кажется девчонкам. Природная красота и таланты помогут ему на полях битвы.
					result_text += Lib.getHeroDesc('dex', gender_prefix, result_dex) + ' '
					result_text += Lib.getHeroDesc('mag', gender_prefix, result_mag) + ' '
					result_text += Lib.getHeroDesc('int', gender_prefix, result_int) + ' '
					result_text += Lib.getHeroDesc('tra', gender_prefix, result_tra) + ' '
					result_text += Lib.getHeroDescMainStats('hp', gender_prefix, result_hp) + ' '
					result_text += Lib.getHeroDescMainStats('mana', gender_prefix, result_mana) + ' '
					result_text += Lib.getHeroDesc('vel', gender_prefix, result_vel)
					
					
					
					###################################################################################
					if (active_key.rolled_heroid)
						prev_h_desc = HDescriptor.find_by hid: active_key.rolled_heroid
						if (prev_h_desc)
							prev_h_desc.destroy
						end
						prev_h_stats = HeroStats.find_by heroid: active_key.rolled_heroid
						if (prev_h_stats)
							prev_h_stats.destroy
						end
					end
					gen_heroid = rand(36**16).to_s(36)	
					t = HDescriptor.new
					t.hid = gen_heroid
					t.hclass = params[:class_name]
					t.save
					
					gen_herostats = HeroStats.new
					
					gen_herostats.str = result_str
					gen_herostats.dex = result_dex
					gen_herostats.mag = result_mag
					gen_herostats.int = result_int
					gen_herostats.tra = result_tra
					gen_herostats.vel = result_vel
					gen_herostats.current_hp = result_hp
					gen_herostats.current_mana = result_mana
					gen_herostats.max_hp = result_hp
					gen_herostats.max_mana = result_mana
					
				    gen_herostats.start_str = result_str
					gen_herostats.start_dex = result_dex
					gen_herostats.start_mag = result_mag
					gen_herostats.start_int = result_int
					gen_herostats.start_tra = result_tra
					gen_herostats.start_vel = result_vel
					gen_herostats.start_hp = result_hp
					gen_herostats.start_mana = result_mana
					gen_herostats.desc = result_text
					
					gen_herostats.save
					active_key.rolled_heroid = gen_heroid
					active_key.save
				else
					success = false
					status = 'Specs Was not found for class'
				end
			else
				success = false
				status = 'User assinged to this APIKEY was not found'
			end
		else
			success = false
			status = 'Wrong or Inactive APIKEY'
		end
		

		result = {'success' => success, 'status' => status, 'quality' =>result_value, 'str' => result_str, 'dex' => result_dex, 'mag' => result_mag, 
				  'int'=> result_int, 'tra' => result_tra, 'vel' => result_vel, 'hp' => result_hp, 'mana' => result_mana, 'desc' => result_text}
		render json: result
	end
	
	def saveRolledChamp
		success = true;
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login
			if (user)
				if (active_key.rolled_heroid)
					hd = HDescriptor.find_by hid: active_key.rolled_heroid
					hd.hero_name = params[:name]
					hd.mood = 0
					hd.lvl = 1
					hd.pack_max_size = 30
					hd.experience = 0
					hd.exp_to_next_lvl = 1000
					hd.hrace = params[:faction]
					hd.save
					
					uxh = UserXHero.new
					uxh.login = user.login
					uxh.heroid = active_key.rolled_heroid
					uxh.save
					active_key.rolled_heroid = nil
					active_key.save
				else
					success = false
					status = 'User didnt roll champ'
				end
			else
				success = false
				status = 'User assigned to this APIKEY was not found'
			end
		else
			success = false
			status = 'Wrong or Inactive APIKEY'
		end
		result = {'success' => success, 'status' => status}
	end
end






