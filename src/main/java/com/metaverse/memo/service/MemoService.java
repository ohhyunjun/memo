package com.metaverse.memo.service;

import com.metaverse.memo.domain.Memo;
import com.metaverse.memo.dto.MemoRequestDto;
import com.metaverse.memo.dto.MemoResponseDto;
import com.metaverse.memo.repository.MemoRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class MemoService {
    private final JdbcTemplate jdbcTemplate;
    public MemoService(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public MemoResponseDto createMemo(MemoRequestDto memoRequestDto){
        // RequestDto -> Entity 변환
        Memo memo = new Memo(memoRequestDto);

        MemoRepository memoRepository = new MemoRepository(jdbcTemplate);
        Memo savedMemo = memoRepository.save(memo);
        // Entity -> ResponseDto 변환
        MemoResponseDto memoResponseDto = new MemoResponseDto(memo);
        return memoResponseDto;
    }


    public List<MemoResponseDto> getMemos() {
        MemoRepository memoRepository = new MemoRepository(jdbcTemplate);
        List<MemoResponseDto> responseList = memoRepository.findAll();
        return responseList;
    }
    public Long updateMemo(Long id, MemoRequestDto memoRequestDto) {
        MemoRepository memoRepository = new MemoRepository(jdbcTemplate);
        // 해당 id의 메모가 데이터베이스에 존재하는지 확인
        Memo memo = memoRepository.findById(id);

        // 메모 내용 수정
        if(memo != null){
           Long updateId = memoRepository.update(id, memoRequestDto);
           return updateId;
        }else{
            throw new IllegalArgumentException("해당 ID의 메모는 존재하지 않습니다");
        }
    }
    public Long deleteMemo(Long id) {
        MemoRepository memoRepository = new MemoRepository(jdbcTemplate);
        // 해당 id의 메모가 데이터베이스에 존재하는지 확인
        Memo memo = memoRepository.findById(id);

        // 메모 삭제
        if(memo != null){
            Long deletedId = memoRepository.delete(id);
            return deletedId;
        }else{
            throw new IllegalArgumentException("해당 ID의 메모는 존재하지 않습니다.");
        }
    }
}
