FROM ruby:2.7.2-slim

ARG KUBECTL_VERSION="1.17.7"

RUN apt-get update -qq && apt-get install -y curl apt-transport-https apt-utils wget jq

RUN apt-get update && apt-get install -y make bash netcat cmake pkg-config python3-pip

RUN pip3 install awscli
RUN curl -L -o /usr/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.7/2020-07-08/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.7/2020-07-08/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator

RUN gem install krane

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]:
