ARG VERSION

FROM josealo/minilatex:$VERSION

WORKDIR /var/local
COPY . /var/local
RUN pdflatex main.tex
RUN pdflatex main.tex

