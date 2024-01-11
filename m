Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5EC10E0BE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 20:53:18 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_rmfb: Fix subtest description
Date: Thu, 11 Jan 2024 12:53:16 -0800
Message-Id: <20240111205316.1640003-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Kernel driver is responsible to do those actions. kms_rmfb is then
checking if that was true in 2 cases: a) DRM_IOCTL_MODE_RMFB was called
or b) the file descriptor was closed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/kms_rmfb.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 39e8bbd55..8a27f4fac 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -24,7 +24,7 @@
 /**
  * TEST: kms rmfb
  * Category: Display
- * Description: This tests rmfb and close-fd behavior. In these casesthe
+ * Description: This tests rmfb and close-fd behavior. In these cases the
  *              framebuffers should be removed from the crtc.
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
@@ -42,12 +42,13 @@
 
 /**
  * SUBTEST: close-fd
- * Description: RMFB is supposed to free the framebuffers from any and all planes
- *              so test this and make sure it works with fd close and reopen.
+ * Description: Kernel driver is supposed to free the framebuffers from any and all planes
+ *		when the fd is closed. Ensure that is the case by closing and re-opening
+ *		it.
  *
  * SUBTEST: rmfb-ioctl
- * Description: RMFB is supposed to free the framebuffers from any and all planes
- *              so test this and make sure it works.
+ * Description: Kernel driver is supposed to free the framebuffers from any and all planes
+ *              when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case.
  */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
@@ -57,7 +58,7 @@
 #define DRM_CAP_CURSOR_HEIGHT 0x9
 #endif
 
-IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
+IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases "
 		     "the framebuffers should be removed from the crtc.");
 
 struct rmfb_data {
@@ -198,11 +199,11 @@ igt_main
 		const char *name;
 		const char *description;
 	} tests[] = {
-		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all "
-				       "planes so test this and make sure it works."},
-		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all "
-				    "planes so test this and make sure it works with fd close "
-				    "and reopen."},
+		{ false, "rmfb-ioctl", "Kernel driver is supposed to free the framebuffers from any and all planes "
+				       "when the fd is closed. Ensure that is the case by closing and re-opening "
+				       "it" },
+		{ true, "close-fd", "Kernel driver is supposed to free the framebuffers from any and all planes "
+				    "when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case." },
 	};
 	struct rmfb_data data = {};
 	int i;
-- 
2.40.1
