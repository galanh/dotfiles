# Recordar hacer backup cuando modifique este archivo en:
# 	cd /home/gato/dotfiles/bash
# 	cp ~/.bash_aliases .
#
# Desde el punto de vista sistémico la clasificación es importante

# Remplazar comando GUI para no perder el tiempo:
#
# How do I suspend or hibernate from bash shell command:
alias s='systemctl suspend'
alias shr='shutdown now'

# Para Archivos:
#
# Cambiar directorio de interes
alias b='cd ~/bin ; ls -ltr --color | tail -n5'
# --color Enables colored output for ls, automatically detecting if your terminal supports colors
alias t='ls -ltr --color | tail -n25'                                                       
# ver solo directorios
alias d='ll | grep "^d"'                                                       
# ultimos 20 archivos modificados de todos los directorios de vinwiki
# la version de findrecent.py
alias v="cd ~/vimwiki ; (find . -type f -printf '%T@ %p\n' | sort -k1,1nr | head -20 | sort -k1,1n) ; cd ~/"
# Latex cursos
alias CV='cd /home/gato/Documents/Personal/Empleo/Ejemplos_curriculums/Latex-CV/3-columns ; ls -ltr --color | tail -n15'
# Latex CV
alias cursos='cd /home/gato/Documents/Latex/cursos ; ls -ltr --color *.tex | tail -n15'

# Para Comandos:
#
# Ultimos 20 comandos:
alias h='history | tail -20'
# forzar la ruta absoluta /usr/bin/ffmpeg, saltaste Miniconda
alias ffmpeg='/usr/bin/ffmpeg'


# Para Herramientas:
#
# Usar la configuracion vim.pack francesa
alias nvimp='NVIM_APPNAME="nvimp" nvim'
# Usar la configuracion completa experimental de neovim
alias nvimc='NVIM_APPNAME="nvimc" nvim'
# Usar la configuracion en nvim_backup/
alias nvim_backup='NVIM_APPNAME="nvim_backup" nvim'
# notebook
alias j='cd ~/jupyter ; jupyter notebook &'
# ipython con librerias
alias ipy='ipython -i ~/bin/ipython_comandos.py'

# Para radian
#
# Usar versión específica de libstdc++
#alias rad='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 radian'

# Para freemind
#
# muestra ultimos archivos en los subdirectorios FreeMind*
alias f='ls -Rrt ~/freemind* | tail -n20'

# Para openshot
alias openshot='/home/gato/AppImagenes/OpenShot-v3.5.1-x86_64.AppImage'


