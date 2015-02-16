json.array!(@hero_descriptors) do |hero_descriptor|
  json.extract! hero_descriptor, :id, :heroid, :name, :lvl, :mood, :map, :pack_max_size, :exp, :exp_to_next_lvl, :x, :y, :class, :race
  json.url hero_descriptor_url(hero_descriptor, format: :json)
end
