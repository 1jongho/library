package com.library.model.book;
import java.util.List;

public interface BookService {
    void insertBook(BookVO vo);
    BookVO selectBook(BookVO vo);
    void updateBook(BookVO vo);
    void deleteBook(BookVO vo);

    void createBookTable();

    BookVO getBookById(String bookCode);

    List<BookVO> getBookList();

    int selectTotalBook();
    BookVO selectSearchBook(BookVO vo);

}
