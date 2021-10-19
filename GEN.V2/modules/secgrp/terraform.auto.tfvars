WEB_PORTS_PUBLIC_MAP_INGRESS = {
  "WEB_N" = {
    protocol    = "tcp",
    from_port   = 80,
    to_port     = 80,
    cidr_blocks = ["0.0.0.0/0"],
    description = "Public access to Website forward to HTTPS"
  },

  "WEB_H" = {
    protocol    = "tcp",
    from_port   = 443,
    to_port     = 443,
    cidr_blocks = ["0.0.0.0/0"],
    description = "Public access to Website Secured"
  },

  "SSH" = {
    protocol    = "tcp",
    from_port   = 22,
    to_port     = 22,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "SSH ACCESS"
  },

  "DB_ORA" = {
    protocol    = "tcp",
    from_port   = 8080,
    to_port     = 8081,
    cidr_blocks = ["10.15.176.35/32"],
    description = "DB Connectivity"
  },

  "REDIS_CACHE" = {
    protocol    = "tcp",
    from_port   = 23142,
    to_port     = 23143,
    cidr_blocks = ["10.15.176.100/32"],
    description = "Redis DB Connectivity"
  }
}

WEB_PORTS_PUBLIC_MAP_EGRESS = {
  "WEB_N" = {
    protocol    = "tcp",
    from_port   = 0,
    to_port     = 65535,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "All ports Outbound Access only to internal subnet to restrict cross scripting"
  },

  "WEB_H" = {
    protocol    = "udp",
    from_port   = 0,
    to_port     = 65535,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "All ports Outbound Access only to internal subnet to restrict cross scripting"
  }}