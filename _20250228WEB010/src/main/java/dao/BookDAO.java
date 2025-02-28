package dao;

import java.sql.*;
import java.util.*;

import dto.Book;
import util.DBUtil;

public class BookDAO {

    // 도서 목록 조회
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Book book = new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("publisher"),
                    rs.getInt("year")
                );
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return books;
    }

    // 도서 추가
    public void addBook(Book book) {
        String sql = "INSERT INTO books (title, author, publisher, year) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {
            
            psmt.setString(1, book.getTitle());
            psmt.setString(2, book.getAuthor());
            psmt.setString(3, book.getPublisher());
            psmt.setInt(4, book.getYear());
            
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 도서 정보 조회
    public Book getBookById(int id) {
        Book book = null;
        String sql = "SELECT * FROM books WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {
            
            psmt.setInt(1, id);
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    book = new Book(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("publisher"),
                        rs.getInt("year")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return book;
    }

    // 도서 수정
    public void updateBook(Book book) {
        String sql = "UPDATE books SET title = ?, author = ?, publisher = ?, year = ? WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {
            
            psmt.setString(1, book.getTitle());
            psmt.setString(2, book.getAuthor());
            psmt.setString(3, book.getPublisher());
            psmt.setInt(4, book.getYear());
            psmt.setInt(5, book.getId());
            
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 도서 삭제
    public void deleteBook(int id) {
        String sql = "DELETE FROM books WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {
            
            psmt.setInt(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}