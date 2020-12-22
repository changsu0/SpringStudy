package com.cs.first.sample.service;

import java.util.List;
import java.util.Map;

public interface SampleService {

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception;

}
