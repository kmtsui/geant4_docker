FROM rootproject/root:6.22.08-centos7

RUN echo "Hello from inside the container" && \
    echo "Base image is from docker://rootproject/root:6.22.08-centos7" && \
    echo "Install common software" && \
    yum -y install wget git make cmake3 gcc-c++ gcc binutils libX11-devel libXpm-devel libXft-devel libXext-devel python openssl-devel 
    
RUN echo "Install GEANT4" && \
    wget https://github.com/Geant4/geant4/archive/refs/tags/v10.3.3.tar.gz && tar xvf v10.3.3.tar.gz && \
    cd geant4-10.3.3 && mkdir build && cd build && \
    cmake3 .. -DCMAKE_INSTALL_PREFIX=/opt/geant4 -DGEANT4_INSTALL_DATA=ON && \
    make && make install && \
    cd ../.. && rm -rf geant4-10.3.3 v10.3.3.tar.gz

COPY ./geant4.entrypoint.sh /opt/geant4/
RUN chmod +x /opt/geant4/geant4.entrypoint.sh

ENTRYPOINT [ "/opt/geant4/geant4.entrypoint.sh" ]