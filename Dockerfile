FROM mikeifomin/midas_wallet_base:v1

WORKDIR /usr/local/bin

COPY ./bulwarkd .
COPY ./bulwark-cli .

RUN chmod +x ./* && \
    ln bulwarkd walletd && \
    ln bulwark-cli wallet-cli

VOLUME ["/root/.bulwark"]
EXPOSE 52543

RUN walletd --help || exit $(($? == 127))
