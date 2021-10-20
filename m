Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 Oct 2021 09:33:53 -0000
Message-ID: <163472243383.27359.11740094385124509035@emeril.freedesktop.org>
References: <20211020090944.29201-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211020090944.29201-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzZXJp?=
 =?utf-8?q?es_starting_with_=5Bi-g-t=2C1/2=5D_lib/crc=3A_s/INTEL=5FPIPE=5F?=
 =?utf-8?q?CRC=5FSOURCE=5FAUTO/IGT=5FPIPE=5FCRC=5FSOURCE=5FAUTO/?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/crc: s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/
URL   : https://patchwork.freedesktop.org/series/96047/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5e32858ad62342f9ae5207e0432bf6f4c896d165 intel-ci: Stop executing kms_bw

  igt_crc_t local_capture_crc;
            ^~~~~~~~~~~~~~~~~
../lib/igt_chamelium.c:1729:12: warning: unused variable ‘local_reference_crc’ [-Wunused-variable]
  igt_crc_t local_reference_crc;
            ^~~~~~~~~~~~~~~~~~~
In file included from ../lib/igt_chamelium.c:40:
../lib/igt_chamelium.c: In function ‘chamelium_assert_crc_eq_or_dump’:
../lib/igt_chamelium.c:1819:35: error: implicit declaration of function ‘igt_crc_to_string’; did you mean ‘g_quark_to_string’? [-Werror=implicit-function-declaration]
  igt_debug("Reference CRC: %s\n", igt_crc_to_string(reference_crc));
                                   ^~~~~~~~~~~~~~~~~
../lib/igt_core.h:1208:64: note: in definition of macro ‘igt_debug’
 #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                ^
../lib/igt_chamelium.c:1819:35: warning: nested extern declaration of ‘igt_crc_to_string’ [-Wnested-externs]
  igt_debug("Reference CRC: %s\n", igt_crc_to_string(reference_crc));
                                   ^~~~~~~~~~~~~~~~~
../lib/igt_core.h:1208:64: note: in definition of macro ‘igt_debug’
 #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                ^
../lib/igt_chamelium.c:1819:12: warning: format ‘%s’ expects argument of type ‘char *’, but argument 4 has type ‘int’ [-Wformat=]
  igt_debug("Reference CRC: %s\n", igt_crc_to_string(reference_crc));
            ^~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1208:64: note: in definition of macro ‘igt_debug’
 #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                ^
../lib/igt_chamelium.c:1820:12: warning: format ‘%s’ expects argument of type ‘char *’, but argument 4 has type ‘int’ [-Wformat=]
  igt_debug("Captured CRC: %s\n", igt_crc_to_string(capture_crc));
            ^~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1208:64: note: in definition of macro ‘igt_debug’
 #define igt_debug(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_DEBUG, f)
                                                                ^
../lib/igt_chamelium.c:1822:7: error: implicit declaration of function ‘igt_check_crc_equal’; did you mean ‘igt_force_dsc_enable’? [-Werror=implicit-function-declaration]
  eq = igt_check_crc_equal(reference_crc, capture_crc);
       ^~~~~~~~~~~~~~~~~~~
       igt_force_dsc_enable
../lib/igt_chamelium.c:1822:7: warning: nested extern declaration of ‘igt_check_crc_equal’ [-Wnested-externs]
../lib/igt_chamelium.c: In function ‘chamelium_frame_match_or_dump’:
../lib/igt_chamelium.c:1908:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
   reference_crc = malloc(sizeof(igt_crc_t));
                                 ^~~~~~~~~
../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc’:
../lib/igt_chamelium.c:2119:36: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
  igt_crc_t *ret = calloc(1, sizeof(igt_crc_t));
                                    ^~~~~~~~~
../lib/igt_chamelium.c: In function ‘chamelium_calculate_fb_crc_async_start’:
../lib/igt_chamelium.c:2163:33: error: invalid application of ‘sizeof’ to incomplete type ‘igt_crc_t’ {aka ‘struct _igt_crc’}
  fb_crc->ret = calloc(1, sizeof(igt_crc_t));
                                 ^~~~~~~~~
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

