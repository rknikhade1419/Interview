// DB Subnet group creation
resource "aws_db_subnet_group" "db_sub_group" {
    name = "main"
    subnet_ids = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]

    tags = {
        Name = "My db subnet group"
    }
}