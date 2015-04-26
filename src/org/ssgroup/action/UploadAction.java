package org.ssgroup.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class UploadAction {
	private File   image;  
    private String imageFileName;  
    private String imageContentType;
    
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	
	/**
	 * ajax 单个文件上传
	 * @throws IOException
	 */
	public void uploadImage() throws IOException{
		if(image==null){
			return;
		}
    	InputStream in = new FileInputStream(image);
    	byte[] buffer = new byte[(int) image.length()];
 System.out.println(buffer.length);
    	int len = 0;
    	while((len=in.read(buffer))!=-1);
	}
}
