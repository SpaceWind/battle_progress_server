class CreatureController < ApplicationController
	def getCreatures
		#returns pure creatures (not prefixes and postfixes)
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		creatures = nil
		mods_female = nil
		mods_male = nil
		prefix_creatures = nil
		suffix_creatures = nil
		mods_count = 0
		creature_count = 0
		prefix_count = 0
		suffix_count = 0
		spells_hash = Hash.new
		prefix_spells_hash = Hash.new
		suffix_spells_hash = Hash.new
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				creatures = Creature.where(creature_type: 'creature')

				mods_male = Lib.where(token: 'creatureMod.m')
				mods_female = Lib.where(token: 'creatureMod.f')
				mods_count = mods_male.count
				if (creatures)
					creature_count = creatures.count
					creatures.each {|creature|
						spells_array = Array.new
						mods_male.each {|mod|
							spells_for_creature_mod = CreatureXSpell.where(creature_type: 'creature', mod: mod.item, creature_name: creature.creature_name)
							spells_for_creature_mod.each{|spell|
								spells_array.push({'spell_name' => spell.spell_name, 'spell_class' => spell.spell_class})
							}
						}
						spells_hash[creature.creature_name] = spells_array
					}
				end
				
				
				prefix_creatures = Creature.where(creature_type: 'prefix')
				if (prefix_creatures)
					prefix_count = prefix_creatures.count
					prefix_creatures.each{|prefix|
						prefix_spells_array = Array.new
						spells_for_prefix = CreatureXSpell.where(creature_type: 'prefix', creature_name: prefix.creature_name)
						if (spells_for_prefix)
							spells_for_prefix.each {|prefix_spell|
								prefix_spells_array.push({'spell_name' => prefix_spell.spell_name, 'spell_class' => prefix_spell.spell_class})
							}
						end
						prefix_spells_hash[prefix.creature_name] = prefix_spells_array
					}
				end
				
				
				suffix_creatures = Creature.where(creature_type: 'suffix')
				if (suffix_creatures)
					suffix_count = suffix_creatures.count
					suffix_creatures.each{|suffix|
						suffix_spells_array = Array.new
						spells_for_suffix = CreatureXSpell.where(creature_type: 'suffix', creature_name: suffix.creature_name)
						if (spells_for_suffix)
							spells_for_suffix.each {|suffix_spell|
								suffix_spells_array.push({'spell_name' => suffix_spell.spell_name, 'spell_class' => suffix_spell.spell_class})
							}
						end
						suffix_spells_hash[suffix.creature_name] = suffix_spells_array
					}
				end
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		
		render json: {'success' => success, 'status' => status, 'mods_count' => mods_count, 'mods_male' => mods_male, 'mods_female' => mods_female, 
		        'creatures' => creatures, 'creature_count' => creature_count, 'creature_spells' => spells_hash, 
				'prefixes' => prefix_creatures, 'prefix_count' => prefix_count, 'prefix_spells' => prefix_spells_hash,
				'suffixes' => suffix_creatures, 'suffix_count' => suffix_count, 'suffix_spells' => suffix_spells_hash}
	end
	
	def removeCreature
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				creatures = Creature.where(creature_name: params[:creature_name])
				creatures.destroy
				spells = CreatureXSpell.where(creature_name: params[:creature_name])
				spells.destroy
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
	
	def saveCreature
		#?creature_type=creature&creature_name=гоблин&mod=0&str=12&dex=9&mag=12&in=18&tra=22&vel=90&hp=220&mana=180&gender=male
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				creature = Creature.new 
				found_creature = Creature.find_by creature_type: params[:creature_type], creature_name: params[:creature_name]
				if (found_creature)
					creature = found_creature
					if (params[:rename])
						creature.creature_name = params[:rename]
					end
				end
				creature.creature_type = params[:creature_type]
				creature.mod = params[:mod]
				creature.str = params[:str]
				creature.dex = params[:dex]
				creature.mag = params[:mag]
				creature.int = params[:int]
				creature.tra = params[:tra]
				creature.vel = params[:vel]
				creature.hp = params[:hp]
				creature.mana = params[:mana]
				creature.gender = params[:gender]
				creature.save
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
	def saveSpellsForCreature
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spell_class_tokens = params[:spells].split('@')
				spell_class_tokens.each {|token|
					spell_desc_tokens = token.split('_')
					current_spell_class = spell_desc_tokens[0]
					current_spell_name = spell_desc_tokens[1]
					creature_x_spell = CreatureXSpell.find_by creature_type: 'creature', creature_name: params[:creature_name], mod: params[:mod], spell_class: current_spell_class, spell_name: current_spell_class
					if (!creature_x_spell)
						new_creature_x_spell = CreatureXSpell.new
						new_creature_x_spell.creature_type = 'creature'
						new_creature_x_spell.creature_name = params[:creature_name]
						new_creature_x_spell.mod = params[:mod]
						new_creature_x_spell.spell_class = current_spell_class
						new_creature_x_spell.spell_name = current_spell_name
						new_creature_x_spell.save
					end
				}
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
	def saveAdditionalSpellsForCreature
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spell_class_tokens = params[:spells].split('@')
				spell_class_tokens.each {|token|
					spell_desc_tokens = token.split('_')
					current_spell_class = spell_desc_tokens[0]
					current_spell_name = spell_desc_tokens[1]
					creature_x_spell = CreatureXSpell.find_by creature_type: params[:creature_type], creature_name: params[:creature_name], spell_class: current_spell_class, spell_name: current_spell_class
					if (!creature_x_spell)
						new_creature_x_spell = CreatureXSpell.new
						new_creature_x_spell.creature_type = params[:creature_type]
						new_creature_x_spell.creature_name = params[:creature_name]
						new_creature_x_spell.spell_class = current_spell_class
						new_creature_x_spell.spell_name = current_spell_name
						if (params[:creature_type] == 'prefix')
							new_creature_x_spell.prefix_name = params[:name]
						else
							new_creature_x_spell.suffix_name = params[:name]
						end
						new_creature_x_spell.save
					end
				}
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
	def removeSpell
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spell = nil
				if (params[:creature_type] == 'creature')
					spell = CreatureXSpell.find_by creature_type: 'creature', creature_name: params[:creature_name], spell_class: params[:spell_class], spell_name: params[:spell_name], mod: params[:mod]
				end
				if (params[:creature_type] == 'prefix')
					spell = CreatureXSpell.find_by creature_type: 'prefix', creature_name: params[:creature_name], spell_class: params[:spell_class], spell_name: params[:spell_name], prefix_name: params[:prefix]
				end
				if (params[:creature_type] == 'suffix')
					spell = CreatureXSpell.find_by creature_type: 'suffix', creature_name: params[:creature_name], spell_class: params[:spell_class], spell_name: params[:spell_name], suffix_name: params[:prefix]
				end
				if (spell)
					spell.destroy
				end
			else
				success = false
				status = 'Wrong User'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
	
end
