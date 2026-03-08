variable "project" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list
    # Databases 
   default = ["mongodb" , "redis" , "mysql" , "rabbitmq" ,
    # backend components
    "catalogue" , "cart" , "user" , "shipping" , "payment" ,
    # backend ALB
    "backend_alb" ,
    # frontend and frontend_alb
    "frontend" , "frontend_alb" , 
    # bastion to connect to these     
    "bastion"]
  
}