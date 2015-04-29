package org.adastraeducation.liquiz;
import org.adastraeducation.liquiz.database.*;

public class Score {
//	private int quesID;
//	private String res;
//	
//	public Score(int quesID, String res) {
//		this.quesID = quesID;
//		this.res = res;
//	}
	
//	public int
	
	public static double correctQues(int quesID, String[] res) {
		Question ques = Database.getQues(quesID);
		return ques.grade(res);
		
	}
	
	public static int getTotalPoints(int quizID) {
		return Database.getQuiz(quizID).getTotalPoints();
	}
	
	public static boolean needsGrading(int quizID) {
		return Database.getQuiz(quizID).needsGrading();
	}
	
	public static void saveStudentResponse(int userID, int quesID, String[] res, boolean correct, double score, int attemptNum) {
		// TODO: Database ArrayList and mysql database storage using methods from Create
	}
	
	public static void saveStudentQuizScore(int userID, int quizID, double score, int attemptNum) {
		// TODO: Database ArrayList and mysql database storage using methods from Create
	}
}
