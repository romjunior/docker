ui = true

disable_mlock = true

storage "consul" {
    address = "192.168.1.109:8500"
    path = "/home/vault/data"
}

listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}