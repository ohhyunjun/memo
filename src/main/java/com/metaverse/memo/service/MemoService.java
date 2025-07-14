package com.metaverse.memo.service;

import com.metaverse.memo.domain.Memo;
import com.metaverse.memo.dto.MemoRequestDto;
import com.metaverse.memo.dto.MemoResponseDto;
import com.metaverse.memo.repository.MemoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemoService {
    // 멤버 변수 선언
    private final MemoRepository memoRepository;

    //생성자
    public MemoService(MemoRepository memoRepository) {
        this.memoRepository = memoRepository;
    }

    public MemoResponseDto createMemo(MemoRequestDto memoRequestDto){
        // RequestDto -> Entity 변환
        Memo memo = new Memo(memoRequestDto);

        Memo savedMemo = memoRepository.save(memo);
        // Entity -> ResponseDto 변환
        MemoResponseDto memoResponseDto = new MemoResponseDto(memo);
        return memoResponseDto;
    }


    public List<MemoResponseDto> getMemos() {
        List<MemoResponseDto> responseList = memoRepository.findAll();
        return responseList;
    }
    public Long updateMemo(Long id, MemoRequestDto memoRequestDto) {
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
