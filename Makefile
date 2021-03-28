dockername = localweb
url = https://www.chiark.greenend.org.uk/~sgtatham/

install:
	wget --mirror -p --convert-links -P /tmp/$(dockername) $(url)bugs.html
	rsync -avzhe ssh /tmp/$(dockername) skex86ns@192.168.122.222:/tmp/$(dockername)
	docker -H ssh://skex86ns@192.168.122.222:22 run --rm -d -p 8080:80 --name $(dockername) -v /tmp/$(dockername):/usr/share/nginx/html nginx
	rm -rf /tmp/$(dockername)
