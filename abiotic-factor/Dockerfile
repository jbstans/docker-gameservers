FROM cm2network/steamcmd:steam-bookworm as base
USER 0
RUN	    dpkg --add-architecture i386 && \
	    mkdir /server && chmod 777 /server && \
	    cp /home/steam/steamcmd/steamcmd.sh /usr/local/bin/steamcmd && \
    	    apt update && apt install -y wget && \
	    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
	    mkdir -pm755 /etc/apt/keyrings && \
	    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources && \
	    apt update && \
	    apt install -y --install-recommends winehq-stable
USER 1000
RUN         /home/steam/steamcmd/steamcmd.sh \
	    +@sSteamCmdForcePlatformType windows \
	    +force_install_dir /server \
	    +login anonymous \
	    +app_update 2857200 validate \
	    +quit

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
