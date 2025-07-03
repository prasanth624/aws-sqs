resource "aws_sqs_queue" "sqs" {
  name                        = var.queue_name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue ? var.content_based_deduplication : null
  deduplication_scope         = var.fifo_queue ? var.deduplication_scope : null
  fifo_throughput_limit       = var.fifo_queue ? var.fifo_throughput_limit : null
  delay_seconds               = var.delay_seconds
  max_message_size            = var.max_message_size
  message_retention_seconds   = var.message_retention_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  sqs_managed_sse_enabled     = var.use_sqs_managed_sse_enabled ? true : null
  kms_master_key_id           = var.use_sqs_managed_sse_enabled ? null : var.kms_key_id

  redrive_policy = var.enable_dlq ? jsonencode({
    deadLetterTargetArn = var.dead_letter_queue_arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  tags = var.tags
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  count     = length(var.queue_policy) > 0 ? 1 : 0
  queue_url = aws_sqs_queue.sqs.id
  policy    = var.queue_policy
}

