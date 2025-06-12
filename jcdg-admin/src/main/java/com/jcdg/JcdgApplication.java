package com.jcdg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author jcdg
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class JcdgApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(JcdgApplication.class, args);
        System.out.println("系统启动成功 \n");
    }
}
