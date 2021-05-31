locals {
    region_map = {
        "1" = "us-east-1",
        "2" = "us-west-1",
        "3" = "eu-north-1",
        "4" = "eu-south-1"
    }
    us_states = lookup(var.state_map,"Unitedstates")
    chicago = element(local.us_states, 3)
    indexes = [1,2,3,4]
    vpc_cidrs = [for i in local.indexes: cidrsubnet(var.base_cidr,8,i)]
    subnet_cidrs = [for vpc_cidr in local.vpc_cidrs: [for j in local.indexes: cidrsubnet(vpc_cidr, 8, j)]]
 
    vpc_map = { for index in local.indexes : lookup(local.region_map, index) => cidrsubnet(var.base_cidr, 8, index) }
    subnet_map = { for region,vpc_cidr in local.vpc_map : region => [ for index in local.indexes : cidrsubnet(vpc_cidr, 8, index ) ] }
    instances = [ for region in var.regions : [ for az in lookup(var.az_map, region): { "region" = region, "az" = az, "ami" = lookup(var.ami_map, region), "vpc_cidr" = lookup(local.vpc_map, region), "subnets_cidr" = lookup(local.subnet_map, region)} ]]

    #####################################################################################

    state_city_map = flatten ([ for state, cities in var.state_cities : [ for city in cities : { "state" = state, "city" = city } ] ])
    state_city_zipcode_map = flatten ([ for state, cities in var.state_cities : [ for city in cities : { "state" = state, "city" = city, "zipcode" = lookup(var.zip_codes, city ) }  ] ] )
    state_zipcodes_map = flatten([for state,cities in var.state_cities : { "state" = state, "zipcodes" = [ for city in cities : lookup(var.zip_codes, city)]}])
    services_map ={for service in var.services : lookup(service,"name") => { "team" = lookup(service, "team"), "tags" = {"service" = lookup(service,"name"), "environment" = lookup(service, "env"), "type" = lookup(service, "type")}}}

}
