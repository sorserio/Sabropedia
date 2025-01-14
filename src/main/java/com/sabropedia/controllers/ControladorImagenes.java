package com.sabropedia.controllers;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ControladorImagenes {
	
	private static String ruta = "C:/Users/Windows 10 Pro/Documents/workspace-spring-tool-suite-4-4.26.0.RELEASE/Sabropedia-1/src/main/resources/static";

	public static String uploadImg(MultipartFile img) throws Exception{
		if(img.isEmpty()) {
			throw new Exception("El archivo de imagen no se ha subido correctamente");
		}
		try {
			File directorio= new File(ruta + "/images/");
			if(!directorio.exists()) {
				directorio.mkdirs();
			}
			String nombreImg = img.getOriginalFilename();
			Path path = Paths.get(ruta + "/images/", nombreImg);
			img.transferTo(path.toFile());
			return "images/" + nombreImg;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
    public static List<String> uploadImgs(List<MultipartFile> imgs) throws Exception {
        List<String> imagenesSubidas = new ArrayList<>();
        
        for (MultipartFile img : imgs) {
            String rutaImagen = uploadImg(img);
            if (rutaImagen != null) {
                imagenesSubidas.add(rutaImagen);
            }
        }

        return imagenesSubidas;
    }
	
	public static boolean deleteImg(String img) {
		File imgFile = new File(ruta + "/" + img);
		if(imgFile.exists()) {
			imgFile.delete();
			return true;
		}
		return false;
	}
}

