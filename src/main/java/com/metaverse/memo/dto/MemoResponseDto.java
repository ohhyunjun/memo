package com.metaverse.memo.dto;

import com.metaverse.memo.domain.Memo;
import lombok.Getter;

@Getter
public class MemoResponseDto {
    private Long id;
    private String usernaem;
    private String contents;

    public MemoResponseDto(Memo memo) {
        this.id= memo.getId();
        this.usernaem = memo.getUsername();
        this.contents = memo.getContents();
    }

}
