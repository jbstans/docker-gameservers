# Original taken from https://github.com/Pleut/abiotic-factor-linux-docker/blob/main/entrypoint.sh

SetUsePerfThreads="-useperfthreads "
if [[ $UsePerfThreads == "false" ]]; then
    SetUsePerfThreads=""
fi

SetNoAsyncLoadingThread="-NoAsyncLoadingThread "
if [[ $NoAsyncLoadingThread == "false" ]]; then
    SetNoAsyncLoadingThread=""
fi

MaxServerPlayers="${MaxServerPlayers:-6}"
Port="${Port:-7777}"
QueryPort="${QueryPort:-27015}"
ServerPassword="${ServerPassword:-password}"
SteamServerName="${SteamServerName:-LinuxServer}"
WorldSaveName="${WorldSaveName:-Cascade}"
AdditionalArgs="${AdditionalArgs:-}"

# Check for updates/perform initial installation
# if [ ! -d "/server/AbioticFactor/Binaries/Win64" ] || [[ $AutoUpdate == "true" ]]; then
#      /home/steam/steamcmd/steamcmd.sh \
#     +@sSteamCmdForcePlatformType windows \
#     +force_install_dir /server \
#     +login anonymous \
#     +app_update 2857200 validate \
#     +quit
# fi

wine /server/AbioticFactor/Binaries/Win64/AbioticFactorServer-Win64-Shipping.exe $SetUsePerfThreads$SetNoAsyncLoadingThread-MaxServerPlayers=$MaxServerPlayers \
    -PORT=$Port -QueryPort=$QueryPort -ServerPassword=$ServerPassword \
    -SteamServerName="$SteamServerName" -WorldSaveName="$WorldSaveName" -tcp $AdditionalArgs
