class GoogleMapStyle
  JSON.parse(File.read(File.expand_path 'config/google_map_styles.json', Rails.root)).each do |style_name, values|
    self.const_set(style_name.upcase, values)
  end
end