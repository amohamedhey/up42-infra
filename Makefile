# Version information
VERSION ?= $(shell git describe --tags --abbrev=0 2>/dev/null || echo "v0.1.0")
GIT_COMMIT ?= $(shell git rev-parse HEAD 2>/dev/null || echo "unknown")

# Detect OS and package manager
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    # macOS
    PKG_MANAGER := brew
    PKG_INSTALL := brew install
    PKG_INSTALL_CASK := brew install --cask
    PKG_CHECK := brew list
else ifeq ($(shell command -v apt-get 2>/dev/null),apt-get)
    # Debian/Ubuntu
    PKG_MANAGER := apt-get
    PKG_INSTALL := sudo apt-get install -y
    PKG_CHECK := dpkg -l
else ifeq ($(shell command -v yum 2>/dev/null),yum)
    # RHEL/CentOS/Fedora
    PKG_MANAGER := yum
    PKG_INSTALL := sudo yum install -y
    PKG_CHECK := rpm -q
else
    $(error Unsupported operating system or package manager not found)
endif

.PHONY: deploy-solution1 deploy-solution2 create-k3d-solution1 deploy-tf-solution1 terraform-validate terraform-plan terraform-apply terraform-destroy check-deps install-deps check-docker check-k3d install-docker install-k3d check-pkg-manager healthcheck clean


# Check all dependencies
check-deps: check-pkg-manager check-docker check-k3d

# Install all dependencies
install-deps: check-pkg-manager install-docker install-k3d

# Check if package manager is installed
check-pkg-manager:
ifeq ($(UNAME_S),Darwin)
	@if ! command -v brew &> /dev/null; then \
		echo "Homebrew is not installed. Installing..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi
else ifeq ($(PKG_MANAGER),apt-get)
	@if ! command -v apt-get &> /dev/null; then \
		echo "apt-get is not available. Please install it first."; \
		exit 1; \
	fi
	@sudo apt-get update
else ifeq ($(PKG_MANAGER),yum)
	@if ! command -v yum &> /dev/null; then \
		echo "yum is not available. Please install it first."; \
		exit 1; \
	fi
endif

# Check if Docker is installed
check-docker:
	@if ! command -v docker &> /dev/null; then \
		echo "Docker is not installed."; \
		echo "Please install Docker from: https://docs.docker.com/get-started/get-docker/"; \
		exit 1; \
	else \
		echo "Docker is already installed."; \
	fi

# Check if k3d is installed
check-k3d:
	@if ! command -v k3d &> /dev/null; then \
		echo "k3d is not installed. Installing..."; \
		$(MAKE) install-k3d; \
	else \
		echo "k3d is already installed."; \
	fi

# Install Docker based on OS
install-docker:
ifeq ($(UNAME_S),Darwin)
	@echo "Installing Docker Desktop for macOS..."
	@$(PKG_INSTALL_CASK) docker
else
	@echo "Installing Docker for Linux..."
	@if [ "$(PKG_MANAGER)" = "apt-get" ]; then \
		sudo apt-get update; \
		sudo apt-get install -y ca-certificates curl gnupg; \
		sudo install -m 0755 -d /etc/apt/keyrings; \
		curl -fsSL https://download.docker.com/linux/$$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg; \
		sudo chmod a+r /etc/apt/keyrings/docker.gpg; \
		echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$$(lsb_release -is | tr '[:upper:]' '[:lower:]') $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; \
		sudo apt-get update; \
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; \
	elif [ "$(PKG_MANAGER)" = "yum" ]; then \
		sudo yum install -y yum-utils; \
		sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo; \
		sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; \
	fi
	@sudo systemctl enable docker
	@sudo systemctl start docker
	@sudo usermod -aG docker $$USER
	@echo "Docker installed. Please log out and log back in for group changes to take effect."
endif

# Install k3d based on OS
install-k3d:
ifeq ($(UNAME_S),Darwin)
	@echo "Installing k3d using Homebrew..."
	@$(PKG_INSTALL) k3d
else
	@echo "Installing k3d for Linux..."
	@curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
endif

deploy-solution2: create-k3d-solution2 healthcheck

create-k3d-solution2:
	k3d cluster create --config bootstrap/k3d-bootstrap-cluster.yaml

create-k3d-solution1:
	k3d cluster create --config bootstrap2/k3d-bootstrap-cluster.yaml

deploy-solution1: create-k3d-solution1 deploy-tf-solution1 healthcheck

deploy-tf-solution1: terraform-validate terraform-plan terraform-apply

terraform-validate:
	cd terraform/up42/dev && terraform init && terraform fmt && terraform validate

terraform-plan:
	cd terraform/up42/dev && terraform plan

terraform-apply:
	cd terraform/up42/dev &&terraform apply -auto-approve

terraform-destroy:
	cd terraform/up42/dev && terraform init && terraform destroy -auto-approve

clean:
	k3d cluster delete up42-dev
# Check for loop on URL http://s3www.up42.abdalazizmoh.com/ using curl and check the response till it's 200
healthcheck:
	@echo "Checking health of http://s3www.up42.abdalazizmoh.com/ ..."
	@until curl -s -o /dev/null -w "%{http_code}" http://s3www.up42.abdalazizmoh.com/ | grep -q "200"; do \
		echo "Waiting for service to be ready..."; \
		sleep 5; \
	done; \
	echo "✅ Service is up!"
