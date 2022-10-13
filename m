Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A679D10E8CE
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:56:25 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Oct 2022 11:56:20 -0400
Message-ID: <20221013155620.3640321-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3] test/kms_plane_cursor: Honour max cursor
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

Changes in v2
=============

* Remove the duplicate definitions for DRM cursor width capability
* Check for both cursor width and height when verifying the test cursor size

Changes in v3
=============

* Add variables to hold max cursor size to the global data_t struct
* Remove stale comment from v1

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_plane_cursor.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 43bcaaa4..96036213 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -30,6 +30,7 @@
  * - DRM index indicates z-ordering, higher index = higher z-order
  */
 
+
 enum {
 	TEST_PRIMARY = 0,
 	TEST_OVERLAY = 1 << 0,
@@ -64,6 +65,8 @@ typedef struct data {
 	enum pipe pipe_id;
 	int drm_fd;
 	rect_t or;
+	uint64_t max_curw;
+	uint64_t max_curh;
 } data_t;
 
 /* Common test setup. */
@@ -222,6 +225,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	int sw, sh;
 	int pad = 128;
 
+	igt_skip_on((size > data->max_curw) || (size > data->max_curh));
+
 	sw = data->mode->hdisplay;
 	sh = data->mode->vdisplay;
 
@@ -270,8 +275,15 @@ igt_main
 	};
 
 	igt_fixture {
+		int ret;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
+		igt_assert(ret == 0 || errno == EINVAL);
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &data.max_curh);
+		igt_assert(ret == 0 || errno == EINVAL);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.38.0
