class AdminApiController < ApplicationController

	def promote
		user = User.find_by login: params[:login]
		if (user)
			user.group = 'admins'
			user.save
			result = {'success' => true, 'status' => 'OK'}
			render json: result
		else
			result = {'success' => false, 'status' => "user" + params[:login] + " does not exists"}
			render json: result
		end
	end
	
	def check
		user = User.find_by login: params[:login]
		if (user)
			if (user.group == 'admins')
				result = {'success' => true, 'status' => 'OK'}
				render json: result
			else
				result = {'success' => false, 'status' => 'User is not admin'}
				render json: result
			end
		else
			result = {'success' => false, 'status' => 'User does not exists'}
			render json: result
		end
	end
	
	def newFaction
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				find_faction = Faction.find_by faction_name: params[:faction_name]
				if (find_faction)
					status = 'Overwrited faction'
					find_faction.description = params[:description]
					find_faction.lib_imp = params[:lib_imp]
					find_faction.lib_rop = params[:lib_rop]
					find_faction.lib_dap = params[:lib_dap]
					find_faction.lib_vip = params[:lib_vip]
					find_faction.lib_tvp = params[:lib_tvp]
					find_faction.lib_prp = params[:lib_prp]
					find_faction.save
				else
					faction = Faction.new
					faction.faction_name = params[:faction_name]
					faction.lib_imp = params[:lib_imp]
					faction.lib_rop = params[:lib_rop]
					faction.lib_dap = params[:lib_dap]
					faction.lib_vip = params[:lib_vip]
					faction.lib_tvp = params[:lib_tvp]
					faction.lib_prp = params[:lib_prp]
					faction.description = params[:description]
					faction.save
				end
			else
				success = false
				status = 'User does not exist or is not admin'
			end
		else
			success = false
			status = 'wrong or inactive API Key. Try to login and get new one!'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def newClass
		success = true
		status = 'OK'
			
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				find_person = Person.find_by person_name: params[:person_name]
				if (find_person)
					status = 'class overwrited!'
					find_person.description = params[:description]
					find_person.lib_imp = params[:lib_imp]
					find_person.lib_rop = params[:lib_rop]
					find_person.lib_dap = params[:lib_dap]
					find_person.lib_vip = params[:lib_vip]
					find_person.lib_tvp = params[:lib_tvp]
					find_person.lib_prp = params[:lib_prp]
					find_person.save
				else
					person = Person.new
					person.person_name = params[:person_name]
					person.lib_imp = params[:lib_imp]
					person.lib_rop = params[:lib_rop]
					person.lib_dap = params[:lib_dap]
					person.lib_vip = params[:lib_vip]
					person.lib_tvp = params[:lib_tvp]
					person.lib_prp = params[:lib_prp]
					person.description = params[:description]
					person.save
				end
			else
				success = false
				status = 'User does not exist or is not admin'
			end
		else
			success = false
			status = 'wrong or inactive API Key. Try to login and get new one!'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end
	
	def cleanClassDesc
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				person = Person.find_by person_name: params[:person_name]
				if (person)
					person.description = nil
					person.save
				else
					success = false
					status = 'Class was not found'
				end
			else
				success = false
				status = 'You are not allowed to do it'
			end
		else
			success = false
			status = 'Api key is inactive'
		end	
		result = {'success' => success, 'status' => status}
		render json: result	
	end
	
	
	def cleanFactionDesc
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				faction = Faction.find_by faction_name: params[:faction_name]
				if (faction)
					faction.description = nil
					faction.save
				else
					success = false
					status = 'Faction was not found'
				end
			else
				success = false
				status = 'You are not allowed to do it'
			end
		else
			success = false
			status = 'Api key is inactive'
		end	
		result = {'success' => success, 'status' => status}
		render json: result	
	end
	
	def classAppendDesc
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				person = Person.find_by person_name: params[:person_name]
				if (person)
					if (person.description)
						person.description = person.description + params[:description]
					else
						person.description = params[:description]
					end
					person.save
				else
					success = false
					status = 'Class was not found'
				end
			else
				success = false
				status = 'You are not allowed to do it'
			end
		else
			success = false
			status = 'Api key is inactive'
		end	
		result = {'success' => success, 'status' => status, 'name' => params[:person_name], 'item' => 'Class'}
		render json: result
	end
	
	def factionAppendDesc
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				faction = Faction.find_by faction_name: params[:faction_name]
				if (faction)
					if (faction.description)
						faction.description = faction.description + params[:description]
					else
						faction.description = params[:description]
					end
					faction.save
				else
					success = false
					status = 'Faction was not found'
				end
			else
				success = false
				status = 'You are not allowed to do it'
			end
		else
			success = false
			status = 'Api key is inactive'
		end	
		result = {'success' => success, 'status' => status, 'name' => params[:faction_name], 'item' => 'Faction'}
		render json: result	
	end
	
	def heroes
		success = true
		status = 'OK'
		
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				active_heroes = UserXHero.where('login' => params[:login])
				heroNames = Array.new
				heroIds = Array.new
				heroLvls = Array.new
				heroRaces = Array.new
				heroFactions = Array.new
				active_heroes.each { |hero|
					heroDesc = HDescriptor.find_by(hid: hero.heroid)
					heroNames.push(heroDesc.hero_name)
					heroIds.push(heroDesc.hid)
					heroLvls.push(heroDesc.lvl)
					heroFactions.push(heroDesc.hrace)
					heroRaces.push(heroDesc.hclass)
				}
				result = {'success' => true, 'status' => 'OK', 'heroes' => heroIds, 'names' => heroNames, 'lvls' => heroLvls, 'races' => heroRaces, 'factions' => heroFactions}
				render json: result
			else
				reult = {'success' => false, 'status' => 'Incorrect User'}
			end
		else
			result = {'success' => false, 'status' => 'wrong or inactive API Key. Try to login and get new one!'}
			render json: result
		end
	end
	
	def classes
		active_classes = Person.all
		classNames = Array.new
		classDescriptions = Array.new
		class_lib_imp = Array.new
		class_lib_rop = Array.new
		class_lib_dap = Array.new
		class_lib_vip = Array.new
		class_lib_tvp = Array.new
		class_lib_prp = Array.new
		active_classes.each {|person| 
			classNames.push(person.person_name)
			classDescriptions.push(person.description)
			class_lib_imp.push(person.lib_imp)
			class_lib_rop.push(person.lib_rop)
			class_lib_dap.push(person.lib_dap)
			class_lib_vip.push(person.lib_vip)
			class_lib_tvp.push(person.lib_tvp)
			class_lib_prp.push(person.lib_prp)
		}
		result = {'success' => true, 'status' => 'OK', 'classes' => classNames, 'descriptions' => classDescriptions, 
				  'lib_imp' => class_lib_imp,  'lib_rop' => class_lib_rop, 'lib_dap' => class_lib_dap, 'lib_vip' => class_lib_vip, 'lib_tvp' => class_lib_tvp, 'lib_prp' => class_lib_prp}
		render json: result
	end
	
	def factions
		active_factions = Faction.all
		factionNames = Array.new
		factionDescriptions = Array.new
		faction_lib_imp = Array.new
		faction_lib_rop = Array.new
		faction_lib_dap = Array.new
		faction_lib_vip = Array.new
		faction_lib_tvp = Array.new
		faction_lib_prp = Array.new
		active_factions.each {|faction| 
			factionNames.push(faction.faction_name)
			factionDescriptions.push(faction.description)
			faction_lib_imp.push(faction.lib_imp)
			faction_lib_rop.push(faction.lib_rop)
			faction_lib_dap.push(faction.lib_dap)
			faction_lib_vip.push(faction.lib_vip)
			faction_lib_tvp.push(faction.lib_tvp)
			faction_lib_prp.push(faction.lib_prp)
		}
		result = {'success' => true, 'status' => 'OK', 'factions' => factionNames, 'descriptions' => factionDescriptions,
				  'lib_imp' => faction_lib_imp,  'lib_rop' => faction_lib_rop, 'lib_dap' => faction_lib_dap, 
				  'lib_vip' => faction_lib_vip, 'lib_tvp' => faction_lib_tvp, 'lib_prp' => faction_lib_prp}
		render json: result
	end
end
