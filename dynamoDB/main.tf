resource "aws_dynamodb_table" "dynamodbtable" {
  name           = "VISIT_COUNTER"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"
  attribute {
    name = "id"
    type = "N"
  }
  attribute {
    name = "TopScore"
    type = "N"
  }

  global_secondary_index {
    name            = "idIndex"
    hash_key        = "id"
    range_key       = "TopScore"
    write_capacity  = 1
    read_capacity   = 1
    projection_type = "KEYS_ONLY"
  }

}

resource "aws_dynamodb_table_item" "tableitem" {
  table_name = aws_dynamodb_table.dynamodbtable.name
  hash_key   = aws_dynamodb_table.dynamodbtable.hash_key

  item = <<ITEM
{
  "id": {"N": "0"},
  "TopScore": {"N": "0"}
}
ITEM
}