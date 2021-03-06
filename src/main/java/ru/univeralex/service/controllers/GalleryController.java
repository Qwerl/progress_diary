package ru.univeralex.service.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.univeralex.service.security.details.UserDetailsImpl;
import ru.univeralex.service.services.GalleryService;
import ru.univeralex.service.services.ImageService;
import ru.univeralex.service.transfer.GalleryItemDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author - Alexander Kostarev
 */
@Controller
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryService service;

    private final ImageService imageService;

    @Autowired
    public GalleryController(GalleryService service, ImageService imageService) {
        this.service = service;
        this.imageService = imageService;
    }

    @GetMapping("")
    public String getGallery(ModelMap model, Authentication authentication, HttpServletResponse response) {
        UserDetailsImpl details = (UserDetailsImpl) authentication.getPrincipal();
        Long userId = details.getUser().getUserId();
        List<GalleryItemDto> gallery = service.getGalleryDto(userId);
        if (gallery.isEmpty()) {
            return "redirect:/diary/new-diary-page";
        }
        model.addAttribute("gallery", gallery);
        return "gallery";
    }

    @GetMapping("/imageDisplay")
    public void showImage(@RequestParam("filename") String fileName, HttpServletResponse response, HttpServletRequest request)
            throws IOException {

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(imageService.getImageContent(fileName));

        response.getOutputStream().close();
    }
}
