### Bleeding Edge Hipster Stack
## React / Redux / Goland / MongoDB Boilerplate With Docker Compose

Inspired by https://github.com/realpython/orchestrating-docker and adapted from Python to Golang.  Stripped down until there's not really much resemblance.

The frontend ([react-boilerplate](https://github.com/react-boilerplate/react-boilerplate)) is extremely well-documented. Best of luck on the rest.

## Summary
The frontend and backend API are setup to be independent services running on separate Docker containers. Docker Compose ties them together on build.
* **Frontend**: Pulled directly from [react-boilerplate](https://github.com/react-boilerplate/react-boilerplate)
  * **Docker**: Built on the [joshix/caddy](https://hub.docker.com/r/joshix/caddy/) image
  * **Web Server**: Runs on the [Caddy](https://caddyserver.com/) web server built in Go
* **Backend**: Golang web server
  * **Testing**: Runs on [Ginkgo](https://github.com/onsi/ginkgo) and [Gomega](https://github.com/onsi/gomega)
  * **Web Framework**: Runs on [Gin](https://github.com/gin-gonic/gin)
  * **Dependency Management**: Runs on [Godep](https://github.com/tools/godep)
  * **Docker**:  Built on the [golang alpine](https://hub.docker.com/_/golang/) image