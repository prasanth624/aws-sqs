variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "delay_seconds" {
  description = "The time in seconds that messages are delayed before being visible"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "The maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "The number of seconds a message will be retained"
  type        = number
  default     = 345600 # 4 days
}

variable "receive_wait_time_seconds" {
  description = "The time in seconds for long polling"
  type        = number
  default     = 0
}

variable "queue_policy" {
  description = "The JSON-formatted policy for the SQS queue"
  type        = string
  default     = ""
}

variable "use_sqs_managed_sse_enabled" {
  description = "Enable AWS-managed encryption (true) or use a custom KMS key (false)"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS Key ARN for encryption (used only if use_aws_managed_encryption = false)"
  type        = string
  default     = "alias/aws/sqs"
}

variable "fifo_queue" {
  type    = bool
  default = "true"
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication (Only for FIFO queues)"
  type        = bool
  default     = false
}

variable "fifo_throughput_limit" {
  type    = string
  default = "perMessageGroupId"
}

variable "deduplication_scope" {
  type    = string
  default = "messageGroup"
}

variable "tags" {
  description = "Tags to apply to the SQS queue"
  type        = map(string)
  default     = {}
}

variable "enable_dlq" {
  type    = bool
  default = false
}

variable "dead_letter_queue_arn" {
  description = "ARN of the dead letter queue"
  type        = string
}

variable "max_receive_count" {
  type = number
}

