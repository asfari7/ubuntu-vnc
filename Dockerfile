# Menggunakan image dasar Ubuntu
FROM ubuntu:20.04

# Mengatur timezone (opsional, sesuaikan jika perlu)
ENV TZ=America/New_York

# Instalasi dependensi dan desktop environment (LXDE + VNC server)
RUN apt update && apt install -y \
    lxde \
    tightvncserver \
    dbus-x11 \
    x11vnc \
    wget \
    && apt clean

# Set password untuk VNC (misalnya 'password', Anda bisa menggantinya dengan password lain)
RUN mkdir -p /root/.vnc && echo "password" | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd

# Expose ports yang dibutuhkan (VNC dan HTTP untuk akses via browser)
EXPOSE 5901 6080

# Menjalankan VNC server dan LXDE
CMD ["bash", "-c", "tightvncserver :1 -geometry 1280x800 -depth 24 && tail -f /dev/null"]
