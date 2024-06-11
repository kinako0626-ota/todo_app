package utils

import (
	"context"
	"log"
	"os"

	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

const FIREBASE_ACCOUNT_KEY_PATH = "FIREBASE_ACCOUNT_KEY_PATH"

func SetupFirebaseApp () (*firebase.App, error) {
	opt := option.WithCredentialsFile(os.Getenv(FIREBASE_ACCOUNT_KEY_PATH))
	app, err := firebase.NewApp(context.Background(), nil, opt)
	if err != nil {
		return nil, err
	}
	log.Default().Println("Firebase app is successfully initialized")
	return app, nil
}