Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6F210E2E2
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:15 +0530
Message-Id: <20230426114725.2244653-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 35/45] tests/kms_hdmi_inject: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_hdmi_inject.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index b6418faf0..2085d1453 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -29,6 +29,7 @@
 #include "igt.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
+#include "xe/xe_query.h"
 
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
@@ -83,7 +84,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 	struct igt_fb fb;
 	uint8_t found_4k_mode = 0;
 
-	if (is_i915_device(drm_fd)) {
+	if (is_intel_device(drm_fd)) {
 		uint32_t devid = intel_get_drm_devid(drm_fd);
 
 		/* 4K requires at least HSW */
@@ -205,6 +206,9 @@ igt_main
 		igt_require(connector);
 
 		kmstest_unset_all_crtcs(drm_fd, res);
+
+		if (is_xe_device(drm_fd))
+			xe_device_get(drm_fd);
 	}
 
 	igt_describe("Make sure that 4K modes exposed by DRM match the "
@@ -219,6 +223,10 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
+
+		if (is_xe_device(drm_fd))
+			xe_device_put(drm_fd);
+
 		close(drm_fd);
 	}
 }
-- 
2.40.0
