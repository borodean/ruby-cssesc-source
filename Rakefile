require 'multi_json'
require 'open-uri'

def execute(banner, command)
  say("#{ banner }...")
  output = `#{command} 2>&1`
  unless $?.success?
    $stderr.puts("  \e[31mOops, something went wrong!\e[0m\n\n")
    $stderr.puts(output)
    exit(1)
  end
  output
end

def say(line)
  puts "  \e[32m=>\e[0m #{ line }"
end

task :update do
  raw             = open('http://registry.npmjs.org/cssesc') { |io| io.binmode.read }
  metadata        = MultiJson.load(raw)
  current_version = File.read('VERSION')
  version         = ENV['VERSION'] || metadata['dist-tags']['latest']
  tarball         = metadata['versions'][version]['dist']['tarball']

  say "Updating cssesc source from #{ current_version } to #{ version }"
  execute 'cleaning up old files', 'rm -rf cssesc.tgz package vendor'
  execute "download cssesc #{ version }", "wget #{ tarball } -O cssesc.tgz"
  execute "unpacking cssesc #{ version }", 'tar -zxvf cssesc.tgz'
  execute 'cleaning up', 'rm -rf cssesc.tgz'
  execute 'updating cssesc dependencies', 'mv package vendor && cd vendor && npm install --production'

  say 'updating VERSION file'
  File.open('VERSION', 'w') { |file| file.write(version) }
  say 'done!'
end
