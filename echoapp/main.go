package main

import (
	"fmt"

	"github.com/gofiber/fiber/v2"
)

func main()  {
	app := fiber.New()

	app.Get("/echo", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"headers": fmt.Sprintf("%s",c.Request().Header.RawHeaders()),
			"body": fmt.Sprintf("%s",c.Request().Body()),
		})
	})

	app.Listen(":3000")
}
