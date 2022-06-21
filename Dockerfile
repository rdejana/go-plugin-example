FROM golang:1.17

COPY . /app
WORKDIR /app
# RUN ls -li
RUN go mod tidy
RUN go build -buildmode=plugin -o eng/eng.so eng/greeter.go
RUN go build -buildmode=plugin -o chi/chi.so chi/greeter.go
RUN go build -o greetings .
RUN echo "All done. You may now run './greetings english' or './greetings chinese'"
