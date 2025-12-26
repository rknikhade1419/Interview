output "subnet_data"{
    value = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]
}
output "rds_address"{
   value = aws_db_instance.db_instance.address 
}