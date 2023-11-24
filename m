Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA2A10E7D2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 09:46:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri, 24 Nov 2023 15:06:02 +0530
Message-Id: <20231124093602.2358565-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20231124093602.2358565-1-bhanuprakash.modem@intel.com>
References: <20231124093602.2358565-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 5/5] tests/kms/testplan: Avoid duplicate names on
 Mega feature vs Functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Avoid duplicate names on Mega feature vs Functionality in KMS
testplan documentation.

This patch will do below updates in Functionality:
- eDP --> eDP_core
- hdr --> static_hdr
- psr --> psr1, psr2 (based on the requiremnet)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/kms_fbcon_fbt.c            |   4 +-
 tests/intel/kms_frontbuffer_tracking.c | 228 ++++++++++++-------------
 tests/intel/kms_pm_dc.c                |   4 +-
 tests/intel/kms_psr.c                  |  38 ++---
 tests/intel/kms_psr_stress_test.c      |   2 +-
 tests/kms_feature_discovery.c          |   4 +-
 tests/kms_hdmi_inject.c                |   2 +-
 tests/kms_hdr.c                        |  13 +-
 tests/kms_panel_fitting.c              |   2 +-
 tests/kms_scaling_modes.c              |   2 +-
 10 files changed, 151 insertions(+), 148 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index e2617a79a..90484dccf 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -57,13 +57,13 @@
  * SUBTEST: psr
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure with psr enabled.
- * Functionality: fbcon, fbt, psr
+ * Functionality: fbcon, fbt, psr1
  * Mega feature: PSR
  *
  * SUBTEST: psr-suspend
  * Description: Suspend test to validate the relationship between fbcon and the
  *              frontbuffer tracking infrastructure with psr enabled.
- * Functionality: fbcon, fbt, psr, suspend
+ * Functionality: fbcon, fbt, psr1, suspend
  * Mega feature: PSR
  */
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index abc44bf39..259dfd136 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -67,7 +67,7 @@
  *
  * SUBTEST: psr-%dp-rte
  * Description: Sanity test to enable PSR with %arg[1] panels.
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-%dp-rte
  * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
@@ -75,15 +75,15 @@
  *
  * SUBTEST: fbcpsr-%dp-rte
  * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-%dp-rte
  * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
- * Functionality: fbt, drrs, psr
+ * Functionality: fbt, drrs, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-rte
  * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
- * Functionality: fbc, fbt, drrs, psr
+ * Functionality: fbc, fbt, drrs, psr1
  *
  * arg[1].values:   1, 2
  */
@@ -99,7 +99,7 @@
  *
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -107,15 +107,15 @@
  *
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -143,7 +143,7 @@
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -153,17 +153,17 @@
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -191,7 +191,7 @@
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -201,17 +201,17 @@
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -239,7 +239,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -247,15 +247,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -283,7 +283,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -291,15 +291,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -324,7 +324,7 @@
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -334,17 +334,17 @@
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -366,7 +366,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -374,15 +374,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -411,7 +411,7 @@
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -421,17 +421,17 @@
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -457,7 +457,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -465,15 +465,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -496,7 +496,7 @@
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
@@ -506,17 +506,17 @@
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -536,7 +536,7 @@
  *
  * SUBTEST: psr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
@@ -544,15 +544,15 @@
  *
  * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  */
@@ -568,7 +568,7 @@
  *
  * SUBTEST: psr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
@@ -576,15 +576,15 @@
  *
  * SUBTEST: fbcpsr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -612,7 +612,7 @@
  * SUBTEST: psr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
