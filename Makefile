# ==========================================
# Project Configuration
# ==========================================

APP_NAME       := app
CMD_PATH       := ./cmd/api
BUILD_DIR      := bin
GO             := go

VERSION        := $(shell git describe --tags --always --dirty)
COMMIT         := $(shell git rev-parse --short HEAD)
BUILD_TIME     := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

LDFLAGS := -ldflags "\
	-X 'main.version=$(VERSION)' \
	-X 'main.commit=$(COMMIT)' \
	-X 'main.buildTime=$(BUILD_TIME)'"

.DEFAULT_GOAL := help

.PHONY: help fmt vet lint test race cover build run clean tidy deps

# ==========================================
# Help
# ==========================================

help:
	@echo "Available commands:"
	@echo "  make fmt       - Format code"
	@echo "  make vet       - Run go vet"
	@echo "  make lint      - Run static analysis"
	@echo "  make test      - Run tests"
	@echo "  make race      - Run tests with race detector"
	@echo "  make cover     - Generate coverage report"
	@echo "  make build     - Build binary"
	@echo "  make run       - Run application"
	@echo "  make clean     - Remove build artifacts"
	@echo "  make tidy      - Tidy modules"
	@echo "  make deps      - Download dependencies"

# ==========================================
# Code Quality
# ==========================================

fmt:
	$(GO) fmt ./...

vet:
	$(GO) vet ./...

lint:
	golangci-lint run

# ==========================================
# Testing
# ==========================================

test:
	$(GO) test ./...

race:
	$(GO) test -race ./...

cover:
	$(GO) test -coverprofile=coverage.out ./...
	$(GO) tool cover -html=coverage.out

# ==========================================
# Build
# ==========================================

build: vet
	@mkdir -p $(BUILD_DIR)
	$(GO) build $(LDFLAGS) -o $(BUILD_DIR)/$(APP_NAME) $(CMD_PATH)

run:
	$(GO) run $(CMD_PATH)

clean:
	rm -rf $(BUILD_DIR) coverage.out

tidy:
	$(GO) mod tidy

deps:
	$(GO) mod download
