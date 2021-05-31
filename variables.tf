variable cluster-names {
    type = list(string)
    description = "list of cluster names"
    default = ["dev", "qa", "staging", "prod"]
}

variable my_age {
    type = number
    description = "describes my age"
    default = 25
}

variable name {
    type = string
    description = "displays my name"
    default = "aparna"
}

variable my_map {
    type = map
    description = "displays my map"
    default = {
        name  = "aparna"
        age = 25
        address = "23562 fremont blvd"   
    }
}
variable state_map {
    type = map
    description = "stores list of states in country"
    default = {
        Unitedstates = ["california", "newyork", "chicago", "atlanta"]
        India = ["andhrapradesh", "tamilnadu", "kerala","mumbai"]
        Unitedkingdom = ["france", "italy", "germany", "spain"]
    }
}

variable students {
    type = list(object({
        name = string
        address = string
        zipcode = string
        city = string
        state = string
        country = string
    }))
    description = "stores students list"
    default = [
        {
            name = "aparna"
            address = "2536 blvd"
            zipcode = "56895"
            city = "fremont"
            state = "ca"
            country = "unitedstates"

        },
        {
            name  = "prathu"
            address = "25369 blvd"
            zipcode = "78956"
            city = "milpitas"
            state = "ny"
            country = "unitedstates"
        },
        {
            name  = "swathi"
            address = "56329 blvd"
            zipcode = "58964"
            city = "sunnyvale"
            state = "nj"
            country = "unitedstates"
        }
    ]
}

variable state_cities {
    type = map
    description = "it saves all cities"
    default = {
        "andhrapradesh" = ["vijayawada", "guntur", "ongole", "kurnool"]
        "telangana" = ["hyderabad", "secunderabad", "nalgonda", "kodad"]
        "gujarat" = ["gandhinagar", "ahmedabad"]
    }

}

variable zip_codes {
    type = map
    description = "it saves all zipcodes"
    default = {
        "vijayawada" = "12345"
        "guntur" = "67891"
        "ongole" = "28795"
        "kurnool" = "45781"
        "hyderabad" = "24578"
        "secunderabad" = "37612"
        "nalgonda" = "89154"
        "kodad" = "33451"
        "gandhinagar" = "14587"
        "ahmedabad" = "78135"
    }
}


variable clusters_names {
  type = list
  default = ["dev","qa","stage","prod"]
}
variable time_charts {
  type = list(object({
      program_test_name = string
      chart_name = string
      row = number
      column = number
  }))
  default = [{
      "program_test_name" = "hello"
      "chart_name" = "chart1"
      "row" = 1
      "column" = 1

  }, 
  {
     "program_test_name" = "bye"
      "chart_name" = "chart2"
      "row" = 1
      "column" = 6

  }]
}

variable list_charts {
  type = list(object({
      program_test_name = string
      chart_name = string
      row = number
      column = number
  }))
  default = [{
      "program_test_name" = "how"
      "chart_name" = "chart3"
      "row" = 2
      "column" = 1

  }, 
  {
     "program_test_name" = "are"
      "chart_name" = "chart4"
      "row" = 2
      "column" = 6

  }]
}

variable regions {
    type = list
    description = "different regions"
    default = ["us-east-1", "us-west-1", "eu-north-1", "eu-south-1"]

}

variable ami_map {
    type = map
    description = "different ami's"
    default = {
        "us-east-1" = "abcd-i123",
        "us-west-1" = "def-i456",
        "eu-north-1" = "ghi-i789",
        "eu-south-1" = "jkl-i135"
    }
}

variable "az_map" {
    type = map
    description = "different az's"
    default = {
        "us-east-1" = ["us-east-1a", "us-east-1b"],
        "us-west-1" = ["us-west-1a", "us-west-1b"],
        "eu-north-1" = ["eu-north-1a", "eu-north-1b"]
        "eu-south-1" = ["eu-south-1a", "eu-south-1b"]
    }
}

variable "base_cidr" {
    default = "10.0.0.0/8"
}

variable "tags_keys" {
    type = list
    description = "different tag keys"
    default = ["service", "environment", "type"]
}

variable "environments" {

    type = list
    description = "different environments"
    default = ["dev", "qa", "stage", ]
}

variable "services" {
    type =list(object({
        name = string
        type  = string
        team = string
        env = string
    
    }))
      default = [{
          "name" = "yeti"
          "type" = "external"
          "team" = "dragon"
          "env" = "prod"

      },
      {
          "name" = "glue"
          "type" = "internal"
          "team" = "camel"
          "env" = "stage"
      },
      {
          "name" = "frontdoor"
          "type" = "external"
          "team" = "griffin"
          "env" = "prod" 
      },
      {
          "name" = "stix"
          "type" = "internal"
          "team" = "rhino"
          "env" = "dev"
      }]
}
