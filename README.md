# rpicam-etom

## How to Install:
### Update & Upgrade
```bash
sudo apt-get update && sudo apt-get upgrade -y
```

### Enable Legacy camera support
```bash
sudo raspi-config
# Select Interfacing Options
# Select Camera
# Select Yes
sudo reboot
```

### Install RPi Cam Web interface repo:
```bash
sudo apt-get install git -y # install git
git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git # clone RPi Cam Web interface repo
cd RPi_Cam_Web_Interface
./install.sh # install RPi Cam Web interface
# start the RPi Cam Web interface
sudo sed -i '3s|DocumentRoot /var/www|DocumentRoot /var/www/html|' /etc/apache2/sites-available/raspicam.conf # change DocumentRoot
sudo systemctl restart apache2 # restart apache2
```

### Motion notification to Discord channel
```bash
# Put end_box.sh into macros folder
sudo chmod +x end_box.sh
sudo chown www-data:www-data end_box.sh