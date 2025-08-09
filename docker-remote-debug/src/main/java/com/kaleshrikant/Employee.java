package com.kaleshrikant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author Shrikant Kale
 * @Date 8/9/25
 */

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class Employee {
	private int id;
	private String name;
	private String dept;
	private String email;
}
