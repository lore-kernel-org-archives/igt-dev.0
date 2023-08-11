Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44510E6E6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:11 +0530
Message-Id: <20230811184655.157060-38-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 37/81] tests/kms_bw: Document each subtest for
 testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Fix the functionality

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_bw.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index b66473e60..cfc0e193b 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -25,6 +25,27 @@
 #include "drm.h"
 #include <stdio.h>
 #include <xf86drmMode.h>
+/**
+ * TEST: kms bw
+ * Category: Display
+ * Description: BW test with different resolutions
+ *
+ * SUBTEST: linear-tiling-%d-displays-%s
+ * Description: bw test with %arg[2]
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
+ *
+ * arg[2]:
+ *
+ * @1920x1080p:       1920x1080 resolution
+ * @2560x1440p:       2560x1440 resolution
+ * @3840x2160p:       3840x2160 resolution
+ */
 
 /* Common test data. */
 typedef struct data {
-- 
2.40.0
