<%-- 
    Document   : booking
    Created on : Feb 24, 2021, 8:31:23 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Luxury Hotel Web Management" />
        <meta name="author" content="Rick" />
        <title>Luxury Hotel</title>
        <jsp:include page="../include-management/css-page.jsp" />
        <!--For DatePicker-->
        <link href="<c:url value="/resources-management/others/datepicker/css/datepicker.css"/>" rel="stylesheet" />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <jsp:include page="../include-management/header.jsp" />
            <!-- start page container -->	
            <div class="page-container">	
                <!-- start sidebar menu -->	
                <div class="sidebar-container">	
                    <div class="sidemenu-container navbar-collapse collapse fixed-menu">	
                        <div id="remove-scroll">	
                            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">	
                                <li class="sidebar-toggler-wrapper hide">	
                                    <div class="sidebar-toggler">	
                                        <span></span>	
                                    </div>	
                                </li>	
                                <li class="sidebar-user-panel">	
                                    <div class="user-panel">	
                                        <div class="row">	
                                            <div class="sidebar-userpic">	
                                                <img src="<c:url value="/resources-management/img/avatar.png"/>" class="img-responsive" alt=""> 
                                            </div>	
                                        </div>	
                                        <div class="profile-usertitle">	
                                            <div class="sidebar-userpic-name"> ${user.fullName} </div>	
                                            <div class="profile-usertitle-job">
                                                <c:if test="${roles == '[ROLE_USER]'}">USER</c:if>
                                                <c:if test="${roles == '[ROLE_ADMIN]'}">ADMIN</c:if>
                                                <c:if test="${roles == '[ROLE_RECEPTIONIST]'}">RECEPTIONIST</c:if>
                                                <c:if test="${roles == '[ROLE_MANAGER]'}">MANAGER</c:if>
                                            </div>	
                                        </div>	
                                        <div class="sidebar-userpic-btn">	
                                            <a class="tooltips" href="${pageContext.request.contextPath}/userProfile" data-placement="top" data-original-title="Profile">	
                                                <i class="material-icons">person_outline</i>	
                                            </a>	
                                            <a class="tooltips" href="${pageContext.request.contextPath}/logout" data-placement="top" data-original-title="Logout">	
                                                <i class="material-icons">input</i>	
                                            </a>	
                                        </div>	
                                    </div>	
                                </li>
                                <sec:authorize access="isAuthenticated()">
                                <sec:authorize access="hasAnyRole('ROLE_RECEPTIONIST,ROLE_MANAGER')">    
                                <li class="nav-item start active">
                                    <a href="${pageContext.request.contextPath}/booking" class="nav-link">
                                    
                                        <i class="material-icons">business_center</i>	
                                        <span class="title">Booking</span>
                                        <span class="selected"></span>
                                    </a>
                                </li>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('ROLE_RECEPTIONIST,ROLE_MANAGER')">
                                <li class="nav-item">
                                    <a class="nav-link nav-toggle">
                                        <i class="fa fa-book"></i>	
                                        <span class="title">Information</span>	
                                        <span class="arrow"></span>	
                                    </a>	
                                    <ul class="sub-menu">	
                                        <li class="nav-item">	
                                            <a href="${pageContext.request.contextPath}/information/view-customer" class="nav-link ">	
                                                <i class="fa fa-address-book-o"></i> Customer Info	
                                            </a>	
                                        </li>
                                        <li class="nav-item">	
                                            <a href="${pageContext.request.contextPath}/information/booking-history" class="nav-link ">	
                                                <i class="fa fa-folder"></i> Booking History	
                                            </a>	
                                        </li>	
                                    </ul>	
                                </li>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <li class="nav-item">
                                    <a class="nav-link nav-toggle">
                                        <i class="fa fa-user-circle"></i> 
                                        <span class="title">Account</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/account/view-account" class="nav-link">
                                                <i class="fa fa-group"></i> View Accounts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/account/add-account" class="nav-link">
                                                <i class="fa fa-user-plus"></i> New Account</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/account/change-password" class="nav-link">
                                                <i class="fa fa-retweet"></i> Change Password</a>
                                        </li>
                                    </ul>
                                </li>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('ROLE_MANAGER')">
                                <li class="nav-item">
                                    <a class="nav-link nav-toggle">
                                        <i class="material-icons">settings</i>
                                        <span class="title">Hotel Management</span>
                                        <span class="arrow "></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a class="nav-link nav-toggle">
                                                <i class="fa fa-plus"></i> Room Types
                                                <span class="arrow"></span>
                                            </a>
                                            <ul class="sub-menu">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/room-type/view-room-type" class="nav-link">
                                                        <i class="fa fa-minus"></i> View Room Types</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/room-type/add-room-type" class="nav-link">
                                                        <i class="fa fa-minus"></i> New Room Type</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link nav-toggle">
                                                <i class="fa fa-plus"></i> Rooms
                                                <span class="arrow"></span>
                                            </a>
                                            <ul class="sub-menu">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/room/view-room" class="nav-link">
                                                        <i class="fa fa-minus"></i> View Rooms</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/room/add-room" class="nav-link">
                                                        <i class="fa fa-minus"></i> New Room</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link nav-toggle">
                                                <i class="fa fa-plus"></i> Services
                                                <span class="arrow"></span>
                                            </a>
                                            <ul class="sub-menu">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/service/view-service" class="nav-link">
                                                        <i class="fa fa-minus"></i> View Services</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/service/add-service" class="nav-link">
                                                        <i class="fa fa-minus"></i> New Service</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link nav-toggle">
                                                <i class="fa fa-plus"></i> Promotions
                                                <span class="arrow"></span>
                                            </a>
                                            <ul class="sub-menu">
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/promotion/view-promotion" class="nav-link">
                                                        <i class="fa fa-minus"></i> View Promotions</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="${pageContext.request.contextPath}/hotelManagement/promotion/add-promotion" class="nav-link">
                                                        <i class="fa fa-minus"></i> New Promotion</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                </sec:authorize>
                                </sec:authorize>
                            </ul>		
                        </div>	
                    </div>	
                </div>
                <!-- end sidebar menu --> 
                <!-- start page content -->
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">Booking</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li>
                                        <a class="parent-item">Booking</a>&nbsp;
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Booking List</header>
                                        <button type="button" onclick="ExportExcel('xlsx')" class="btn btn-primary" style="position: absolute; right: 20px; top: 5px">Export Excel</button>
                                        <form action="${pageContext.request.contextPath}/booking/search-by-date" method="get">
                                            <label style="position: absolute; left: 311px; top: 4px; font-size: 15px; font-weight: bold">From</label>
                                            <input autocomplete="off" type="text" class="form-control" id="timeCheckIn" style="position: absolute; left: 357px; top: 5px; width: 10%" name="date1" >
                                            <label style="position: absolute; left: 490px; top: 4px; font-size: 15px; font-weight: bold">To</label>
                                            <input autocomplete="off" type="text" class="form-control" style="position: absolute; left: 515px; top: 5px; width: 10%" name="date2" id="timeCheckOut">
                                            <button type="submit" class="btn btn-warning" style="position: absolute; left: 650px; top: 5px">Search By Date</button>
                                        </form>
                                    </div>
                                    <c:if test="${mesType == 'y'}">           
                                        <div class="row">
                                             <div class="col-md-12 col-lg-12 text-center">
                                                <div class="alert alert-success" role="alert">
                                                     <p style="font-size: 15px">${mes}</p>
                                                </div>
                                             </div>      
                                        </div>
                                    </c:if>
                                    <c:if test="${mesType == 'n'}">           
                                        <div class="row">
                                             <div class="col-md-12 col-lg-12 text-center">
                                                <div class="alert alert-danger" role="alert">
                                                     <p style="font-size: 15px">${mes}</p>
                                                </div>
                                             </div>      
                                        </div>
                                    </c:if>         
                                    <div class="card-body ">
                                        <div class="table-scrollable" >
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Code</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Name</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Booking Date</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Check In</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Check Out</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Status</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Phone Number</th>
                                                        <th class="text-center" style="font-size: 15px; font-weight: 600">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookings}" var="bs">
                                                        <c:if test="${bs.status == 'BOOKED' || bs.status == 'CHECKIN' || bs.status == 'CHECKOUT'}">
                                                            <tr>
                                                                <td class="text-center">${bs.code}</td>
                                                                <td class="text-center">${bs.fullName}</td>
                                                                <td class="text-center">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${bs.bookingDate}"/>
                                                                </td>
                                                                <td class="text-center">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${bs.checkIn}"/>
                                                                </td>
                                                                <td class="text-center">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${bs.checkOut}"/>
                                                                </td>
                                                                <td class="text-center">
                                                                    <c:if test="${bs.status == 'CHECKIN'}">
                                                                        <span class="label label-sm label-primary">${bs.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${bs.status == 'BOOKED'}">
                                                                        <span class="label label-sm label-info">${bs.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${bs.status == 'CHECKOUT'}">
                                                                        <span class="label label-sm label-warning">${bs.status}</span>
                                                                    </c:if>  
                                                                </td>
                                                                <td class="text-center">${bs.phoneNumber}</td>
                                                                <td class="text-center">
                                                                    <a href="${pageContext.request.contextPath}/booking/booking-detail/${bs.id}" class="btn btn-dark">Edit</a>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>        
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Room Details</header>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-wrap">
                                            <div class="table-responsive tblHeightSet">
                                                <table class="table display product-overview mb-30" id="support_table">
                                                    <thead>
                                                        <tr>
                                                            <th class="center"> Room Number </th>
                                                            <th class="center"> Type </th>
                                                            <th class="center"> Room Status </th>
                                                            <th class="center"> Room Type Status </th>
                                                            <th class="center"> Number Of Bed </th>
                                                            <th class="center"> Price </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${rooms}" var="rs">
                                                            <tr class="odd gradeX">
                                                                </td>
                                                                <td class="center">${rs.roomNumber}</td>
                                                                <td class="center">${rs.roomType.name}</td>
                                                                <td class="center">
                                                                    <c:if test="${rs.status == 'AVAILABLE'}">
                                                                        <span class="label label-sm label-success">${rs.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${rs.status == 'BOOKED'}">
                                                                        <span class="label label-sm label-danger">${rs.status}</span>
                                                                    </c:if> 
                                                                    <c:if test="${rs.status == 'MAINTENANCE'}">
                                                                        <span class="label label-sm label-warning">${rs.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${rs.status == 'UNAVAILABLE'}">
                                                                        <span class="label label-sm label-info">${rs.status}</span>
                                                                    </c:if>    
                                                                </td>
                                                                <td class="center">
                                                                    <c:if test="${rs.roomType.status == 'ACTIVE'}">
                                                                        <span class="label label-sm label-success">${rs.roomType.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${rs.roomType.status == 'BLOCKED'}">
                                                                        <span class="label label-sm label-danger">${rs.roomType.status}</span>
                                                                    </c:if>
                                                                    <c:if test="${rs.roomType.status == 'UNACTIVE'}">
                                                                        <span class="label label-sm label-secondary">${rs.roomType.status}</span>
                                                                    </c:if>    
                                                                </td>
                                                                <td class="center">${rs.numberOfBed}</td>
                                                                <td class="center">
                                                                    <fmt:setLocale value="vi_VN" scope="session"/>
                                                                    <fmt:formatNumber type="currency" value="${rs.price}" currencySymbol="VNĐ" />
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page content -->  
                <!-- start footer -->
                <jsp:include page="../include-management/footer.jsp" />
                <!-- end footer -->
            </div>
            <!-- end page container -->
            <jsp:include page="../include-management/js-page.jsp" />
            <!--For Excel Export-->
            <script src="<c:url value="/resources-management/others/exportexcel/xlsx.full.min.js"/>"></script>
            <!--For Date Picker and Range Picker-->
            <script src="<c:url value="/resources-management/others/datepicker/js/bootstrap-datepicker.js"/>"></script>
            <script type="text/javascript">
//                For Excel Export
                function ExportExcel(type, fn, dl) {
                    var elt = document.getElementById('example4');
                    var wb = XLSX.utils.table_to_book(elt, {sheet: "Sheet JS"}
                    );
                    return dl ?
                            XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}
                            ) :
                            XLSX.writeFile(wb, fn || ('BookingList.' + (type || 'xlsx')));
                }
            </script>
            <script>
//                For Date Picker and Range Picker
                $(function () {
                    'use strict';
                    var nowTemp = new Date();
                    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

                    var checkin = $('#timeCheckIn').datepicker({
                        onRender: function (date) {
                            return date.valueOf();
                        }
                    }).on('changeDate', function (ev) {
                        if (ev.date.valueOf() > checkout.date.valueOf()) {
                            var newDate = new Date(ev.date);
                            newDate.setDate(newDate.getDate() + 2);
                            checkout.setValue(newDate);
                        }
                        checkin.hide();
                    }).data('datepicker');
                    var checkout = $('#timeCheckOut').datepicker({
                        onRender: function (date) {
                            return date.valueOf();
                        }
                    }).on('changeDate', function (ev) {
                        if (ev.date.valueOf() < checkin.date.valueOf()) {
                            var newDate = new Date(ev.date);
                            newDate.setDate(newDate.getDate() - 2);
                            checkin.setValue(newDate);
                        }
                        checkout.hide();
                    }).data('datepicker');
                });
            </script>
        </div>
    </body>
</html>