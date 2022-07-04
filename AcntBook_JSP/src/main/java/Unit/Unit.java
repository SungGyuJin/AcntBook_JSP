package Unit;

import java.util.Calendar;

public class Unit {
	public void dateView() {
		Calendar cal =  Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int today = cal.get(Calendar.DATE);
		
		System.out.print(year + "년 ");
		System.out.print(month + 1 + "월 ");
		System.out.print(today + "일");
	}
	
}
