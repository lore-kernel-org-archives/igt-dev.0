Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EF510E34A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 16:15:53 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 12 Oct 2022 12:15:46 -0400
Message-ID: <20221012161546.3063454-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] test/kms_plane_cursor: Honour max cursor
 size
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

Skip the tests for cursor sizes that are not supported by the hardware

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_plane_cursor.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 43bcaaa4..bd4d0016 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -30,6 +30,15 @@
  * - DRM index indicates z-ordering, higher index = higher z-order
  */
 
+#ifndef DRM_CAP_CURSOR_WIDTH
+#define DRM_CAP_CURSOR_WIDTH 0x8
+#endif
+#ifndef DRM_CAP_CURSOR_HEIGHT
+#define DRM_CAP_CURSOR_HEIGHT 0x9
+#endif
+
+static uint64_t max_curw = 64, max_curh = 64;
+
 enum {
 	TEST_PRIMARY = 0,
 	TEST_OVERLAY = 1 << 0,
@@ -222,6 +231,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	int sw, sh;
 	int pad = 128;
 
+	igt_skip_on(size > max_curw);
+
 	sw = data->mode->hdisplay;
 	sh = data->mode->vdisplay;
 
@@ -270,8 +281,16 @@ igt_main
 	};
 
 	igt_fixture {
+		int ret;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
+		igt_assert(ret == 0 || errno == EINVAL);
+		/* Not making use of cursor_height since it is same as width, still reading */
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &max_curh);
+		igt_assert(ret == 0 || errno == EINVAL);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.38.0
