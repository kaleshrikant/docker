package com.kaleshrikant.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author Shrikant Kale
 * @Date 8/8/25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Document(collation = "books")
public class Book {
	@Id
	private int id;
	private String name;
	private String author;
}
