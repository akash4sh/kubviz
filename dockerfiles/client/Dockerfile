# Build the manager binary
FROM cgr.dev/chainguard/go:latest AS builder

WORKDIR /workspace
# Copy the Go Modules manifests
COPY ./ ./
RUN go mod download

# Build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o k8smetrics_client client/main.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM scratch
WORKDIR /
COPY --from=builder /workspace/k8smetrics_client .
USER 65532:65532

ENTRYPOINT ["/k8smetrics_client"]
