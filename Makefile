shell:
	@ssh -i "~/.ssh/ec2-titian.pem" ec2-user@ec2-18-212-24-122.compute-1.amazonaws.com

build:
	@docker build -t browna2/titan-ox .

launch:
	@docker-compose up -d

down:
	@docker-compose down --rmi all --remove-orphans

deploy:
	@rsync -av — progress -e "ssh -i ~/.ssh/ec2-titian.pem" ~/dev/aws-ox-ec2-titan/ ec2-user@ec2-18-212-24-122.compute-1.amazonaws.com:/home/ec2-user/opt/app/aws-ox-ec2-titan
	   