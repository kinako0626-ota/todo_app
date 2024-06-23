package utils

import (
	"context"
	"log"

	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
)

func InitializeFirebaseAuthClient(app *firebase.App) (*auth.Client, error) {
    authClient, err := app.Auth(context.Background())
    if err != nil {
        log.Printf("failed to initialize Firebase Auth client: %v", err)
        return nil, err
    }
    return authClient, nil
	
}


func VerifyIDToken(authClient *auth.Client, idToken string) (*auth.Token, error) {
	token, err := authClient.VerifyIDToken(context.Background(), idToken)
	if err != nil {
		log.Printf("failed to verify ID token: %v", err)
		return nil, err
	}
	return token, nil
}
