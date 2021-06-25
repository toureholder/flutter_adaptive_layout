#!/usr/bin/env bash
mkdir -p .pub-cache

cat <<EOF > ~/.pub-cache/credentials.json
{
  "accessToken":"$PUB_ACCESS_TOKEN",
  "refreshToken":"$PUB_REFRESH_TOKEN",
  "idToken":"$PUB_ID_TOKEN",
  "tokenEndpoint":"$PUB_TOKEN_ENDPOINT",
  "scopes":["https://www.googleapis.com/auth/userinfo.email", "openid"],
  "expiration":$PUB_EXPIRATION_TIMESTAMP
}
EOF

echo "Let's publish this!"
flutter pub publish --force