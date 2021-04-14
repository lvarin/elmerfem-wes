FROM lvarin/elmerfem:20210413

RUN sudo apt install -y unzip zip

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

