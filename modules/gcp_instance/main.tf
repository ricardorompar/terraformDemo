resource "google_compute_firewall" "rules" {
    name        = "my-firewall-rule"
    network     = "default"
    description = "Creates firewall rule targeting tagged instances"

    allow {
        protocol  = "tcp"
        ports     = ["80", "8080", "1000-2000"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["app-server"]
}

resource "google_compute_instance" "app_server" {
    name         = var.instance_name
    machine_type = var.instance_type
    zone         = var.zone

    boot_disk {
        initialize_params {
            image = var.image
            labels = {
                my_label = "jammy"
            }
        }
    }

    network_interface {
        network = "default"

        access_config {
        // Ephemeral public IP
        }
    }

    tags = ["app-server", "http-server"]

    metadata = {
        startup_script = <<-EOL
            #!/bin/bash
            # Update the package repository
            apt-get update -y

            apt-get install -y nginx

            # Create a simple HTML page with the instance name:
            echo "<html>
                <head>
                    <title>Hello, World</title>
                </head>
                <body>
                    <h1>Hello from ${var.instance_name} in Google Cloud!!</h1>
                    <div>This is an example Compute Engine server in ${var.zone} deployed with Terraform.</div>
                    <div><b>ACME Corp.</b></div>
                </body>
            </html>" > /var/www/html/index.html

            # Start NGINX and enable it to start on boot
            systemctl start nginx
            systemctl enable nginx
        EOL
    }
}