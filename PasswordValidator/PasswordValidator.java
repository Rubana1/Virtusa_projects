import java.util.Scanner;

public class PasswordValidator {

       public static boolean isValidPassword(String password) {
        boolean hasUpperCase = false;
        boolean hasDigit = false;

        // Length check
        if (password.length() < 8) {
            System.out.println("Too short (minimum 8 characters required)");
            return false;
        }

        // Loop through each character
        for (int i = 0; i < password.length(); i++) {
            char ch = password.charAt(i);

            if (Character.isUpperCase(ch)) {
                hasUpperCase = true;
            }

            if (Character.isDigit(ch)) {
                hasDigit = true;
            }
        }

        // Feedback
        if (!hasUpperCase) {
            System.out.println("Missing an uppercase letter");
        }

        if (!hasDigit) {
            System.out.println("Missing a digit");
        }

        // Final validation
        return hasUpperCase && hasDigit;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String password;

        // Retry
        while (true) {
            System.out.print("Enter your password: ");
            password = sc.nextLine();

            if (isValidPassword(password)) {
                System.out.println("Password is valid");
                break;
            } else {
                System.out.println("Please try again.\n");
            }
        }

        sc.close();
    }
}