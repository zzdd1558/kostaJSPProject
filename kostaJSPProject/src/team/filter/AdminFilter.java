package team.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminFilter implements Filter {

    public AdminFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession(false);
		
		if(session != null) {
			String id = (String)session.getAttribute("id");
			
			if(id != null){
				// 정상적으로 로그인했을 때 이동할 페이지
				httpRequest.getRequestDispatcher("admin.jsp").forward(request, response);
			} else {
				// id 없는 경우 에러페이진
				String errorMsg = "아이디가 존재하지 않습니다";
				httpResponse.sendRedirect("error.jsp?msg="+errorMsg);
			}
		} else {
			// 에러페이지 이동
			String errorMsg = "관리자 로그인이 필요합니다";
			httpResponse.sendRedirect("error.jsp?msg"+errorMsg);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}