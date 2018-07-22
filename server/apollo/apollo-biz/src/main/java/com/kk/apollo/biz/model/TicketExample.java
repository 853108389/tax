package com.kk.apollo.biz.model;

import java.util.ArrayList;
import java.util.List;

public class TicketExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TicketExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTnumberIsNull() {
            addCriterion("tnumber is null");
            return (Criteria) this;
        }

        public Criteria andTnumberIsNotNull() {
            addCriterion("tnumber is not null");
            return (Criteria) this;
        }

        public Criteria andTnumberEqualTo(String value) {
            addCriterion("tnumber =", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberNotEqualTo(String value) {
            addCriterion("tnumber <>", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberGreaterThan(String value) {
            addCriterion("tnumber >", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberGreaterThanOrEqualTo(String value) {
            addCriterion("tnumber >=", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberLessThan(String value) {
            addCriterion("tnumber <", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberLessThanOrEqualTo(String value) {
            addCriterion("tnumber <=", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberLike(String value) {
            addCriterion("tnumber like", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberNotLike(String value) {
            addCriterion("tnumber not like", value, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberIn(List<String> values) {
            addCriterion("tnumber in", values, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberNotIn(List<String> values) {
            addCriterion("tnumber not in", values, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberBetween(String value1, String value2) {
            addCriterion("tnumber between", value1, value2, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTnumberNotBetween(String value1, String value2) {
            addCriterion("tnumber not between", value1, value2, "tnumber");
            return (Criteria) this;
        }

        public Criteria andTmoneyIsNull() {
            addCriterion("tmoney is null");
            return (Criteria) this;
        }

        public Criteria andTmoneyIsNotNull() {
            addCriterion("tmoney is not null");
            return (Criteria) this;
        }

        public Criteria andTmoneyEqualTo(String value) {
            addCriterion("tmoney =", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyNotEqualTo(String value) {
            addCriterion("tmoney <>", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyGreaterThan(String value) {
            addCriterion("tmoney >", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyGreaterThanOrEqualTo(String value) {
            addCriterion("tmoney >=", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyLessThan(String value) {
            addCriterion("tmoney <", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyLessThanOrEqualTo(String value) {
            addCriterion("tmoney <=", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyLike(String value) {
            addCriterion("tmoney like", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyNotLike(String value) {
            addCriterion("tmoney not like", value, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyIn(List<String> values) {
            addCriterion("tmoney in", values, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyNotIn(List<String> values) {
            addCriterion("tmoney not in", values, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyBetween(String value1, String value2) {
            addCriterion("tmoney between", value1, value2, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTmoneyNotBetween(String value1, String value2) {
            addCriterion("tmoney not between", value1, value2, "tmoney");
            return (Criteria) this;
        }

        public Criteria andTcodeIsNull() {
            addCriterion("tcode is null");
            return (Criteria) this;
        }

        public Criteria andTcodeIsNotNull() {
            addCriterion("tcode is not null");
            return (Criteria) this;
        }

        public Criteria andTcodeEqualTo(String value) {
            addCriterion("tcode =", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeNotEqualTo(String value) {
            addCriterion("tcode <>", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeGreaterThan(String value) {
            addCriterion("tcode >", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeGreaterThanOrEqualTo(String value) {
            addCriterion("tcode >=", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeLessThan(String value) {
            addCriterion("tcode <", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeLessThanOrEqualTo(String value) {
            addCriterion("tcode <=", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeLike(String value) {
            addCriterion("tcode like", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeNotLike(String value) {
            addCriterion("tcode not like", value, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeIn(List<String> values) {
            addCriterion("tcode in", values, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeNotIn(List<String> values) {
            addCriterion("tcode not in", values, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeBetween(String value1, String value2) {
            addCriterion("tcode between", value1, value2, "tcode");
            return (Criteria) this;
        }

        public Criteria andTcodeNotBetween(String value1, String value2) {
            addCriterion("tcode not between", value1, value2, "tcode");
            return (Criteria) this;
        }

        public Criteria andTdateIsNull() {
            addCriterion("tdate is null");
            return (Criteria) this;
        }

        public Criteria andTdateIsNotNull() {
            addCriterion("tdate is not null");
            return (Criteria) this;
        }

        public Criteria andTdateEqualTo(String value) {
            addCriterion("tdate =", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateNotEqualTo(String value) {
            addCriterion("tdate <>", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateGreaterThan(String value) {
            addCriterion("tdate >", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateGreaterThanOrEqualTo(String value) {
            addCriterion("tdate >=", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateLessThan(String value) {
            addCriterion("tdate <", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateLessThanOrEqualTo(String value) {
            addCriterion("tdate <=", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateLike(String value) {
            addCriterion("tdate like", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateNotLike(String value) {
            addCriterion("tdate not like", value, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateIn(List<String> values) {
            addCriterion("tdate in", values, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateNotIn(List<String> values) {
            addCriterion("tdate not in", values, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateBetween(String value1, String value2) {
            addCriterion("tdate between", value1, value2, "tdate");
            return (Criteria) this;
        }

        public Criteria andTdateNotBetween(String value1, String value2) {
            addCriterion("tdate not between", value1, value2, "tdate");
            return (Criteria) this;
        }

        public Criteria andTnopassIsNull() {
            addCriterion("tnopass is null");
            return (Criteria) this;
        }

        public Criteria andTnopassIsNotNull() {
            addCriterion("tnopass is not null");
            return (Criteria) this;
        }

        public Criteria andTnopassEqualTo(String value) {
            addCriterion("tnopass =", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassNotEqualTo(String value) {
            addCriterion("tnopass <>", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassGreaterThan(String value) {
            addCriterion("tnopass >", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassGreaterThanOrEqualTo(String value) {
            addCriterion("tnopass >=", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassLessThan(String value) {
            addCriterion("tnopass <", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassLessThanOrEqualTo(String value) {
            addCriterion("tnopass <=", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassLike(String value) {
            addCriterion("tnopass like", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassNotLike(String value) {
            addCriterion("tnopass not like", value, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassIn(List<String> values) {
            addCriterion("tnopass in", values, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassNotIn(List<String> values) {
            addCriterion("tnopass not in", values, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassBetween(String value1, String value2) {
            addCriterion("tnopass between", value1, value2, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTnopassNotBetween(String value1, String value2) {
            addCriterion("tnopass not between", value1, value2, "tnopass");
            return (Criteria) this;
        }

        public Criteria andTpassIsNull() {
            addCriterion("tpass is null");
            return (Criteria) this;
        }

        public Criteria andTpassIsNotNull() {
            addCriterion("tpass is not null");
            return (Criteria) this;
        }

        public Criteria andTpassEqualTo(String value) {
            addCriterion("tpass =", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassNotEqualTo(String value) {
            addCriterion("tpass <>", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassGreaterThan(String value) {
            addCriterion("tpass >", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassGreaterThanOrEqualTo(String value) {
            addCriterion("tpass >=", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassLessThan(String value) {
            addCriterion("tpass <", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassLessThanOrEqualTo(String value) {
            addCriterion("tpass <=", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassLike(String value) {
            addCriterion("tpass like", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassNotLike(String value) {
            addCriterion("tpass not like", value, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassIn(List<String> values) {
            addCriterion("tpass in", values, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassNotIn(List<String> values) {
            addCriterion("tpass not in", values, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassBetween(String value1, String value2) {
            addCriterion("tpass between", value1, value2, "tpass");
            return (Criteria) this;
        }

        public Criteria andTpassNotBetween(String value1, String value2) {
            addCriterion("tpass not between", value1, value2, "tpass");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}