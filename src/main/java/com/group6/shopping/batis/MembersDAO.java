package com.group6.shopping.batis;

import java.util.HashMap;
import java.util.List;

import com.group6.shopping.members.vo.MembersVO;
import com.group6.shopping.security.CustomMemDetails;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MembersDAO {
    
    public List<MembersVO> getAllMembers() throws Exception;
    public String lookupId(String memId) throws Exception;
    public void insertMem(MembersVO membersVO) throws Exception;
    public CustomMemDetails getMemById(String memId) throws Exception;
    public int usePoint(MembersVO membersVO) throws Exception;
    public int addPoint(MembersVO membersVO) throws Exception;
    public void modifyMem(HashMap<String, String> param) throws Exception;
    public String pwCheck(String memId) throws Exception;
    public void modifyPw(HashMap<String, String> param) throws Exception;
    public void deleteMem(String memId) throws Exception;
<<<<<<< HEAD

    public void updateEnableMem(@Param("mem_enable")int memEnable, @Param("mem_id")String memId) throws Exception;
    public List<String> searchAdmin() throws Exception;
    public List<String> findId(String memEmail) throws Exception;
    public int findIdCheck(String memEmail) throws Exception;
    public int findPwCheck(HashMap<String, String> param) throws Exception;
    public int findPw(HashMap<String, String> param) throws Exception;
=======
    
    public List<String> findId(String memEmail) throws Exception;
    public int findIdCheck(String memEmail) throws Exception;
    public int findPwCheck(HashMap<String, String> param) throws Exception;
    public void findPw(HashMap<String, String> param) throws Exception;
    public void updateEnableMem(@Param("mem_enable")int memEnable, @Param("mem_id")String memId) throws Exception;
    public List<String> searchAdmin() throws Exception;
>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463
}