package org.example.library;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class adminRL {

    // 관리자 도서 대여/반납 페이지 보여주기
    @GetMapping("/admin/rl")
    public String showAdminRLPage() {
        return "adminRL";  // adminRL.jsp를 찾음
    }

    // 도서 대여 처리
    @PostMapping("/admin/loan")
    public String processLoan() {
        // 대여 로직 구현
        return "redirect:/admin/rl";
    }

    // 도서 반납 처리
    @PostMapping("/admin/return")
    public String processReturn() {
        // 반납 로직 구현
        return "redirect:/admin/rl";
    }
}