# run history
alias h='history'

# run freemind
alias f='cd ~/Freemind/freemind-bin-0.9.0 ; (./freemind.sh &) ; cd ~/Desktop'

# 
alias j='cd ~/Desktop/ipython ; jupyter notebook &'

# muestra ultimos archivos en los subdirectorios FreeMind*
alias F='ls -Rrt ~/Desktop/FreeMind* | tail -n12'

# ultimos 10 archivos del directorio actual ordenados
alias t='ls -trls'

# ipython con librerias
alias ipy='ipython -i ~/bin/ipython_comandos.py'

# ultimos 10 archivos modificados de todos los directorios de vinwiki
alias v="cd ~/vimwiki ; (find . -type f -printf '%T@ %p\n' | sort -k1,1nr | head -10 | sort -k1,1n) ; cd ~/"

# ultimos 20 archivos de freemind ordenados
alias ff='ls -ltr ~/Desktop/Free*/* | tail -n20'
