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
	
	def heroes
		success = true
		status = 'OK'
		
		active_key = ActiveKey.find_by apikey: params[:apikey]
		if (active_key == nil)
			result = {'success' => false, 'status' => 'wrong or inactive API Key. Try to login and get new one!'}
			render json: result
		else
			active_heroes = UserXHero.where('login' => active_key.login)
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
		end
	end
	
	def classes
		active_classes = Person.all
		classNames = Array.new
		classDescriptions = Array.new
		active_classes.each {|person| 
			classNames.push(person.person_name)
			classDescriptions.push(person.description)
		}
		result = {'success' => true, 'status' => 'OK', 'classes' => classNames, 'descriptions' => classDescriptions}
		render json: result
	end
	
	def factions
		active_factions = Faction.all
		factionNames = Array.new
		factionDescriptions = Array.new
		active_factions.each {|faction| 
			factionNames.push(faction.faction_name)
			factionDescriptions.push(faction.description)
		}
		result = {'success' => true, 'status' => 'OK', 'factions' => factionNames, 'descriptions' => factionDescriptions}
		render json: result
	end
	
end
