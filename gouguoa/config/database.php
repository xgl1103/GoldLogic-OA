<?php
return [
    'default'         => 'mysql',
    'time_query_rule' => [],
    'auto_timestamp'  => true,
    'datetime_format' => 'Y-m-d H:i:s',
    'connections'     => [
        'mysql' => [
            'type'               =>  'mysql',
            'hostname'           =>  'mariadb',
            'database'           =>  'gouguoa',
            'username'           =>  'root',
            'password'           =>  'root123456',
            'hostport'           =>  '3306',
            'prefix'             =>  'oa_',
            'params'          => [],
            'charset'         => 'utf8mb4',
            'debug'           => false,
            'deploy'          => 0,
            'rw_separate'     => false,
            'master_num'      => 1,
            'slave_no'        => '',
            'fields_strict'   => true,
            'break_reconnect' => false,
            'trigger_sql'     => true,
            'fields_cache'    => false,
        ],
    ],
];