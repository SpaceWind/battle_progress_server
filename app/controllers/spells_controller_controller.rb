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
	
end
