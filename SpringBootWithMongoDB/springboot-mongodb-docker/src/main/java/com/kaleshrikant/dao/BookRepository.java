package com.kaleshrikant.dao;

import com.kaleshrikant.model.Book;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Shrikant Kale
 * @Date 8/8/25
 */

@Repository
public interface BookRepository extends MongoRepository<Book,Integer> {
}
