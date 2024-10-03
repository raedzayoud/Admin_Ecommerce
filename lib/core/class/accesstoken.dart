import 'package:googleapis_auth/auth_io.dart';

class AccessTokenFirebase {
  static const String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    try {
      // Load your service account credentials from a secure source
      var client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
            // Retrieve the JSON credentials securely
            {
              "type": "service_account",
              "project_id": "ecommerce-31b11",
              "private_key_id": "f4a76867bd1326c6ec147c7f897c97c9a8d74cdd",
              "private_key":
                  "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDLC5kYlA3a8Yse\nifYx0qkjoyBp/tMOuV/Iu14l1Boyu6r7KDukqGAn3N4j+dILf3NqJ0nBmG92mqzZ\nGJiB5TFwL+6HX9JIT6MxK2QWjhNe40HKjlA2yMU9cU/e61A8yqFdYOQAqRe/ekUI\nCIOjr9x4KkbL4vZb1CVr1WlkHhpdUrsDgZaQHPh5MXU7GTmMPfwhWmNY4lE62fiP\n+0+e8AwCfip3vGkTJa/WLG4TcvuzWVswx/50ef+lvSp49wijWrhg5ZqF1XCEH0et\nvr+y6CbOf5v8Wjv+ZNsfd4P5KsarqFSeJCXHqiovuWYB9GPyIH9N6lbz7DXMYwyi\nbnYZsbEDAgMBAAECggEANTdCdlMjeH0zCZt+B5vfUaRI9A7iEStbo9gbuk1nWmGe\nU/o8+5BXt0rne8VXnETYontOlOtXV139rF6KZg0EUpN1cEyYZ/RbYKEvN8wf3pAw\nZ565/knLjCl9Ff9VhcFT3o3s5BFtVHV+zzawDcAjR+lIqdo/2Fx3PFZwK1nKbiev\nROlBKpTNQnRkAbdZILHEtoJxxTzkkvzTQ5QN6aSKd4uvOmya6tRnRXhkoEIb3Abq\nWSA+QjS4YHOBOL+ZELPpERwtU8cUwAaRFHH522S2m3hj9ZDcZz6CLPtbgLikHonh\nKQrHQ39KR3fw/X0TSbkjeyQjI0wvzGk7dPf2aRaI5QKBgQD4JhdeV2bRvFO1yGWH\nIa/iGh+QCuY69+Zrt3CFjGzDcTLEYu05D9q/VFF72MHGP3XAYsClu2BQI3DS4sFP\nIEXvBNc3MFxlMU725aS/uH2GRFavOcwvnWgHKsKmFc7FC0wTBHpE/02xeYuGcnTL\nWdgEcjEht3fDHKvUtYQvjJ75nQKBgQDReC+fgHe8QlhOAQfZBGWG1NRLyVnQaGoO\nZquSLdcUfcw31vmKNLW7sk5VCoTK+dP2+JYAs0XtV+17hjDPIDzYP5ut/x6z5QDP\n1rqlgykSTMFMPHcryaNQsh1UZ3thv2QEsDyarVyWLjxabGQQaWsXc4rK38bE7uD1\nlZnLm0UjHwKBgBgvBioAlJmuI+5caGCiDNUZPKg6F7P5gvBOgV3SkKr/djYjegEM\npYHuAr7yIfhjKOOl/CZqu3kz6wPya2p9t7MSorLTOL337z0qpkK1BS63rEcJd/fP\n/FpudWfgSjVz42cbEZt10imQseNZdj53NBFC27zwd3CBc9GYGxjTOI8VAoGBALnM\nZFmTZyFqq88M5PwfBTsSfvh2Mh9E7oW1lgvEc1mut7z0B0YKuQQzBX4zJVSxQs12\n8/7NBYKgEnsVrSebzbx2t00f1Qj2YMD6E3aKH50mzfIkVARYB2+lfZSHcY5jaIEs\nHaWJjm17t3bxW9Se3SnhB8Qpt7KovIu5VcCfCjU7AoGBAJh/BCIjGDNOwX0sJxCm\nr+woqqhFWRl/dhTtHzUVAM/BO0qsCGPRDNM13LOimwjozzwM7qk+GyzgX3wyKe6a\n7QYFqu5XhW1B5XaTPxhMxmOdr22puYYgX2sOwhCy0YodG4on+pVg0+2eX/N3sqrU\nW7E/sloT+qaTXNQvsKcArhOB\n-----END PRIVATE KEY-----\n",
              "client_email":
                  "firebase-adminsdk-fvm85@ecommerce-31b11.iam.gserviceaccount.com",
              "client_id": "116018263503214396601",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url":
                  "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url":
                  "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fvm85%40ecommerce-31b11.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }),
        [firebaseMessagingScope],
      );

      // Extract the access token from the credentials
      final accessToken = client.credentials.accessToken.data;

      // Return the access token
      return accessToken;
    } catch (e) {
      // Handle errors appropriately
      throw Exception('Failed to get access token: $e');
    }
  }
}
