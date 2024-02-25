package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	// Generate a random number between 1 and 100
	rand.Seed(time.Now().UnixNano())
	secretNumber := rand.Intn(100) + 1

	// Initialize variables
	var guess int
	var attempts int

	// Welcome message
	fmt.Println("Welcome to the guessing game!")

	// Main game loop
	for {
		attempts++

		// Prompt user for guess
		fmt.Println("Enter your guess (1-100):")
		fmt.Scanf("%d", &guess)

		// Check guess
		if guess == secretNumber {
			fmt.Printf("Congratulations! You guessed the number in %d attempts.\n", attempts)
			break
		} else if guess < secretNumber {
			fmt.Println("Your guess is too low. Try again.")
		} else {
			fmt.Println("Your guess is too high. Try again.")
		}
	}
}
