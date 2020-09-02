package my.shop.mall;

import java.util.ArrayList;
import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {

	private Vector<ProductBean> clist;
	
	public CartBean() {
		clist = new Vector<ProductBean>(); // 장바구니
	}
	
	public void addProduct(int pnum,int oqty) {
		ProductDao pdao=ProductDao.getInstance();
		ArrayList<ProductBean> alist=pdao.getOneProduct(pnum); 
		
		for(int i=0;i<clist.size();i++) { // 해당 상품이 이미 장바구니에 담겨있을 때
			int cpnum=clist.get(i).getPnum();
			if(pnum==cpnum) { //기존의 num이랑 새로운 num이랑 같으면
				int cqty = clist.get(i).getPqty(); //장바구니에 담아 놓은 수량
				clist.get(i).setPqty(oqty + cqty); //새로운 수량 + 장바구니에 담아 놓은 수량
				clist.get(i).setTotalPrice(clist.get(i).getPrice() * (oqty + cqty));// 기존의 가격 * 개수
				clist.get(i).setTotalPoint(clist.get(i).getPoint() * (oqty + cqty));// 기존의 포인트 * 개수
				return;
			}
			
		}
		
		//새 상품일 때
		alist.get(0).setPqty(oqty);
		int totalPrice = alist.get(0).getPrice() * oqty;
		int totalPoint = alist.get(0).getPoint() * oqty;
		alist.get(0).setTotalPrice(totalPrice);
		alist.get(0).setTotalPoint(totalPoint);
		
		clist.add(alist.get(0));
		
		for(int i=0;i<clist.size();i++) { //새 상품만 출력, 기존에 있던 상품에서 개수 추가업데이트 못함
			System.out.println(clist.get(i).getPnum()+","+
								clist.get(i).getPname()+","+
								clist.get(i).getPqty()+","+
								clist.get(i).getTotalPrice());
			
		}//for
		System.out.println("--------------------------------");
	}
	
	public Vector<ProductBean> getAllProducts() {
		return clist;
	}
	
	public void setEdit(int pnum,int oqty) { //3번 상품, 주문수량 2개로 수정
		
		for(ProductBean pb : clist) {
			if(pb.getPnum() == pnum) {
				if(oqty == 0) {
					clist.removeElement(pb);
					break;
				}
				else {
				pb.setPqty(oqty);
				int price = pb.getPrice() * oqty;
				int point = pb.getPoint() * oqty;
				
				pb.setTotalPrice(price);
				pb.setTotalPoint(point);
				
				break;
				}
			}
		}
		
	}
	public void removeProduct(int pnum) {
		
		for(ProductBean pb : clist) {
			if(pb.getPnum()==pnum) {
				clist.removeElement(pb);
				break;
				
			}
		}
	}
	public void removeAllProduct() {
		
		clist.removeAllElements();
	
	}
}//장바구니 bean
