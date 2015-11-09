#Code documented by comments in official file at https://github.com/fbongiovanni29/vimtorials
#Fourth and Fifth file added here and in tut variable
file = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0], Dir["four.*"][0], Dir["five.*"][0]]
page = VIM::Buffer.current
page = page.name.split('/').last
if page == "README.md"	
	VIM.command("vi tut_one.md")
	VIM.command("vs")
	VIM.command("vertical resize 75")
	VIM.command("vi #{Dir["one.*"][0]}")
	VIM.command("wincmd h")
end

if VIM::Window.current == VIM::Window[1] 
	VIM.command("wincmd h")
	puts "Run command again incorrect window!"
end

elem = file.index(page)
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md', 'tut_four.md', 'tut_five.md']

#Modulos changed to expand to five files
VIM.command("vertical resize 75")
VIM.command("vi #{file[(elem+1)%5]}")
VIM.command("wincmd l")
VIM.command("vi #{tut[(elem+1)%5]}")
VIM.command("wincmd h")

if file[elem].split('.')[1].to_s == "open"
	`open #{file[elem]}`
end

