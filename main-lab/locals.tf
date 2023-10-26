# Déclaration de variables locales
locals {
  elb_name = "nuumfactory-${var.environment}-lb-${var.digit}"
  ec2_name = "nuumfactory-${var.environment}-ec2-${var.digit}"
  db       = "nuumfactory-${var.environment}-db-${var.digit}"
  elb_tg   = "nuumfactory-${var.environment}-lb-tg-${var.digit}"
}

