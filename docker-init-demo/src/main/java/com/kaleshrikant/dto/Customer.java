package com.kaleshrikant.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Shrikant Kale
 * @Date 8/9/25
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
	private int id;
	private String name;
	private String email;
	private String gender;
}
