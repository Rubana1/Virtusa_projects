import java.util.*;

// Main Class
public class QuizSystem {

    // Question Class
    static class Question {
        String question;
        String[] options;
        int correctAnswer;

        public Question(String question, String[] options, int correctAnswer) {
            this.question = question;
            this.options = options;
            this.correctAnswer = correctAnswer;
        }

        public void display() {
            System.out.println("\n" + question);
            for (int i = 0; i < options.length; i++) {
                System.out.println((i + 1) + ". " + options[i]);
            }
        }
    }

    // Timer Class
    static class QuizTimer {
        static Timer timer;

        public static void startTimer(int seconds) {
            timer = new Timer();

            timer.schedule(new TimerTask() {
                int timeLeft = seconds;

                public void run() {
                    System.out.println("Time left: " + timeLeft + " seconds");
                    timeLeft--;

                    if (timeLeft < 0) {
                        System.out.println("Time's up!");
                        timer.cancel();
                        System.exit(0);
                    }
                }
            }, 0, 1000);
        }

        // Stop Timer Method
        public static void stopTimer() {
            if (timer != null) {
                timer.cancel();
            }
        }
    }

    // Quiz Logic
    static class QuizService {
        List<Question> questions = new ArrayList<>();
        int score = 0;

        public void addQuestion(Question q) {
            questions.add(q);
        }

        public void startQuiz() {
            Scanner sc = new Scanner(System.in);

            System.out.println("\n--- Quiz Started ---");

            for (Question q : questions) {
                q.display();

                System.out.print("Enter your answer (1-4): ");
                int answer = sc.nextInt();

                if (answer == q.correctAnswer) {
                    score++;
                }
            }

            showResult();
        }

        public void showResult() {
            System.out.println("\n--- Result ---");
            System.out.println("Score: " + score + "/" + questions.size());

            double percentage = (score * 100.0) / questions.size();
            System.out.println("Percentage: " + percentage + "%");

            if (percentage >= 80) {
                System.out.println("Performance: Excellent");
            } else if (percentage >= 50) {
                System.out.println("Performance: Good");
            } else {
                System.out.println("Performance: Needs Improvement");
            }
        }
    }

    // Main Method
    public static void main(String[] args) {

        QuizService quiz = new QuizService();

        // Start Timer (60 seconds)
        QuizTimer.startTimer(60);

        // Admin adds questions
        quiz.addQuestion(new Question(
                "What is Java?",
                new String[]{"Language", "Car", "Food", "Game"},
                1));

        quiz.addQuestion(new Question(
                "Which is not OOP concept?",
                new String[]{"Encapsulation", "Inheritance", "Compilation", "Polymorphism"},
                3));

        quiz.addQuestion(new Question(
                "Which database is used?",
                new String[]{"MySQL", "HTML", "CSS", "JS"},
                1));

      
        quiz.startQuiz();
        QuizTimer.stopTimer();
    }
}