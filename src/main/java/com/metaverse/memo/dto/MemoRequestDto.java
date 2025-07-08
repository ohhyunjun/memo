package com.metaverse.memo.dto;

import com.metaverse.memo.domain.Memo;
import lombok.Getter;

@Getter
public class MemoRequestDto {
    private String username;
    private String contents;
}
