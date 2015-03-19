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
								spells_array.push({'spell_name' => spell.spell_name, 'spell_class'=>spell.spell_class})
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
						spells_for_prefix = CreatureXSpell.where(creature_type: 'prefix')
						prefix_spells_array = 
					}
				end
				
				
				
				suffix_creatures = Creature.where(creture_type: 'suffix')
			end
		end
	end
end
