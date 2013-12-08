# Name of the role should match the name of the file
name "vagrant-test-box"

override_attributes(
    "domain" => "exampletc2.com",
    "mysql" => {
        "server_root_password" => 'iloverandompasswordsbutthiswilldo',
        "server_repl_password" => 'iloverandompasswordsbutthiswilldo',
        "server_debian_password" => 'iloverandompasswordsbutthiswilldo'
    },
    "postfix" => {
      "mail_type" => "master",
      "main" => {
        "mynetworks" => [ "127.0.0.0/8" ],
        "inet-interfaces" => "loopback-only",
        "mydomain" => "exampletc.com",
        "myorigin" => "exampletc.com"
       }
    }
)

# Run list function we mentioned earlier
run_list(
    "recipe[build-essential]",
    "recipe[xml]",
    "recipe[apt]",
    "recipe[openssl]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[mysql::client]",
    "recipe[mysql::server]",
    "recipe[php]",
    "recipe[php::module_mysql]",
    "recipe[postfix]"
)
