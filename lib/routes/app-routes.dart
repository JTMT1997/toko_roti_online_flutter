import 'package:flutter/material.dart';
import 'package:toko_roti_online/views/admin/manage_courrier_page.dart';
import 'package:toko_roti_online/views/admin/admin_dashboard_page.dart';
import 'package:toko_roti_online/views/admin/manage_customer.dart';
import 'package:toko_roti_online/views/admin/manage_order_page.dart';
import 'package:toko_roti_online/views/admin/manage_products_page.dart';
import 'package:toko_roti_online/views/admin/admin_profil_page.dart';
import 'package:toko_roti_online/views/admin/product_form.dart';
import 'package:toko_roti_online/views/admin/product_list.dart';
import 'package:toko_roti_online/views/courier/courier_dashboard_page.dart';
import 'package:toko_roti_online/views/courier/courier_profile_page.dart';
import 'package:toko_roti_online/views/courier/delivery_detail_page.dart';
import 'package:toko_roti_online/views/courier/delivery_list_page.dart';
import 'package:toko_roti_online/views/customer/cart_page.dart';
import 'package:toko_roti_online/views/customer/checkout_page.dart';
import 'package:toko_roti_online/views/customer/login_page.dart';
import 'package:toko_roti_online/views/customer/order_status_page.dart';
import 'package:toko_roti_online/views/customer/product_detail_page.dart';
import 'package:toko_roti_online/views/customer/product_list_page.dart';
import 'package:toko_roti_online/views/customer/register_page.dart';
import 'package:toko_roti_online/views/customer/splash_screen.dart';
import 'package:toko_roti_online/views/customer/transaction_list_page.dart';

class AppRoutes {

  //register 

  // Route Costumer
  static const splash = "/";
  static const login = "/login";
  static const register = "/register";
  static const products= "/products";
  static const productDetail = "/productDetail";
  static const cart = "/cart";
  static const checkout = "/checkout";
  static const orderStatus = "/orderStatus";



  // route Admin
  static const adminDashboard = "/admin/dashboard";
  static const adminProducts = "/admin/products";
  static const adminOrders = "/admin/orders";
  static const adminCouriers= "/admin/couriers";
  static const adminProfil = "/admin/profil";
  static const adminUser = '/admin/user';

//Route Courier

static const coureirDashboard = "/courier/dashboard";
static const courierDeliveryList= "/courier/DeliveryList";
static const courierProfile = '/courier/CourierProfile';
static const courierDeliveryDetail = '/courier/DeliveryDetail';
static const courierTracking = '/courier/CourierTracking';

static const purchaseList = '/purchases'; 



  static Map<String, WidgetBuilder> routes ={
    splash: (_)=> SplashScreen(),
    login: (_)=> LoginPage(),
    products: (_)=> ProductListPage(),
    register : (_)=> RegisterPage(),
    productDetail :  (_)=> ProductDetailPage(),
    cart :  (_)=> CartPage(),
    checkout : (_)=>CheckoutPage(),
    orderStatus : (_)=>OrderStatusPage(),
    adminDashboard: (_)=> AdminDashboardPage(),
    adminProducts: (_)=> ProductList(),
    adminOrders: (_)=> ManageOrdersPage(),
    adminCouriers : (_)=> ManageCourrierPage(),
    adminProfil :  (_)=> AdminProfilPage(),
    adminUser : (_)=>ManageCustomerPage(),
    coureirDashboard: (_) =>CourierDashboardPage(),
    courierDeliveryList: (_)=>DeliveryListPage(),
    courierProfile :(_) =>CourierProfilePage(),
    courierDeliveryDetail : (_)=>CourierDeliveryDetailPage(),
    purchaseList :(_)=> TransactionListPage(),

  };

  





  
}