variable "region"{
       type = string
       default = "ap-northeast-1"
}

variable "vpc_cidr"{
       type = string
       default = "10.0.0.0/16"
}

variable "vpc_subnet_cidr"{
       type = list
       // same 
       default = ["10.0.1.0/24","10.0.2.0/24","10.0.4.0/24"]
}



/// this for specific region 
//variable "azs"{
//       type = list
//       //here 4 availibiliyt zone in tokyo so same subnet require
//       default = ["ap-northeast-1a","ap-northeast-1c","ap-northeast-1d"]
//}


//this use for any regions
data "aws_availability_zones" "azs" {
  state = "available"
}
 


