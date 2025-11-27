# 🚀 Freeroot – Simple & Clean Installation Guide (Ubuntu)

## 🔽 Step 1 — Clone the repository

```bash
git clone https://github.com/foxytouxxx/freeroot.git
```

## 📂 Step 2 — Enter the folder

```bash
cd freeroot
```

## 📥 Step 3 — Download Alpine minirootfs

👉 Get the latest link from: https://alpinelinux.org/downloads/

```bash
wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz
```

## 📦 Step 4 — Extract the tarball

```bash
tar -xzf alpine-minirootfs-3.22.2-x86_64.tar.gz
```

## ▶ Step 5 — Run the script

```bash
bash root.sh
```

---

# ⚡ One-shot Installation Command

```bash
git clone https://github.com/foxytouxxx/freeroot.git && cd freeroot && wget https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz && tar -xzf alpine-minirootfs-3.22.2-x86_64.tar.gz && bash root.sh
```

---

# 🔁 If everything is already installed — Run this

```bash
cd freeroot
bash root.sh
```

---

# 🔧 Update Alpine System

```bash
apk update
apk upgrade
```

---

# 🟩 Minecraft Server Setup Guide

## ☕ Step 1 — Install Java

```bash
apk add openjdk21-jre-headless
```

## 📁 Step 2 — Create server folder

```bash
mkdir minecraft_server
```

## 📂 Step 3 — Enter folder

```bash
cd minecraft_server
```

## 🌐 Step 4 — Download PaperMC server (.jar)

👉 Get latest JAR from: https://papermc.io/downloads/

```bash
wget https://fill-data.papermc.io/v1/objects/d5f47f6393aa647759f101f02231fa8200e5bccd36081a3ee8b6a5fd96739057/paper-1.21.10-115.jar
```

---

# ⚙ Step 5 — Create `start.sh`

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

---

## 🔐 Step 6 — Make script executable

```bash
chmod +x start.sh
```

## ▶ Step 7 — Start your Minecraft server

```bash
./start.sh
```

---

# 🌍 Make Your Server Public (Playit.gg)

## Step 1 — Install Playit.gg

```bash
mkdir /root/playit_gg
cd /root/playit_gg
wget https://github.com/playit-cloud/playit-agent/releases/download/v0.16.4/playit-linux-amd64
```

## Step 2 — Run Playit

```bash
chmod +x playit-linux-amd64
./playit-linux-amd64
```

## Step 3 — Login → Create tunnel → Enjoy 🎮

---

# 🧪 Open New Root Shell Anytime

```bash
cd freeroot
bash root.sh
```

# 🟩 Start Minecraft Server Again

```bash
cd minecraft_server
./start.sh
```

# 🌐 Start Playit.gg Tunnel

```bash
cd playit_gg
./playit-linux-amd64
```

---

# 📊 Monitor CPU / RAM Usage

```bash
apk add htop
htop
```

---

✨ **Your environment is now ready! Enjoy hosting your Minecraft server anywhere!**
