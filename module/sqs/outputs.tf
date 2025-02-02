output "sqs_queue_id" {
  description = "The ID of the created SQS queue"
  value       = aws_sqs_queue.sqs.id
}

output "sqs_queue_arn" {
  description = "The ARN of the created SQS queue"
  value       = aws_sqs_queue.sqs.arn
}

output "sqs_queue_url" {
  description = "The URL of the created SQS queue"
  value       = aws_sqs_queue.sqs.url
}

