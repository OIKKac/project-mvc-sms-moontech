package com.moontech.sms.service;

import com.moontech.sms.dao.MatDAO;
import com.moontech.sms.persistence.MatInDAO;
import com.moontech.sms.vo.MatInVO;
import com.moontech.sms.vo.MatVO;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class MatInServiceImpl implements MatInService {

	@Inject
	private MatDAO mDao;
	@Inject
	private MatInDAO dao;

	@Override
	public int nextVal() throws Exception {
		int inSq = dao.nextVal();
		return inSq + 1 ;
	}

	@Override
	public List<MatVO> stock() throws Exception {
		List<MatVO> list = new ArrayList<MatVO>();
		List<MatVO> sqList = new ArrayList<MatVO>(mDao.matSqList());

		for(MatVO matSq : sqList) {
			list.add(mDao.matStockList(matSq));
		}
		return list;
	}

	@Override
	public void write(MatInVO vo, List<MatInVO> list) throws Exception {
		dao.create(vo);

		for(MatInVO voList : list){
			int stockAmt = voList.getStockAmt() - voList.getInAmt();
			voList.setStockAmt(stockAmt);

			dao.createDe(voList);
			dao.updateStock(voList);
		}
	}

	@Override
	public MatInVO read(int inSq) throws Exception {
		return dao.read(inSq);
	}

	@Override
	public List<MatInVO> readDe(int inSq) throws Exception {
		return dao.readDe(inSq);
	}

	@Override
	public void delete(int inSq) throws Exception {
		dao.delete(inSq);
		dao.deleteDe(inSq);
	}
}
