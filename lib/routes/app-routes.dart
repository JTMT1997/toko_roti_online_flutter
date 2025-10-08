import 'package:flutter/material.dart';
import 'package:toko_roti_online/views/admin/manage_courrier_page.dart';
import 'package:toko_roti_online/views/admin/admin_dashboard_page.dart';
import 'package:toko_roti_online/views/admin/manage_order_page.dart';
import 'package:toko_roti_online/views/admin/manage_products_page.dart';
import 'package:toko_roti_online/views/admin/admin_profil_page.dart';
import 'package:toko_roti_online/views/courier/courier_dashboard_page.dart';
import 'package:toko_roti_online/views/customer/cart_page.dart';
import 'package:toko_roti_online/views/customer/checkout_page.dart';
import 'package:toko_roti_online/views/customer/login_page.dart';
import 'package:toko_roti_online/views/customer/order_status_page.dart';
import 'package:toko_roti_online/views/customer/product_detail_page.dart';
import 'package:toko_roti_online/views/customer/product_list_page.dart';
import 'package:toko_roti_online/views/customer/register_page.dart';
import 'package:toko_roti_online/views/customer/splash_screen.dart';

class AppRoutes {
  // Route Costumer
  static const splash = "/";
  static const login = "/login";
  static const register = "/register";
  static const products= "/products";
  static const productDetail = "/productDetail";
  static const productList = "/productList";
  static const cart = "/cart";
  static const checkout = "/checkout";
  static const orderStatus = "/orderStatus";



  // route Admin
  static const adminDashboard = "/admin/dashboard";
  static const adminProducts = "/admin/products";
  static const adminOrders = "/admin/orders";
  static const adminCouriers= "/admin/couriers";
  static const adminProfil = "/admin/profil";

//Route Courier

static const coureirDashboard = "/courier/dashboard";
// static const listCourier = "/courier/list";


  static Map<String, WidgetBuilder> routes ={
    splash: (_)=> SplashScreen(),
    login: (_)=> LoginPage(),
    productList: (_)=> ProductListPage(),
    register : (_)=> RegisterPage(),
    productDetail :  (_)=> ProductDetailPage(),
    cart :  (_)=> CartPage(),
    checkout : (_)=>CheckoutPage(),
    orderStatus : (_)=>OrderStatusPage(),
    adminDashboard: (_)=> AdminDashboardPage(),
    adminProducts: (_)=> ManageProductsPage(),
    adminOrders: (_)=> ManageOrdersPage(),
    adminCouriers : (_)=> ManageCourrierPage(),
    adminProfil :  (_)=> AdminProfilPage(),
    coureirDashboard: (_) =>CourierDashboardPage(),
  };

  





  
}