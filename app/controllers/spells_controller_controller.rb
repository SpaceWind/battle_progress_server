class SpellsControllerController < ApplicationController

	def getSpells
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		spells = nil
		spells_count = 0
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spells = Spell.where(spell_class: params[:spell_class])
				if (spells)
					spells_count = spells.count
				end
			else
				success = false
				status = 'User is not admin'
			end
		else
			success = false
			status = 'Wrong or inactive apikey'
		end
		render json: {'success' => success, 'status' => status, 'spells_count' => spells_count, 'spells' => spells}
	end
	
	def getAllSpellNames
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		spells_array = Array.new
		spells_count = 0
		if (active_key)
			spells = Spell.all
			if (spells)
				spells_count = spells.count
				spells.each {|spell|
					spells_array.push({'spell_name' => spell.spell_name, 'spell_class' => spell.spell_class})
				}
			end
		else
			success = false
			status = 'Wrong or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status, 'spells' => spells_array}
	end
	
	def saveSpells
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		spell = nil
		spells_count = 0
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spell = Spell.find_by spell_class: params[:sc], spell_name: params[:sn]
				if (spell)
					#if we are overwriting spell
					if (params[:rn])
						renamed_spell = Spell.find_by spell_class: params[:sc], spell_name: params[:rn]
						if (renamed_spell)
							spell.destroy
							spell = renamed_spell
						end
						spell.spell_name = params[:rn]
					end
					spell.spell_desc = params[:d]
					spell.save
				else #when we need new spell
					spell = Spell.new
					spell.spell_class = params[:sc]
					spell.spell_name = params[:sn]
					spell.spell_desc = params[:d]
					spell.save
				end
			else
				status = 'User is not admin'
				success = false
			end
		else
			status = 'Invalid or Inactive APIKEY'
			success = false
		end
		render json: {'success' => success, 'status' => status}
	end
	
	def destroySpell
		success = true
		status = 'OK'
		active_key = ActiveKey.find_by apikey: params[:apikey]
		user = nil
		spell = nil
		spells_count = 0
		if (active_key)
			user = User.find_by login: active_key.login, group: 'admins'
			if (user)
				spell = Spell.find_by spell_class: params[:spell_class], spell_name: params[:spell_name]
				if (spell)
					spell.destroy
				else
					success = false
					status = 'Spell was not found'
				end
			else
				success = false
				status = 'User is not admin or does not exist'
			end
		else
			success = false
			status = 'Invalid or Inactive APIKEY'
		end
		render json: {'success' => success, 'status' => status}
	end
	
end
