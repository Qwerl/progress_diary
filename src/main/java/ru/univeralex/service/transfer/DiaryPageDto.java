package ru.univeralex.service.transfer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import ru.univeralex.service.models.DiaryPage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author - Alexander Kostarev
 */
@Data
@AllArgsConstructor
@Builder
public class DiaryPageDto {
    private Long diaryPageId;
    private String date;
    private Float neck;
    private Float biceps;
    private Float chest;
    private Float waist;
    private Float hip;
    private Float calf;
    private Float weight;
    private String note;
    private String filename;

    private static DiaryPageDto from(DiaryPage diaryPage) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return DiaryPageDto.builder()
                .diaryPageId(diaryPage.getDiaryPageId())
                .date(dateFormat.format(diaryPage.getDate()))
                .neck(diaryPage.getNeck())
                .biceps(diaryPage.getBiceps())
                .chest(diaryPage.getChest())
                .waist(diaryPage.getWaist())
                .hip(diaryPage.getHip())
                .calf(diaryPage.getCalf())
                .weight(diaryPage.getWeight())
                .filename(diaryPage.getFilename())
                .build();
    }

    public static List<DiaryPageDto> fromList(List<DiaryPage> diary) {
        List<DiaryPageDto> dtoList = new ArrayList<>();
        for (DiaryPage page : diary) {
            dtoList.add(from(page));
        }
        return dtoList;
    }
}