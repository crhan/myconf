#!/bin/bash
#sunpinyin_speed_up.sh
# Sunpinyin Speed Up Script for Ubuntu (by memory caching, and no data loss)
# You can run this script in background on GNOME logging in.
# Originally written Hubert Star, modified by Bob Robot (http://robotshell.org/).

# Capture the exit signal, make sure it is the FIRST uncommented line.
trap "do_exit" SIGHUP SIGINT SIGQUIT SIGTERM

SUN_DIR="${HOME}/.sunpinyin"
SHM_USERDICT="/dev/shm/sunpinyin_userdict.sh0"

# Backup the userdict and restore all changes made by this script on exit.
do_exit() {
  cp -f "${SHM_USERDICT}" "${SUN_DIR}/userdict.real"
  rm -f "${SHM_USERDICT}"
  mv -f "${SUN_DIR}/userdict.real" "${SUN_DIR}/userdict"
  exit 0
}

# Work around for abnormal quit.
if [ -e "${SUN_DIR}/userdict.real" ]
then
  rm -f "${SHM_USERDICT}"
  mv -f "${SUN_DIR}/userdict.real" "${SUN_DIR}/userdict"
fi

# Rename the real userdict, copy it to RAM and make a symblic link back.
# From now on the modification and query on userdict takes place in RAM.
mv -f "${SUN_DIR}/userdict" "${SUN_DIR}/userdict.real"
cp -f "${SUN_DIR}/userdict.real" "${SHM_USERDICT}"
ln -sf "${SHM_USERDICT}" "${SUN_DIR}/userdict"

# Automatically backup the userdict, make sure not losing the modification.
p_count=0
while [ true ]
do
  p_count=$(($p_count+1))
  sleep 1800
  
  p_size_shm=$(ls -l "${SHM_USERDICT}" | awk '{print $5}')
  p_size_real_t=$(ls -l "${SUN_DIR}/userdict.real" | awk '{print $5}')
  p_size_real=$(($p_size_real_t+512))
  
  if [ $p_count == 4 ]
  then
     p_count=0
     cp -f "${SHM_USERDICT}" "${SUN_DIR}/userdict.real"
  fi
  
  if [ $p_size_shm -ge $p_size_real ]
  then
     cp -f "${SHM_USERDICT}" "${SUN_DIR}/userdict.real"
  fi
done
