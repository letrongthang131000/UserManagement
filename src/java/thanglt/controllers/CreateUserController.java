/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thanglt.controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thanglt.daos.UserDAO;
import thanglt.dtos.RoleDTO;
import thanglt.dtos.UserErrorDTO;

/**
 *
 * @author Thang
 */
public class CreateUserController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String INIT_SEARCH_CONTROLLER = "InitSearchController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String url = LOGIN_PAGE;

        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String user = (String) session.getAttribute("USER");

                if (user != null) {
                    boolean isAdmin = (boolean) session.getAttribute("ADMIN");

                    if (isAdmin) {
                        url = ADMIN_PAGE;
                        boolean flag = true;
                        UserErrorDTO error = new UserErrorDTO();
                        UserDAO dao = new UserDAO();

                        String userID = request.getParameter("txtCreateUserID");
                        String password = request.getParameter("txtCreatePassword");
                        String confirmPassword = request.getParameter("txtCreateConfirmPassword");
                        String userName = request.getParameter("txtCreateUserName");
                        String roleName = request.getParameter("txtCreateRole");
                        String email = request.getParameter("txtCreateEmail");
                        String phone = request.getParameter("txtCreatePhone");
                        if (userID.length() < 3 || userID.length() > 30) {
                            flag = false;
                            error.setUserIDError("User Id length is 3 - 30 characters");
                        }
                        if (dao.checkUserIdExist(userID)) {
                            flag = false;
                            error.setUserIDError("User Id is exist");
                        }

                        if (!password.isEmpty() || !confirmPassword.isEmpty()) {
                            if (password.length() < 2 || password.length() > 30) {
                                flag = false;
                                error.setPasswordError("Password length is 2 - 30 characters");
                            }
                            if (!confirmPassword.equals(password)) {
                                flag = false;
                                error.setConfirmError("Confirm password is not match !");
                            }

                        }
                        if (userName.length() < 4 || userName.length() > 20) {
                            flag = false;
                            error.setUserNameError("UserName length is 4 - 20 characters ");
                        }

                        if (!phone.matches("[0-9]{10}")) {
                            flag = false;
                            error.setPhoneError("Phone length is 10 character and must be all number");
                        }
                        if (!email.matches("[A-Za-z0-9]+@\\w+[.][\\w.]+")) {
                            flag = false;
                            error.setEmailError("Email illegal !");
                        }
                        String imageAddress = request.getParameter("createImageSource");
                        String imageName = "";
                        String imageType = "";
                        String savePath = "";
                        String saveDbPath;
                        BufferedImage bi = null;

                        if (!imageAddress.isEmpty()) {
                            imageName = imageAddress;
                            int lastIndexImage = imageName.lastIndexOf("\\");
                            imageName = imageName.substring(lastIndexImage + 1);
                            int lastIndexType = imageName.lastIndexOf(".");
                            imageType = imageName.substring(lastIndexType + 1);
                            savePath = request.getServletContext().getRealPath("");
                            File inputFile = new File(imageAddress);
                            InputStream is = new FileInputStream(inputFile);
                            bi = ImageIO.read(is);

                            if (!imageType.equals("jpg")
                                    && !imageType.equals("png")
                                    && !imageType.equals("jpeg")) {
                                flag = false;
                                error.setPhotoError("The file is not image file");
                            }
                        } else {
                            flag = false;
                            error.setPhotoError("The file is empty");
                        }

                        if (flag) {
                            saveDbPath = ".\\IMG\\" + imageName;
                            ImageIO.write(bi, imageType, new File(savePath + "\\IMG" + imageName));
                            File file = new File(savePath).getParentFile().getParentFile();
                            ImageIO.write(bi, imageType, new File(file.getAbsoluteFile() + "\\web\\IMG\\" + imageName));
                            Thread.sleep(2000);

                            int roleID = 0;
                            List<RoleDTO> listRole = (List<RoleDTO>) session.getAttribute("ROLES");

                            for (int i = 0; i < listRole.size(); i++) {
                                if (listRole.get(i).getRoleName().equals(roleName)) {
                                    roleID = listRole.get(i).getRoleID();
                                }
                            }

                            boolean result = dao.insertUser(userID, password, userName, roleID, email, phone, saveDbPath);

                            if (result) {
                                url = INIT_SEARCH_CONTROLLER;
                            }
                        } else {
                            request.setAttribute("CREATEERROR", error);
                            url = INIT_SEARCH_CONTROLLER;
                        }
                    }
                }
            }

        } catch (Exception e) {
            log("Error at CreateUserController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
