package com.metaverse.memo.service;

import com.metaverse.memo.domain.Memo;
import com.metaverse.memo.dto.MemoRequestDto;
import com.metaverse.memo.dto.MemoResponseDto;
import com.metaverse.memo.repository.MemoRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
        List<MemoResponseDto> responseList = memoRepository.findAll().stream().map(MemoResponseDto::new).toList();
        return responseList;
    }

    @Transactional
    public Long updateMemo(Long id, MemoRequestDto memoRequestDto) {
        // 해당 id의 메모가 데이터베이스에 존재하는지 확인
        Memo memo = findMemo(id);
        // 메모 내용 수정
        memo.update(memoRequestDto);
        return id;
    }
    public Long deleteMemo(Long id) {
        // 해당 id의 메모가 데이터베이스에 존재하는지 확인
        Memo memo = findMemo(id);
        // 메모 삭제
        memoRepository.delete(memo);
        return id;

    }

    private Memo findMemo(Long id){
        return memoRepository.findById(id).orElseThrow(()->
                new IllegalArgumentException("해당 메모는 존재하지 않습니다")
        );
    }
}
