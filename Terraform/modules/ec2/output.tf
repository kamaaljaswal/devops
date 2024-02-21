output "public_ip" {
  # Treating this as array due to use of count for conditional creation
  value = aws_eip.main[0].address
}