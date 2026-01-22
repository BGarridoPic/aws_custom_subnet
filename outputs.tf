output "subnet_id_generada" {
  description = "El ID de la subred que ha creado este módulo"
  value       = aws_subnet.main.id
}