package com.kramer.util.book;

import java.util.Date;

import com.kramer.dao.ReadRecordDao;
import com.kramer.entity.ReadRecord;
import com.kramer.util.DBUtil;

public class Record {
	public static void record(ReadRecord readRecord) throws Exception {
		ReadRecordDao dao = new ReadRecordDao();
		ReadRecord newReadRecord = dao.selectByUserAndChapter(readRecord);
		if (newReadRecord == null) {	//	没有读过该书的记录
			dao.insert(readRecord);
		} else {						//	读过该书
			newReadRecord.setChapter(readRecord.getChapter());
			newReadRecord.setTime(DBUtil.toSqlDate(new Date()));
			dao.update(newReadRecord);
		}
	}
}
