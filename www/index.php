<?php

    $memcache = new memcached;
 
    $memcache -> addServer('127.0.0.1','11211');

    $memcache -> set ('key','Connect Memcached Server sussucfull');

    $get = $memcache -> get('key');

    echo $get;

