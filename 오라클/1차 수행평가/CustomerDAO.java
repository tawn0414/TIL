package FirstExam;

import jdbc.board.exam.BoardDTO;

public interface CustomerDAO {
	int insert(CustomerDTO customer);
	int update(String id, String addr);
	int delete(String addr);
}

