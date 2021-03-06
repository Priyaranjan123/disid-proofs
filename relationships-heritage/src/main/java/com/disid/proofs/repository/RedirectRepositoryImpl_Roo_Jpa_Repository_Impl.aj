// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.repository;

import com.disid.proofs.domain.QRedirect;
import com.disid.proofs.domain.Redirect;
import com.disid.proofs.repository.RedirectRepositoryCustom;
import com.disid.proofs.repository.RedirectRepositoryImpl;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RedirectRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: RedirectRepositoryImpl implements RedirectRepositoryCustom;
    
    declare @type: RedirectRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String RedirectRepositoryImpl.NAME = "name";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String RedirectRepositoryImpl.PHONE = "phone";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Redirect> RedirectRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QRedirect redirect = QRedirect.redirect;
        
        JPQLQuery<Redirect> query = from(redirect);
        
        Path<?>[] paths = new Path<?>[] {redirect.name,redirect.phone};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(NAME, redirect.name)
			.map(PHONE, redirect.phone);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, redirect);
    }
    
}
