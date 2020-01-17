# ARG AGOLAWEB_IMAGE="devops2build/agola-web"
ARG AGOLAWEB_IMAGE="registry.cn-shenzhen.aliyuncs.com/sam-ns1/ct-agola-web"

FROM $AGOLAWEB_IMAGE as agola-web

#######
####### Build the backend
#######

# base build image
FROM golang:1.13-buster AS build_base

WORKDIR /agola

# use go modules
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn

# only copy go.mod and go.sum
COPY go.mod .
COPY go.sum .

RUN go mod download


# builds the agola binaries
FROM build_base AS server_builder
# use go modules
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn
# copy all the sources
COPY . .

# copy the agola-web dist
COPY --from=agola-web /agola-web/dist/ /agola-web/dist/

RUN make WEBBUNDLE=1 WEBDISTPATH=/agola-web/dist


#######
####### Build the final image
#######
FROM debian:buster AS agola

WORKDIR /

RUN echo "deb http://mirrors.163.com/debian/ buster main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list

# Install git needed by gitserver
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates tree wget procps net-tools \
    git \
    && rm -rf /var/lib/apt/lists/*

# copy to agola binaries
COPY --from=server_builder /agola/bin/agola /agola/bin/agola-toolbox-* /bin/

ENTRYPOINT ["/bin/agola"]


#######
####### Build the demo image
#######

FROM agola as agolademo

WORKDIR /

# copy the example config
COPY examples/agolademo/config.yml .

ENTRYPOINT ["/bin/agola"]
