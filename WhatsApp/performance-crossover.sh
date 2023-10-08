echo "Setting vm.max_map_count"
sudo sysctl -w vm.max_map_count=16777216

echo "applying change persistently."

# Check if the sysctl command was successful
if [ $? -eq 0 ]; then
  echo "vm.max_map_count set to 16777216 successfully. (NobaraTweaks)"

  # Make the change persistent in a configuration file
  echo "vm.max_map_count=16777216" > /etc/sysctl.d/99-custom-max-map-count.conf

  # Apply the change without rebooting
  sudo sysctl -p /etc/sysctl.d/99-custom-max-map-count.conf

  if [ $? -eq 0 ]; then
    echo "Change made persistent."
  else
    echo "Failed to make the change persistent."
  fi
else
  echo "Failed to set vm.max_map_count."
fi



