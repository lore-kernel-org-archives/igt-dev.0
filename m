Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B26112F7B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 09:27:47 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Jul 2022 14:27:46 +0530
Message-Id: <20220706085746.32363-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Move output check to
 the beginning
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

This test is failing on headless configurations as the check to verify
if the output is present is at the end of the fixture after other checks.
Move output check to the beginning of the fixture to avoid this failure
and skip the test gracefully.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_cursor_crc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 5c90537b..51bd3c8e 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -873,6 +873,9 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
 		igt_assert(ret == 0 || errno == EINVAL);
 		/* Not making use of cursor_height since it is same as width, still reading */
@@ -882,9 +885,6 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_pipe_crc(data.drm_fd);
-
-		igt_display_require(&data.display, data.drm_fd);
-		igt_display_require_output(&data.display);
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.22.0
