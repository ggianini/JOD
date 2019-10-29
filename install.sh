#!/usr/bin/env sh
set -e

# Instalação do utilitários necessários para o provisionamento
yum -y install unzip java-1.7.0-openjdk wget unzip --nogpgcheck

# Instalação do LibreOffice
cd /tmp
wget https://tdf.c3sl.ufpr.br/libreoffice/stable/6.3.0/rpm/x86_64/LibreOffice_6.3.0_Linux_x86-64_rpm.tar.gz
tar xfvz LibreOffice* -C /opt
cd /opt/LibreOffice*/RPMS/
yum -y localinstall *.rpm
mv /usr/bin/libreoffice* /usr/bin/soffice

# Configuração do pacote de línguas pt_BR
localedef pt_BR -i pt_BR -f ISO-8859-1

# Instalação da api de serviços de conversão de documentos
unzip /tmp/jodconverter-tomcat-2.2.2.zip -d /opt

# Remover arquivos temporários
rm -rf /tmp/*
yum clean all

exit 0
