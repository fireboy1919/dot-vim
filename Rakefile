desc "Installs the .vim and .vimrc files"
task :install do |t|
  PWD = ENV['PWD']
  puts "Where to install? [#{ENV['HOME']}]"
  root = $stdin.gets.chomp 
  root = root.empty? ? ENV['HOME'] : root

  dot_vim_target = File.join root, '.vim'
  vimrc_target = File.join root, '.vimrc'
  dot_vim = File.join PWD, '.vim'
  vimrc = File.join PWD, '.vimrc'

  puts "Linking files..."
  %x(ln -s #{dot_vim} #{dot_vim_target})
  %x(ln -s #{vimrc} #{vimrc_target})
end

task :default => :install