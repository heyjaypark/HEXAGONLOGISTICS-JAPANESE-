package  article.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;


public class DeleteArticleHandler implements CommandHandler {
	private static final String FORM_VIEW = "WEB-INF/view/DeleteForm.jsp";

	private ReadArticleService readService = new ReadArticleService();
	private DeleteArticleService deleteService = new DeleteArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);

			return null;
		}

	}

	private String processForm(HttpServletRequest req, HttpServletResponse res)
		throws IOException{
			try {
				
				String noVal = req.getParameter("no");
				int no = Integer.parseInt(noVal);
				ArticleData articleData = readService.getArticle(no, false);
				User authUser = (User)req.getSession().getAttribute("authUser");
				/*
				 * 공지사항 작성자가 삭제하는 것인지 확인 
				 * お知らせ作成者が削除することを確認
				 */
				if(!canModify(authUser,articleData)) {
					res.sendError(HttpServletResponse.SC_FORBIDDEN);
					return null;
				
				}
				/*
				 * 공지사항 작성자와 글번호를 가져옴 
				 * お知らせ作成者と書き込み番号を取得
				 */
				ModifyRequest modReq = new ModifyRequest(authUser.getId(), no,
						articleData.getArticle().getTitle(),
						articleData.getContent());
				
				req.setAttribute("modReq", modReq);
				return FORM_VIEW;
			}catch(ArticleNotFoundException e) {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
				
			}
	
		private boolean canModify(User authUser, ArticleData articleData) {
			String writerId = articleData.getArticle().getWriter().getId();
			return authUser.getId().equals(writerId);
			
		}
		
		
		private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
			User authUser =(User)req.getSession().getAttribute("authUser");
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			/*
			 * 공지사항 작성자와 글번호를 가져옴 
			 * お知らせ作成者と書き込み番号を取得
			 */
			ModifyRequest modReq = new ModifyRequest(authUser.getId(),no,
					req.getParameter("title"),
					req.getParameter("content"));
			req.setAttribute("modReq", modReq);
			
			
			Map<String, Boolean> errors = new HashMap<>();
			req.setAttribute("errors", errors);
			modReq.validate(errors);
			
			try {
				/*
				 * 공지사항 삭제 
				 * お知らせ削除
				 */
				deleteService.delete(modReq);
				return"/WEB-INF/view/DeleteSuccess.jsp";
			}catch(ArticleNotFoundException e) {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}catch(PermissionDeniedException e) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
		
		}
		
	}

