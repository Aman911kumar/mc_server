#!/bin/bash
set -e

echo "=============================="
echo "  FREEROOT + MC SERVER SETUP"
echo "=============================="

# ----- Freeroot Setup -----
echo "[1] Cloning Freeroot..."
git clone https://github.com/foxytouxxx/freeroot.git || true
cd freeroot

echo "[2] Downloading Alpine Minirootfs..."
wget -q https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/x86_64/alpine-minirootfs-3.22.2-x86_64.tar.gz

echo "[3] Extracting Alpine..."
tar -xzf alpine-minirootfs-3.22.2-x86_64.tar.gz

echo "[4] Running Freeroot..."
bash root.sh

echo ""
echo "=============================="
echo "  ALPINE INSIDE FREEROOT NOW"
echo "=============================="

# Update system
apk update
apk upgrade

# ----- JAVA -----
echo "[5] Installing OpenJDK..."
apk add openjdk21-jre-headless

# ----- MC Server -----
echo "[6] Creating Minecraft directory..."
mkdir -p ~/minecraft_server
cd ~/minecraft_server

echo "[7] Downloading PaperMC..."
wget -q https://fill-data.papermc.io/v1/objects/d5f47f6393aa647759f101f02231fa8200e5bccd36081a3ee8b6a5fd96739057/paper-1.21.10-115.jar

# ----- Create start.sh -----
echo "[8] Creating start.sh..."

cat << 'EOF' > start.sh
#!/bin/bash
cd ~/minecraft_server

JAR_FILE=$(ls *.jar 2>/dev/null | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No .jar file found"
  exit 1
fi

# Fix/Generate EULA
if [ -f eula.txt ]; then
  if grep -q "eula=true" eula.txt; then
    echo "✅ EULA accepted"
  else
    sed -i 's/eula=false/eula=true/' eula.txt
    if ! grep -q "eula=" eula.txt; then
      echo "eula=true" >> eula.txt
    fi
  fi
else
  echo "eula=true" > eula.txt
fi

echo "▶ Starting server: $JAR_FILE"
java -Xms2G -Xmx6G -jar "$JAR_FILE" nogui
EOF

chmod +x start.sh

# ----- Playit.gg -----
echo "[9] Installing Playit.gg..."

mkdir -p ~/playit_gg
cd ~/playit_gg
wget -q https://github.com/playit-cloud/playit-agent/releases/download/v0.16.4/playit-linux-amd64
chmod +x playit-linux-amd64

# ----- HTOP -----
echo "[10] Installing htop..."
apk add htop

echo ""
echo "=============================="
echo "  INSTALLATION COMPLETE 🎉"
echo "=============================="
echo ""
echo "Start Minecraft Server:"
echo "  cd ~/minecraft_server && ./start.sh"
echo ""
echo "Run Playit.gg:"
echo "  cd ~/playit_gg && ./playit-linux-amd64"
echo ""
echo "Re-enter Freeroot:"
echo "  cd ~/freeroot && bash root.sh"
echo ""
