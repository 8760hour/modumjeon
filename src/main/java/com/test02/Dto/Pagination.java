package com.test02.Dto;

import lombok.Data;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class Pagination {
    private int pageSize = 15;       // 한 페이지당 게시글 수
    private int rangeSize = 10;      // 한 블럭당 페이지 수
    private int curPage = 1;         // 현재 페이지
    private int curRange = 1;        // 현재 블럭

    // 총 게시글 수, 페이지 수, 블럭수
    private int listCnt, pageCnt, rangeCnt ;

    // 시작페이지, 끝페이지
    private int startPage = 1;
    private int endPage = 1;

    // 시작 인덱스
    private int startIndex = 0;

    private int prevPage, nextPage;

    public Pagination(int listCnt, int curPage) {
        // 현재 페이지
        setCurPage(curPage);
        // 총 게시물 수
        setListCnt(listCnt);

        // 1. 총 페이지 수
        setPageCnt(listCnt);
        // 2. 총 블럭 수
        setRangeCnt(pageCnt);
        // 3. 블럭
        rangeSetting(curPage);

        setStartIndex(curPage);
    }

    public void setPageCnt(int listCnt) {
        this.pageCnt = (int) Math.ceil(listCnt * 1.0 / pageSize);
    }

    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt * 1.0 / rangeSize);
    }

    public void rangeSetting(int curPage) {

        setCurRange(curPage);

        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;

        if (endPage > pageCnt) {
            this.endPage = pageCnt;
        }

        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }

    public void setCurRange(int curPage) {

        this.curRange = (int) ((curPage - 1) / rangeSize) + 1;
    }

    public void setStartIndex(int curPage) {

        this.startIndex = (curPage - 1) * pageSize + 1;
    }

}

