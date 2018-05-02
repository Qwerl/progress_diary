package ru.univeralex.service.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.univeralex.service.forms.DiaryPageForm;
import ru.univeralex.service.models.DiaryPage;
import ru.univeralex.service.repositories.DiaryRepository;
import ru.univeralex.service.security.details.UserDetailsImpl;
import ru.univeralex.service.transfer.DiaryPageDto;

import java.io.IOException;
import java.util.List;

import static ru.univeralex.service.transfer.DiaryPageDto.fromList;

/**
 * @author - Alexander Kostarev
 */
@Controller
@RequestMapping("/diary")
public class DiaryController {

    @Autowired
    private DiaryRepository diaryRepository;

    @GetMapping("")
    public String getProfilePage(ModelMap model, Authentication authentication) {
        if (authentication == null) {
            return "redirect:/login";
        }
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        Long userId = details.getUser().getUserId();
        List<DiaryPageDto> diary = fromList(diaryRepository.findAllByUserIdOrderByDate(userId));

        model.addAttribute("diary", diary);
        return "diary";
    }

    @PostMapping("/new")
    public String addDiaryPage(@RequestParam("file") MultipartFile fileFromUser,
                               DiaryPageForm diaryPageForm,
                               Authentication authentication) {
        byte[] dataFromFile = null;
        try {
            dataFromFile = fileFromUser.getBytes();
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        Long userId = details.getUser().getUserId();
        DiaryPage newDiaryPage = DiaryPage.from(diaryPageForm, userId, fileFromUser.getOriginalFilename(), dataFromFile);
        diaryRepository.save(newDiaryPage);
        return "redirect:/diary";
    }

    @PostMapping("/edit")
    public String editDiaryPage(@RequestParam("file") MultipartFile fileFromUser,
                                DiaryPageForm diaryPageForm,
                                Authentication authentication) {
        byte[] dataFromFile = null;
        try {
            dataFromFile = fileFromUser.getBytes();
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        Long userId = details.getUser().getUserId();
        DiaryPage diaryPage = diaryRepository.findOne(diaryPageForm.getId());
        DiaryPage newDiaryPage = null;
        if (fileFromUser.getOriginalFilename().equals(diaryPage.getFilename())) {
            newDiaryPage = DiaryPage.from(diaryPageForm, userId, diaryPage.getFilename(), diaryPage.getData());
        } else {
            newDiaryPage = DiaryPage.from(diaryPageForm, userId, fileFromUser.getOriginalFilename(), dataFromFile);
        }
        diaryRepository.save(newDiaryPage);
        return "redirect:/diary";
    }
}