@@ -622,17 +622,17 @@
  * SUBTEST: fbcpsr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -653,7 +653,7 @@
  *
  * SUBTEST: psr-slowdraw
  * Description: Sleep a little bit between drawing operations with PSR
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & DRRS
@@ -661,15 +661,15 @@
  *
  * SUBTEST: fbcpsr-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & PSR
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with PSR & DRRS
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  */
 
 /**
@@ -683,7 +683,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
@@ -691,15 +691,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -726,7 +726,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
@@ -734,15 +734,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1]:
  *
@@ -767,11 +767,11 @@
  *
  * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -792,7 +792,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
@@ -800,15 +800,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -829,7 +829,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
@@ -837,15 +837,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * arg[1]:
  *
@@ -864,7 +864,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
@@ -872,15 +872,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * arg[1].values:   1, 2
  *
@@ -901,7 +901,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
@@ -909,15 +909,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * arg[1]:
  *
@@ -936,7 +936,7 @@
  *
  * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
@@ -944,15 +944,15 @@
  *
  * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
@@ -964,7 +964,7 @@
  *
  * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: fbt, psr
+ * Functionality: fbt, psr1
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
@@ -972,15 +972,15 @@
  *
  * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbt, psr
+ * Functionality: drrs, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  *
  * arg[1].values:   1, 2
  */
@@ -996,7 +996,7 @@
  *
  * SUBTEST: psr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Functionality: fbt, psr, scaling
+ * Functionality: fbt, psr1, scaling
  *
  * SUBTEST: fbcdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
@@ -1004,15 +1004,15 @@
  *
  * SUBTEST: fbcpsr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Functionality: fbc, fbt, psr, scaling
+ * Functionality: fbc, fbt, psr1, scaling
  *
  * SUBTEST: psrdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Functionality: drrs, fbt, psr, scaling
+ * Functionality: drrs, fbt, psr1, scaling
  *
  * SUBTEST: fbcpsrdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Functionality: drrs, fbc, fbt, psr, scaling
+ * Functionality: drrs, fbc, fbt, psr1, scaling
  *
  * arg[1]:
  *
@@ -1031,7 +1031,7 @@
  *
  * SUBTEST: psr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with PSR
- * Functionality: fbt, psr, scaling
+ * Functionality: fbt, psr1, scaling
  *
  * SUBTEST: fbcdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
@@ -1039,15 +1039,15 @@
  *
  * SUBTEST: fbcpsr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
- * Functionality: fbc, fbt, psr, scaling
+ * Functionality: fbc, fbt, psr1, scaling
  *
  * SUBTEST: psrdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
- * Functionality: drrs, fbt, psr, scaling
+ * Functionality: drrs, fbt, psr1, scaling
  *
  * SUBTEST: fbcpsrdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, psr, scaling
