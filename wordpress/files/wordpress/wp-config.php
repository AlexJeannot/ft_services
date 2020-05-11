<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'db_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'db_password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-cluster-ip' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('WP_HOME', 'http://192.168.99.118:5050' );

define('WP_SITEURL', 'http://192.168.99.118:5050' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         	'j_v:z_9|Y`Bz)lA,81Fx;CeYBmMKAYDG_&EAIFol42[szFw PQS/ify@?Rr1Vv?{');
define('SECURE_AUTH_KEY',  	'vRW&+,v:>^]8_(q#A@_iH~.yU1,fI2lkQr<j]|S8BBO/Q@Xg4inR:scx0#@aFm-B');
define('LOGGED_IN_KEY',    	'?~tr/(Aib)1{VZz.)a.rTUvC&Br}[Bq,U+8%Bc!d1k{I(*{bSOMLb]u;yHtR.=7$');
define('NONCE_KEY',        	'=#E+/}Dv)^cLrLT]*8y8&~Bxh),}eW~k~FbTT-0q6XTB|[N=Lw7lz $uZ|<dpc`]');
define('AUTH_SALT',        	'tfP7F}:dQ:XML5re3p(^oSMx{kf+^xshwZ~PMgCoUKgE.K@|/pXX=@<%!?UM#3bl');
define('SECURE_AUTH_SALT', 	'Nv5O}TBM_O(H3GZ|>hP0*+_6R=6t&+n/drUj ,c{0*+mz(Q5CE;XUwL`JZ3[Qvw,');
define('LOGGED_IN_SALT',   	'^n`BJ;op,YkuptXO-7jcfN(;-+LokT}6-vNIIO2<4<tKxxAM%6!NiK|v,U}*1xLK');
define('NONCE_SALT',       	'j]FE|xU[R&A)A}+Z*#<2|8c<.E9u J19Q=;C^iOKi}9}I@z/Zdv[P*bI={Dt+lEi');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
