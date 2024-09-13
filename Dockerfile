# Usa a imagem base mais recente do Ubuntu
FROM ubuntu:latest

# Define o mantenedor da imagem
LABEL maintainer="Your Name <your.email@example.com>"

# Atualiza os pacotes do sistema e instala as ferramentas necessárias
RUN apt-get update && \
    apt-get install -y wget unzip curl openssh-client iputils-ping git

# Define a versão do Terraform a ser instalada
ENV TERRAFORM_VERSION=1.6.6

# Baixa e instala o Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Cria um diretório para os arquivos de Infraestrutura como Código (IaC)
RUN mkdir /iac
# Define /iac como um volume, permitindo a montagem de um diretório do host
VOLUME /iac

# Baixa e instala o AWS CLI
RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Configura o Git para tratar certos diretórios como seguros
# Isso é útil quando se trabalha com módulos Terraform
RUN git config --global --add safe.directory /iac/.terraform/modules/container-security-group && \
    git config --global --add safe.directory /iac/.terraform/modules/alb-security-group && \
    git config --global --add safe.directory /iac/.terraform/modules/vpc

# Define o comando padrão a ser executado quando o container for iniciado
CMD ["/bin/bash"]