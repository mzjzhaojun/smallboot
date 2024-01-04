package com.zhengqing.common.base.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * <p>
 * 公共基础配置参数
 * </p>
 *
 * @author zhengqingya
 * @description
 * @date 2019/8/19 9:07
 */
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class CommonProperty {

    /**
     * ip
     */
    private String ip;
    /**
     * 后端服务地址
     */
    private String serviceApi;

    /**
     * 文件存储类型
     * {@link com.zhengqing.common.file.enums.FileStorageTypeEnum}
     */
    private String fileStorageType;
    /**
     * 本地文件存储位置
     */
    private String localFileDir;

    /**
     * MySQL参数
     */
    private Mysql mysql;

    @Data
    @SuperBuilder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Mysql {
        private MysqlConn master;
        private MysqlConn dbTest;
    }

    @Data
    @SuperBuilder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class MysqlConn {
        private String ip;
        private String port;
        private String dbName;
        private String username;
        private String password;
    }

}
