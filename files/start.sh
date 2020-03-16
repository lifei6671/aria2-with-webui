#!/bin/sh

if [ ! -f /conf/aria2.conf ]; then
  if [ -f /data/aria2.conf ];then
    cp /data/aria2.conf /conf/aria2.conf
  else
	  cp /conf-copy/aria2.conf /conf/aria2.conf
	fi
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
		echo "rpc-secure=true" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf/on-complete.sh
if [ ! -d /data/aria2 ];then
  mkdir /data/aria2
fi

if [ ! -f /data/aria2/session.dat ];then
  touch /data/aria2/session.dat
fi

if [ ! -f /data/aria2/aria2.log ];then
touch /data/aria2/aria2.log

fi
if [ ! -f /data/aria2/session.dat ];then
  touch /data/aria2/session.dat
fi

if [ ! -f /data/aria2/cookies ];then
  touch /data/aria2/cookies
fi

if [ ! -f /data/aria2/dht.dat ];then
  touch /data/aria2/dht.dat
fi

if [ ! -f /data/aria2/dht6.dat ];then
  touch /data/aria2/dht6.dat
fi

exec "$@"

