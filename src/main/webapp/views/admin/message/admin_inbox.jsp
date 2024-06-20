<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inbox</title>
<%@include file="/views/common/allcss.html" %>
<style>
body{
    background:#DCDCDC;
    /* margin-top:20px; */
}

.email-app {
  display: flex;
}

.email-app .email-toolbars-wrapper {
  background-color: #ffffff;
  width: 20%;
  margin-right: 1.5rem;
  border-radius: 4px;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.email-app .email-toolbars-wrapper .toolbar-header {
  padding: 1rem;
  flex-flow: row;
  display: flex;
  align-items: center;
}

.email-app .email-toolbars-wrapper .toolbar-header .btn-compose-mail {
  background: #F4F7FD;
  font-weight: 300;
  letter-spacing: .5px;
  border: none;
  transition: all, 0.3s;
  color: #ffffff;
  background-image: -webkit-linear-gradient(left, #22b9ff 0%, rgba(34, 185, 255, 0.7) 100%);
  background-image: -o-linear-gradient(left, #22b9ff 0%, rgba(34, 185, 255, 0.7) 100%);
  background-image: linear-gradient(to right, #22b9ff 0%, rgba(34, 185, 255, 0.7) 100%);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF22B9FF', endColorstr='#B322B9FF', GradientType=1);
}

@media (prefers-reduced-motion: reduce) {
  .email-app .email-toolbars-wrapper .toolbar-header .btn-compose-mail {
    transition: none;
  }
}

.email-app .email-toolbars-wrapper .toolbar-header .btn-compose-mail svg {
  color: #ffffff;
  width: 22px;
  height: 22px;
}

.email-app .email-toolbars-wrapper .toolbar-header .btn-compose-mail:hover {
  box-shadow: 0px 1px 6px 0px rgba(34, 185, 255, 0.75);
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-title {
  color: #727686;
  padding: 0 1rem .5rem 1rem;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu {
  padding: 0;
  margin-bottom: 1rem;
  height: auto;
  list-style-type: none;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li {
  display: flex;
  align-items: center;
  padding: .5rem 1rem;
  transition: 0.4s;
  position: relative;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li:hover {
  color: #22b9ff;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li:hover a {
  color: #22b9ff;
  font-weight: 600;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li svg {
  margin-right: 0.625rem;
  width: 1rem;
  height: 1rem;
  line-height: 1.5;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li a {
  flex: 1;
  color: #394044;
  font-size: 14px;
  text-decoration: none;
  transition: all, 0.3s;
}

@media (prefers-reduced-motion: reduce) {
  .email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li a {
    transition: none;
  }
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li.active a {
  color: #22b9ff;
  font-weight: 600;
}

.email-app .email-toolbars-wrapper .toolbar-body .toolbar-menu li.active svg {
  color: #22b9ff;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-header {
  padding: 1rem;
  justify-content: space-between;
  display: flex;
  align-items: center;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-header .contact-left {
  display: flex;
  align-items: center;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-header .contact-left .title {
  margin: 0 1rem 0 0;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-header .dropdown {
  float: right;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list {
  padding: 0 1rem;
  list-style-type: none;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item {
  padding: .625rem 0;
  display: block;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item:last-child {
  border-bottom: 0;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a {
  text-decoration: none;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .pro-pic {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  padding: 0;
  width: 20%;
  max-width: 40px;
  position: relative;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .pro-pic img {
  max-width: 100%;
  width: 100%;
  border-radius: 100%;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .pro-pic .active {
  width: 12px;
  height: 12px;
  background: #17d1bd;
  border-radius: 100%;
  position: absolute;
  top: 6px;
  right: -4px;
  border: 2px solid #ffffff;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .pro-pic .inactive {
  width: 12px;
  height: 12px;
  background: #dde1e9;
  border-radius: 100%;
  position: absolute;
  top: 6px;
  right: -4px;
  border: 2px solid #ffffff;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .pro-pic .busy {
  width: 12px;
  height: 12px;
  background: #F95062;
  border-radius: 100%;
  position: absolute;
  top: 6px;
  right: -4px;
  border: 2px solid #ffffff;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .user {
  width: 100%;
  padding: 5px 10px 0 15px;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .user .user-name {
  margin: 0;
  font-weight: 400;
  font-size: 13px;
  line-height: 1;
  color: #394044;
}

.email-app .email-toolbars-wrapper .toolbar-body .contact-list .contact-list-item a .user .user-designation {
  font-size: 12px;
  color: #727686;
  overflow: hidden;
  max-width: 100%;
  white-space: nowrap;
  margin-bottom: 0;
}

.email-app .email-list-wrapper {
  width: 30%;
  margin-right: 1.5rem;
}

.email-app .email-list-wrapper .email-list-scroll-container {
  height: 100vh;
  position: relative;
}

.email-app .email-list-wrapper .email-list-header {
  padding: 1rem 0;
  flex-direction: row;
  justify-content: space-between;
  display: flex;
  align-items: center;
}

.email-app .email-list-wrapper .email-list {
  height: calc(100vh - 70px);
  list-style-type: none;
  padding: 0;
}

.email-app .email-list-wrapper .email-list .email-list-item {
  margin-bottom: 1.2rem;
  background-color: #ffffff;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  text-decoration: none;
  border-radius: 4px;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.email-app .email-list-wrapper .email-list .email-list-item.active {
  border: 1.5px solid #22b9ff;
}

.email-app .email-list-wrapper .email-list .email-list-item .recipient {
  display: flex;
  align-items: center;
  flex-shrink: 0;
  padding: 0;
  margin-bottom: .7rem;
}

.email-app .email-list-wrapper .email-list .email-list-item .recipient img {
  margin-right: .5rem;
  width: 40px;
  height: 40px;
  border-radius: 100%;
}

.email-app .email-list-wrapper .email-list .email-list-item .recipient .recipient-name {
  font-weight: 500;
  font-size: 14px;
  line-height: 1;
  color: #727686;
}

.email-app .email-list-wrapper .email-list .email-list-item .recipient .recipient-name:hover {
  color: #22b9ff;
  text-decoration: none;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-subject {
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #394044;
  font-size: 1rem;
  font-weight: 400;
  margin-bottom: .7rem;
  text-decoration: none;
  line-height: 1.5;
  transition: all, 0.3s;
}

@media (prefers-reduced-motion: reduce) {
  .email-app .email-list-wrapper .email-list .email-list-item .email-subject {
    transition: none;
  }
}

.email-app .email-list-wrapper .email-list .email-list-item .email-subject .unread {
  flex-shrink: 0;
  margin-left: 1rem;
  width: .5rem;
  height: .5rem;
  border-radius: 100%;
  display: block;
  background: #22b9ff;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-subject:hover {
  color: #22b9ff;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a {
  margin-right: .5rem;
  transition: all, 0.3s;
}

@media (prefers-reduced-motion: reduce) {
  .email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a {
    transition: none;
  }
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.starred {
  color: #fd7e14;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.starred .fill {
  stroke-width: 1px;
  fill: #fd7e14;
  color: #fd7e14;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.important {
  color: #ffc107;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.important .fill {
  stroke-width: 1px;
  fill: #ffc107;
  color: #ffc107;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.attachment {
  color: #727686;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a.attachment:hover {
  color: #22b9ff;
  text-decoration: none;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-action a svg {
  width: 20px;
  height: 20px;
}

.email-app .email-list-wrapper .email-list .email-list-item .email-footer .email-time {
  color: #B1BAC5;
}

.email-app .email-desc-wrapper {
  width: 50%;
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 4px;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.email-app .email-desc-wrapper .email-header {
  margin-bottom: 1.5rem;
}

.email-app .email-desc-wrapper .email-header .email-date {
  color: #727686;
  font-size: 13px;
  margin-bottom: .5rem;
}

.email-app .email-desc-wrapper .email-header .email-subject {
  color: #394044;
  font-size: 1.2rem;
  line-height: 1.5;
  font-weight: 500;
  margin-bottom: .8rem;
  flex-shrink: 0;
}

.email-app .email-desc-wrapper .email-header .recipient {
  margin: 0;
  font-size: 14px;
  line-height: 1;
  color: #727686;
}

.email-app .email-desc-wrapper .email-header .recipient span {
  font-weight: 500;
  color: #394044;
}

.email-app .email-desc-wrapper .email-body {
  min-height: 350px;
  color: #727686;
  margin-bottom: 2rem;
}

.email-app .email-desc-wrapper .email-body p {
  font-size: 13px;
  margin-bottom: 1rem;
  line-height: 2;
}

.email-app .email-desc-wrapper .email-attachment {
  margin-bottom: 2rem;
}

.email-app .email-desc-wrapper .email-attachment .file-info {
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
}

.email-app .email-desc-wrapper .email-attachment .file-info .file-size {
  color: #B1BAC5;
  margin-right: .5rem;
  display: flex;
  align-items: center;
}

.email-app .email-desc-wrapper .email-attachment .file-info .file-size svg {
  width: 20px;
  height: 20px;
  margin-right: .5rem;
}

.email-app .email-desc-wrapper .email-attachment .file-info .btn, .email-app .email-desc-wrapper .email-attachment .file-info .wizard > .actions a, .wizard > .actions .email-app .email-desc-wrapper .email-attachment .file-info a, .email-app .email-desc-wrapper .email-attachment .file-info .fc button, .fc .email-app .email-desc-wrapper .email-attachment .file-info button {
  font-size: 13px;
  margin-right: .5rem;
  padding: 0.1875rem .7rem;
  box-shadow: none;
}

.email-app .email-desc-wrapper .email-attachment .attachment-list {
  padding: 0;
  height: 100%;
}

.email-app .email-desc-wrapper .email-attachment .attachment-list .attachment-list-item {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
  width: 80px;
  height: 80px;
  overflow: hidden;
  margin: 0 .5rem .5rem 0;
  background-color: #d3f1ff;
  border-radius: 4px;
}

.email-app .email-desc-wrapper .email-attachment .attachment-list .attachment-list-item span {
  height: 80px;
  display: table-cell;
  vertical-align: middle;
  width: 80px;
  font-weight: 300;
  font-size: 1.5rem;
}

.email-app .email-desc-wrapper .email-attachment .attachment-list .attachment-list-item img {
  width: 100%;
  height: 100%;
}

.email-app .email-desc-wrapper .email-attachment .attachment-list .attachment-list-item:hover {
  cursor: pointer;
}

.email-app .email-desc-wrapper .email-action .btn, .email-app .email-desc-wrapper .email-action .wizard > .actions a, .wizard > .actions .email-app .email-desc-wrapper .email-action a, .email-app .email-desc-wrapper .email-action .fc button, .fc .email-app .email-desc-wrapper .email-action button {
  margin-right: .7rem;
}

.email-app .email-desc-wrapper .email-action .btn:first-child i, .email-app .email-desc-wrapper .email-action .wizard > .actions a:first-child i, .wizard > .actions .email-app .email-desc-wrapper .email-action a:first-child i, .email-app .email-desc-wrapper .email-action .fc button:first-child i, .fc .email-app .email-desc-wrapper .email-action button:first-child i {
  font-size: 13px;
  margin-left: .5rem;
}

.email-app .email-desc-wrapper .email-action .btn:last-child i, .email-app .email-desc-wrapper .email-action .wizard > .actions a:last-child i, .wizard > .actions .email-app .email-desc-wrapper .email-action a:last-child i, .email-app .email-desc-wrapper .email-action .fc button:last-child i, .fc .email-app .email-desc-wrapper .email-action button:last-child i {
  font-size: 13px;
  margin-right: .5rem;
}

@media (max-width: 575px) {
  .email-app .email-toolbars-wrapper,
  .email-app .email-desc-wrapper {
    display: none;
  }
  .email-app .email-list-wrapper {
    width: 100%;
    margin: 0;
  }
}

@media (min-width: 600px) and (max-width: 1024px) {
  .email-app .email-toolbars-wrapper {
    display: none;
  }
  .email-app .email-desc-wrapper {
    width: 60%;
  }
  .email-app .email-list-wrapper {
    width: 40%;
  }
}

</style>
</head>
<body>
<div class="container">
<div class="content-wrapper">
    <!-- Content Place Here -->
    <div class="email-app card-margin">
        <div class="email-toolbars-wrapper">
            <div class="toolbar-header">
      <form action="/compose" method="get">
                <button type="submit" class="btn btn-lg btn-block btn-compose-mail" value="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>
                    Compose Mail
                </button>
                </form>
            </div>
            <div class="toolbar-body">
                <div class="toolbar-title">Folders</div>
                <ul class="toolbar-menu">
                    <li class="active">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail">
                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                            <polyline points="22,6 12,13 2,6"></polyline>
                        </svg>
                        <a href="#">Inbox</a>
                        <span class="badge badge-sb-base">8</span>
                    </li>
                    <%-- <li>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-copy">
                            <rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                            <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                        </svg>
                        <a href="#">Drafts</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send">
                            <line x1="22" y1="2" x2="11" y2="13"></line>
                            <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                        </svg>
                        <a href="#">Sent</a>
                    </li>
                    <li>
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            class="feather feather-alert-circle"
                        >
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12" y2="16"></line>
                        </svg>
                        <a href="#">Spam</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
                        <a href="#">Trash</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                        </svg>
                        <a href="#">Starred</a>
                    </li>
                    </ul> --%>
                
                <div class="contact-header">
                   <%--  <div class="contact-left">
                        <h5 class="title">Contacts</h5>
                        <span class="badge badge-sb-success">10</span>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-flash-primary" type="button" id="product-action-pane" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-more-vertical toolbar-icon"
                            >
                                <circle cx="12" cy="12" r="1"></circle>
                                <circle cx="12" cy="5" r="1"></circle>
                                <circle cx="12" cy="19" r="1"></circle>
                            </svg>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="dropdown-item"><span class="dropdown-title">Action Pane</span></li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-printer"
                                    >
                                        <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                        <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                                        <rect x="6" y="14" width="12" height="8"></rect>
                                    </svg>
                                    Print
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-delete"
                                    >
                                        <path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path>
                                        <line x1="18" y1="9" x2="12" y2="15"></line>
                                        <line x1="12" y1="9" x2="18" y2="15"></line>
                                    </svg>
                                    Remove
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-send"
                                    >
                                        <line x1="22" y1="2" x2="11" y2="13"></line>
                                        <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                                    </svg>
                                    Send Email
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-file-text"
                                    >
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                        <polyline points="10 9 9 9 8 9"></polyline>
                                    </svg>
                                    Export as PDF
                                </a>
                            </li>
                            <li class="dropdown-item">
                                <a class="dropdown-link" href="#">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-bookmark"
                                    >
                                        <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                                    </svg>
                                    Save as Bookmark
                                </a>
                            </li>
                        </ul>
                    </div> --%>
                 </div>
                <ul class="contact-list">
                    <li class="contact-list-item">
                        <a href="#">
                            <span class="pro-pic">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Picture" />
                                <i class="active">&nbsp;</i>
                            </span>
                            <div class="user">
                                <p class="user-name">Poul Smith</p>
                                <p class="user-designation">Founder @ Maxx</p>
                            </div>
                        </a>
                    </li>
                </ul> 
            </div> 
        </div> 
        
        <div class="email-list-wrapper">
            <div class="email-list-header">
                <div class="dropdown">
                    <button class="btn btn-sm btn-flash-border-base shadow-none dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Recent
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li class="dropdown-item"><a class="dropdown-link" href="#">Focused</a></li>
                        <li class="dropdown-item"><a class="dropdown-link" href="#">Others</a></li>
                    </ul>
                </div>
            </div>
            <div id="email-app-body" class="email-list-scroll-container ps ps--active-y">
                <ul class="email-list">
                <c:forEach var="msg" items="${msg}">
                    <li class="email-list-item">
                        <div class="recipient">
                            <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Profile Picture" />
                            <a href="/message/${msg.date}/${msg.subject}/${msg.senderid}/${msg.content}" class="recipient-name">${msg.senderid}</a>
                        </div>
                        <a href="#" class="email-subject">${msg.subject}<i class="unread">&nbsp;</i></a>
                        <div class="email-footer">
                            <div class="email-action">
                                <a href="#" class="important">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-bookmark fill"
                                    >
                                        <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                                    </svg>
                                </a>
                                <a href="#" class="starred">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-star"
                                    >
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                    </svg>
                                </a>
                                <a href="#" class="attachment">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="feather feather-paperclip"
                                    >
                                        <path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path>
                                    </svg>
                                </a>
                            </div>
                            <span class="email-time">${msg.date }</span>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div>
                <div class="ps__rail-y" style="top: 0px; height: 911px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 772px;"></div></div>
            </div>
        </div>
        <div class="email-desc-wrapper">
            <div class="email-header">
                <div class="email-date">${date}</div>
                <div class="email-subject">${subject}</div>
                <p class="recipient"><span>From:</span>  &lt;${senderid}&gt;</p>
            </div>
            <div class="email-body">
                <p>
                   ${content}
                </p>
            </div>
            <!-- <div class="email-attachment">
                <div class="file-info">
                    <div class="file-size">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip">
                            <path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path>
                        </svg>
                        <span>Attachment (90 MB)</span>
                    </div>
                    <button class="btn btn-sm btn-soft-base">View All</button>
                    <button class="btn btn-sm btn-soft-success">Download All</button>
                </div>
                <ul class="attachment-list">
                    <li class="attachment-list-item"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Showcase" title="Showcase" /></li>
                    <li class="attachment-list-item"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="Showcase" title="Showcase" /></li>
                    <li class="attachment-list-item"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Showcase" title="Showcase" /></li>
                    <li class="attachment-list-item"><img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="Showcase" title="Showcase" /></li>
                    <li class="attachment-list-item"><span class="text-base">30+</span></li>
                </ul>
            </div> -->
            <!-- <div class="email-action">
                <button class="btn btn-base">Reply <i class="fa fa-reply"></i></button>
                <button class="btn btn-info"><i class="fa fa-share"></i> Forward</button>
            </div> -->
        </div>
    </div>
</div>
</div>
<%@include file="/views/common/alljs.html" %>
</body>
</html> 