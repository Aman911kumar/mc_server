# Freeroot – Simple Installation Steps (Ubuntu)

## Step 1 — Clone the repository
```bash
git clone https://github.com/foxytouxxx/freeroot.git
```

## Step 2 — Enter the folder
```bash
cd freeroot
```

## Step 3 — Download Alpine minirootfs - get latest link from https://alpinelinux.org/downloads/
```bash
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz
```

## Step 4 — Extract the tarball - Upadte fille name to you
```bash
tar -xzf alpine-minirootfs-3.22.2-x86_64.tar.gz
```

## Step 5 — Run the script
```bash
bash root.sh
```

## One-shot command (all steps together)
```bash
git clone https://github.com/foxytouxxx/freeroot.git && 
cd freeroot && 
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz && 
tar -xzf alpine-minirootfs-3.22.2-x86_64.tar.gz && 
bash root.sh
```

## If you have completed all steps above — Run the script
```bash
cd ./freeroot
bash root.sh
```
# Upadte the system

```bash
apk update
apk upgrade
```

# Minecraft Server Setup Steps


## Step 1 - install java

```bash
apk add openjdk21-jre-headless
```

## Step 2 - Create folder

```bash
mkdir minecraft_server
```
## Step 3 - Enter the folder
```bash
cd minecraft_server
```

## Step 4 - Install the server file - from https://papermc.io/downloads/
```bash
wget https://fill-data.papermc.io/v1/objects/d5f47f6393aa647759f101f02231fa8200e5bccd36081a3ee8b6a5fd96739057/paper-1.21.10-115.jar
```
## Step 5 - Create `start.sh` file and pate this code
```bash
#!/bin/bash
cd ~/minecraft_server

JAR_FILE=$(ls *.jar 2>/dev/null | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No .jar file found in ~/minecraft_server"
  exit 1
fi

if [ -f eula.txt ]; then
  if grep -q "eula=true" eula.txt; then
    echo "✅ EULA already accepted."
  else
    echo "⚠️ EULA not accepted, fixing..."
    sed -i 's/eula=false/eula=true/' eula.txt

    # If file doesn't contain any "eula=" line, append it
    if ! grep -q "eula=" eula.txt; then
      echo "eula=true" >> eula.txt
    fi
  fi
else
  echo "eula=true" > eula.txt
  echo "📄 Created eula.txt with eula=true"
fi

echo "▶ Starting Minecraft server using $JAR_FILE"

java -Xms2G -Xmx6G -jar "$JAR_FILE" nogui

```
## Step 6 - give executable permission to start.sh
```bash
chmod +x start.sh
```
## Step 7 - Start the server

```bash
./start.sh
```

# Making server public

## Step 1 - Create playit_gg folder and Install playit.gg
```bash
mkdir /root/playit_gg 
cd /root/playit_gg
wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.4/playit-linux-amd64
```
## Step 2 - Run playit.gg
```bash
chmod +x playit-linux-amd64
./playit-linux-amd64
```
## Step 3 - login to playit.gg and create tunnel and you are all set to minecraft
