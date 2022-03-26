package dao;
import java.util.Map;
import java.util.List;

import entity.Board;


public interface BoardDao {
	public Map findBoard();
    public Board findBoard(int boardId);
}
