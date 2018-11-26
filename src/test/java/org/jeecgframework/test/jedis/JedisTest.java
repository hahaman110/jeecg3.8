package org.jeecgframework.test.jedis;

import org.junit.Test;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisTest {
	
	@Test
	public void test1(){
		Jedis jedis = new Jedis("127.0.0.1",6379);
		jedis.set("name", "zyd");
		jedis.set("age", "18");
		System.out.println(jedis.get("name"));
		jedis.close();
	}
	
	@Test
	public void test2(){
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxTotal(100);
		config.setMaxIdle(10);
		
		JedisPool jedisPool = new JedisPool(config, "127.0.0.1");
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.set("name", "zyd2");
			jedis.set("age", "18");
			System.out.println(jedis.get("name"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(jedis!=null){
				jedis.close();
			}
			if(jedisPool!=null){
				jedisPool.close();
			}
		}
		
	}
	
}
