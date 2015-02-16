json.array!(@hero_descs) do |hero_desc|
  json.extract! hero_desc, :id, :heroid, :name, :lvl, :mood, :pack_max_size, :exp, :exp_to_next_lvl, :x, :y, :class, :race
  json.url hero_desc_url(hero_desc, format: :json)
end
