# Build the manager binary
FROM docker.io/golang:1.20 as builder

WORKDIR /workspace
# Copy the Go Modules manifests
COPY ./ ./
RUN go mod download

# Build
RUN go build -a -o k8smetrics_agent agent/*.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /workspace/k8smetrics_agent .
USER 65532:65532

ENTRYPOINT ["/k8smetrics_agent"]
