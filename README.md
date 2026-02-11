# cyberpanel-mods
Small tweaks to cyberpanel

# Restore cyberpanel core database 
Download cyberpanel core database:
```
wget https://raw.githubusercontent.com/LearningSpot/cyberpanel-mods/refs/heads/main/cyberpanel.sql
```

Restore cyberpanel database:
```
sh <(curl https://raw.githubusercontent.com/LearningSpot/cyberpanel-mods/refs/heads/main/restore_cyberpanel_database.sh || wget -O - https://raw.githubusercontent.com/LearningSpot/cyberpanel-mods/refs/heads/main/restore_cyberpanel_database.sh)
```
