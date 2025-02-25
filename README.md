# About
A Dockerized version of the file management utility [Organize](https://github.com/tfeldmann/organize)

# Usage
## Paths
- config: directory where yaml rule file is stored
- source: directory with files that you want to process
- destination: directory for move and copy operations

## Single Run Example
```
docker run -it
	-v "/path/to/config/":/home/pi/.config/organize/ 
	-v "/path/to/logs/":/var/log/organize/
	-v "/source-folder/":/Input
	-v "/destination-folder/":/Output
	docker-organize
```

## CRONTAB Example
```
docker run -dit --rm --name docker-organize
	-v "/path/to/config/":/home/pi/.config/organize/ 
	-v "/path/to/logs/":/var/log/organize/
	-v "/source-folder/":/Input
	-v "/destination-folder/":/Output
	docker-organize
	"* * * * *"
```

The final line in the example above sets a crontab entry to run Organize once every minute.

Other sample crontab entries:
- `0 0,4,8,12,16 * * *` - Every 4 hours on the hour starting at midnight
- `0,30 * * * *` - On the hour and half hour of every hour
- `0 12 1 * *` - Noon on the first day of every month

More configurations can be generated at [Crontab Guru](https://crontab.guru/#0_*_*_*_*)

# How to build the image
First clone the respotory. Go in the directory.

```
sudo docker build -t docker-organize .
```
or
``` 
docker build -t docker-organize .
```
