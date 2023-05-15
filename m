Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCCE10E188
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:08 +0530
Message-Id: <20230515081720.3713293-68-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 67/79] tests/kms_rmfb: Document each subtest for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_rmfb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 50df42953..6987d87bd 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -28,6 +28,30 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+/**
+ * TEST: kms rmfb
+ * Category: Display
+ * Description: This tests rmfb and close-fd behavior. In these casesthe
+ *              framebuffers should be removed from the crtc.
+ *
+ * SUBTEST: close-fd
+ * Description: RMFB is supposed to free the framebuffers from any and all planes
+ *              so test this and make sure it works with fd close and reopen.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: rmfb-ioctl
+ * Description: RMFB is supposed to free the framebuffers from any and all planes
+ *              so test this and make sure it works.
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
-- 
2.40.0