+ * Functionality: drrs, fbc, fbt, psr1, scaling
  */
 
 /**
@@ -1061,7 +1061,7 @@
  *
  * SUBTEST: psr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of PSR
- * Functionality: fbt, psr, suspend
+ * Functionality: fbt, psr1, suspend
  *
  * SUBTEST: fbcdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
@@ -1069,15 +1069,15 @@
  *
  * SUBTEST: fbcpsr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
- * Functionality: fbc, fbt, psr, suspend
+ * Functionality: fbc, fbt, psr1, suspend
  *
  * SUBTEST: psrdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
- * Functionality: drrs, fbt, psr, suspend
+ * Functionality: drrs, fbt, psr1, suspend
  *
  * SUBTEST: fbcpsrdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, psr, suspend
+ * Functionality: drrs, fbc, fbt, psr1, suspend
  */
 
 /**
@@ -1094,7 +1094,7 @@
  * SUBTEST: psr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
+ * Functionality: fbt, kms_core, psr1
  *
  * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
@@ -1104,17 +1104,17 @@
  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
+ * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: psrdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
+ * Functionality: drrs, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Functionality: drrs, fbc, fbt, kms_core, psr1
  */
 
 /**
@@ -1128,11 +1128,11 @@
  *
  * SUBTEST: fbcpsr-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Functionality: fbc, fbt, psr
+ * Functionality: fbc, fbt, psr1
  *
  * SUBTEST: fbcpsrdrrs-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Functionality: drrs, fbc, fbt, psr
+ * Functionality: drrs, fbc, fbt, psr1
  */
 
 /**
@@ -1149,12 +1149,12 @@
  * SUBTEST: fbcpsr-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Functionality: fbc, fbt, psr, tiling
+ * Functionality: fbc, fbt, psr1, tiling
  *
  * SUBTEST: fbcpsrdrrs-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Functionality: drrs, fbc, fbt, psr, tiling
+ * Functionality: drrs, fbc, fbt, psr1, tiling
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 739ed6112..8006e54de 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -64,7 +64,7 @@
  *
  * SUBTEST: dc5-psr
  * Description: This test validates display engine entry to DC5 state while PSR is active
- * Functionality: pm_dc, psr
+ * Functionality: pm_dc, psr1
  *
  * SUBTEST: dc6-dpms
  * Description: Validate display engine entry to DC6 state while all connectors's
@@ -72,7 +72,7 @@
  *
  * SUBTEST: dc6-psr
  * Description: This test validates display engine entry to DC6 state while PSR is active
- * Functionality: pm_dc, psr
+ * Functionality: pm_dc, psr1
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index b9e95fdfe..7fe6a2c30 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -44,13 +44,13 @@
 /**
  * SUBTEST: psr_basic
  * Description: Basic check for psr if it is detecting changes made in planes
- * Functionality: psr
+ * Functionality: psr1
  *
  * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1]
  * Driver requirement: i915
- * Functionality: kms_core, plane, psr
+ * Functionality: kms_core, plane, psr1
  *
  * arg[1]:
  *
@@ -68,12 +68,12 @@
  * SUBTEST: psr_sprite_plane_move
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on sprite planes
- * Functionality: plane, psr
+ * Functionality: plane, psr1
  *
  * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Functionality: kms_core, plane, psr
+ * Functionality: kms_core, plane, psr1
  *
  * arg[1]:
  *
@@ -91,7 +91,7 @@
  * SUBTEST: psr_primary_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Functionality: kms_core, psr
+ * Functionality: kms_core, psr1
  *
  * arg[1]:
  *
@@ -103,40 +103,40 @@
  * SUBTEST: psr_dpms
  * Description: Check if psr is detecting changes when rendering operation is
  *              performed  with dpms enabled or disabled
- * Functionality: dpms, psr
+ * Functionality: dpms, psr1
  *
  * SUBTEST: psr_no_drrs
  * Description: Check if psr is detecting changes when drrs is disabled
- * Functionality: drrs, psr
+ * Functionality: drrs, psr1
  *
  * SUBTEST: psr_suspend
  * Description: Check if psr is detecting changes when plane operation
  *              is performed with suspend resume cycles
- * Functionality: psr, suspend
+ * Functionality: psr1, suspend
  *
  * SUBTEST: psr2_dpms
  * Description: Check if psr is detecting changes when rendering operation
  *              is performed  with dpms enabled or disabled
- * Functionality: dpms, psr, psr2
+ * Functionality: dpms, psr2
  *
  * SUBTEST: psr2_no_drrs
  * Description: Check if psr is detecting changes when drrs is disabled
- * Functionality: drrs, psr, psr2
+ * Functionality: drrs, psr2
  *
  * SUBTEST: psr2_suspend
  * Description: Check if psr is detecting changes when plane operation is
  *              performed with suspend resume cycles
- * Functionality: psr, psr2, suspend
+ * Functionality: psr2, suspend
  *
  * SUBTEST: psr2_basic
  * Description: Basic check for psr if it is detecting changes made in planes
- * Functionality: psr, psr2
+ * Functionality: psr2
  *
  * SUBTEST: psr2_%s_%s
  * Description: Check if psr2 is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915
- * Functionality: kms_core, plane, psr, psr2
+ * Functionality: kms_core, plane, psr2
  *
  * arg[1]:
  *
@@ -154,12 +154,12 @@
  * SUBTEST: psr2_primary_page_flip
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Functionality: plane, psr, psr2
+ * Functionality: plane, psr2
  *
  * SUBTEST: psr2_primary_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Functionality: kms_core, plane, psr, psr2
+ * Functionality: kms_core, plane, psr2
  *
  * arg[1]:
  *
@@ -171,7 +171,7 @@
  * SUBTEST: psr2_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Functionality: kms_core, plane, psr, psr2
+ * Functionality: kms_core, plane, psr2
  *
  * arg[1]:
  *
@@ -273,17 +273,17 @@
  * SUBTEST: psr_cursor_plane_move
  * Description: Check if psr is detecting the plane operations performed on
  *		cursor planes
- * Functionality: psr
+ * Functionality: psr1
  *
  * SUBTEST: psr_primary_page_flip
  * Description: Check if psr is detecting page-flipping operations performed
  *		on primary planes
- * Functionality: psr
+ * Functionality: psr1
  *
  * SUBTEST: psr_sprite_plane_onoff
  * Description: Check if psr is detecting the plane operations performed on
  *		sprite planes
- * Functionality: psr
+ * Functionality: psr1
  */
 
 enum operations {
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 28529b1f1..7aea8e8a5 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -3,7 +3,7 @@
  * TEST: kms psr stress test
  * Category: Display
  * Driver requirement: i915, xe
- * Functionality: plane, psr
+ * Functionality: plane, psr1
  * Mega feature: PSR
  * Test category: functionality test
  */
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 24c71ed22..dff667c73 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -57,12 +57,12 @@
  *
  * SUBTEST: psr1
  * Description: Make sure that we have eDP panel with PSR1 support.
- * Functionality: feature_discovery, psr1, eDP
+ * Functionality: feature_discovery, psr1, eDP_core
  * Mega feature: PSR
  *
  * SUBTEST: psr2
  * Description: Make sure that we have eDP panel with PSR2 support.
- * Functionality: feature_discovery, psr2, eDP
+ * Functionality: feature_discovery, psr2, eDP_core
  * Mega feature: PSR
  *
  * SUBTEST: dp-mst
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9691f2818..a554ca2b1 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -51,7 +51,7 @@
  * SUBTEST: inject-audio
  * Description: Make sure that audio information exposed by ALSA match the forced
  *              EDID.
- * Functionality: audio, force_connector
+ * Functionality: hdmi_audio, force_connector
  */
 
 #define HDISPLAY_4K	3840
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 4dd2eda37..99b78f7ef 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -25,7 +25,6 @@
  * Category: Display
  * Description: Test HDR metadata interfaces and bpc switch
  * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
  * Mega feature: HDR
  * Test category: functionality test
  */
@@ -39,31 +38,35 @@
 /**
  * SUBTEST: bpc-switch
  * Description: Tests switching between different display output bpc modes
+ * Functionality: colorspace
  *
  * SUBTEST: bpc-switch-dpms
  * Description: Tests switching between different display output bpc modes with dpms
- * Functionality: colorspace, dpms, hdr
+ * Functionality: colorspace, dpms
  *
  * SUBTEST: bpc-switch-suspend
  * Description: Tests switching between different display output bpc modes with suspend
- * Functionality: colorspace, hdr, suspend
+ * Functionality: colorspace, suspend
  *
  * SUBTEST: invalid-hdr
  * Description: Test to ensure HDR is not enabled on non-HDR panel
+ * Functionality: colorspace, static_hdr
  *
  * SUBTEST: invalid-metadata-sizes
  * Description: Tests invalid HDR metadata sizes
+ * Functionality: colorspace, static_hdr
  *
  * SUBTEST: static-toggle-dpms
  * Description: Tests static toggle with dpms
- * Functionality: colorspace, dpms, hdr
+ * Functionality: colorspace, dpms, static_hdr
  *
  * SUBTEST: static-toggle-suspend
  * Description: Tests static toggle with suspend
- * Functionality: colorspace, hdr, suspend
+ * Functionality: colorspace, static_hdr, suspend
  *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
+ * Functionality: colorspace, static_hdr
  *
  * arg[1]:
  *
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 4b5d9d5ab..f714ab474 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -27,7 +27,7 @@
  * Category: Display
  * Description: Test display panel fitting
  * Driver requirement: i915, xe
- * Functionality: eDP, panel_fitting, scaling
+ * Functionality: eDP_core, panel_fitting, scaling
  * Mega feature: General Display Features
  * Test category: functionality test
  */
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index add6e77c9..fae5755a8 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -29,7 +29,7 @@
  * Category: Display
  * Description: Test display scaling modes
  * Driver requirement: i915, xe
- * Functionality: eDP, plane, scaling
+ * Functionality: eDP_core, plane, scaling
  * Mega feature: General Display Features
  * Test category: functionality test
  */
-- 
2.40.0


