secrets =
{
	"DEVISE_SECRET_KEY" => "",
	"SECRET_TOKEN" => "",
	"SECRET_KEY_BASE" => ""
}

secrets.inject(secrets) {|s, (key, v)| s[key] = `rake secret`; s}

File.open("config/application.yml", "w+") do |yaml|
  secrets.each_pair {|k,v| yaml << "\n#{k}: #{v}"}
end
puts "Complete"