package main

import (
	"github.com/Komei1009/AutoDeploy/controller"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.LoadHTMLGlob("view/*")

	r.GET("/", controller.Index)

	r.Run()
}
