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
					
					relation = ClanRelation.new
					relation.rel_type = 'faction'
					relation.rel_name = params[:faction_name]
					relation.save
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
					
					relation = ClanRelation.new
					relation.rel_type = 'class'
					relation.rel_name = params[:person_name]
					relation.save
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
				result = {'success' => false, 'status' => 'Incorrect User'}
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
	####################################################################################################
	def getRelations
		success = true
		status = 'OK'
		friendly = nil
		hostile = nil
		relation = ClanRelation.find_by rel_type: params[:relation_type], rel_name: params[:relation_name]
		if (relation)
			friendly = relation.friendly
			hostile = relation.hostile
		else
			success = false
			status = 'No relation Found!'
		end
		result = {'status' => status, 'success' => success, 'friendly' => friendly, 'hostile' => hostile, 'name' => params[:relation_name]}
		render json: result
	end
	
	def checkRelation
		success = true
		status = 'OK'
		rel = nil
		relation = ClanRelation.find_by rel_type: params[:relation_type], rel_name: params[:relation_name]
		if (relation)
			friendly = relation.friendly
			hostile = relation.hostile
			if friendly.include? params[:relate_to]
				rel = 'friendly'
			else
				if hostile.include? params[:relate_to]
					rel = 'hostile'
				else
					rel = 'neutral'
				end
			end
		else
			success = false
			status = 'Relation is not found'
			rel = 'neutral'
		end
		result = {'status' => status, 'success' => success, 'relation' => rel}
		render json: result
	end
	
	def relList
		rel = ClanRelation.all
		render json: rel
	end
	
	def createRelation
		success = true
		status = 'OK'
		
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				relation = nil
				foundRelation = ClanRelation.find_by rel_name: params[:rel_name]
				if (foundRelation)
					status = 'FOUND????'
					relation = foundRelation
				else
					relation = ClanRelation.new
				end
				relation.rel_type = params[:rel_type]
				relation.rel_name = params[:rel_name]
				relation.friendly = params[:f]
				relation.hostile = params[:h]
				relation.save
			else
				success = false
				status = 'Incorrect User'
			end
		end
		render json: {'success' => success, 'status' => status}
	end
	
	################################################################################
	def setupClassSpecs
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				specs = nil
				foundSpecs = ClassSpecs.find_by class_name: params[:class_name]
				if (foundSpecs)
					status = 'overwriting specs'
					specs = foundSpecs
				else
					specs = ClassSpecs.new
				end
				specs.class_name = params[:class_name]
				if (params[:str])
					specs.str = params[:str]
				else
					specs.str = 0
				end
				if (params[:dex])
					specs.dex = params[:dex]
				else
					specs.dex = 0
				end
				if (params[:int])
					specs.int = params[:int]
				else
					specs.int = 0
				end
				if (params[:mag])
					specs.mag = params[:mag]
				else
					specs.mag = 0
				end
				if (params[:tra])
					specs.tra = params[:tra]
				else
					specs.tra = 0
				end
				if (params[:vel])
					specs.vel = params[:vel]
				else
					specs.vel = 0
				end
				if (params[:hp])
					specs.hp = params[:hp]
				else
					specs.hp = 0
				end
				if (params[:mana])
					specs.mana = params[:mana]
				else
					specs.mana = 0
				end
				specs.save
			else
				success = false
				status = 'Incorrect User'
			end
		else
			success = false
			status = 'Inactive APIKEY'
		end
		result = {'success' => success, 'status' => status}
		render json: result
	end

	def getClassSpecs
		success = true
		status = 'OK'
		s = nil
		specs = ClassSpecs.find_by class_name: params[:class_name]
		if (specs)
			s = 'str: ' + specs.str.to_s + ';dex: ' + specs.dex.to_s + ';mag: ' + specs.mag.to_s + ';int: '+ specs.int.to_s + ';tra: ' + specs.tra.to_s + ';vel: ' + specs.vel.to_s + ';hp: ' + specs.hp.to_s + ';mana: ' + specs.mana.to_s
		else
			success = false
			status = 'Specs were not found'
		end
		result = {'success' => success, 'status' => status, 'specs' => s}
		render json: result
	end
	
	def allspecs
		s = ClassSpecs.all
		render json: s
	end
	
end