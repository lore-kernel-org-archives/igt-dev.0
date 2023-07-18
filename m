Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9410E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 21:59:56 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jul 2023 03:29:50 +0530
Message-Id: <20230718215950.2557-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Lower drm log
 level to avoid exceeding disk usage limit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Set drm debug log level for DP messages and DRIVER messages to fix exceeding disk
usage limit in modeset-transition test cases.

Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---
 tests/kms_atomic_transition.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 6ab5267ca..fb719c8c9 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -25,6 +25,7 @@
 #include "igt_rand.h"
 #include "drmtest.h"
 #include "sw_sync.h"
+#include "igt_sysfs.h"
 #include <errno.h>
 #include <pthread.h>
 #include <stdbool.h>
@@ -39,6 +40,7 @@
 #ifndef DRM_CAP_CURSOR_HEIGHT
 #define DRM_CAP_CURSOR_HEIGHT 0x9
 #endif
+#define DEBUG_LEVEL "/sys/module/drm/parameters/"
 
 struct plane_parms {
 	struct igt_fb *fb;
@@ -46,7 +48,8 @@ struct plane_parms {
 };
 
 typedef struct {
-	int drm_fd;
+	int drm_fd, sysfs_fd;
+	uint32_t log_level;
 	struct igt_fb fbs[2], argb_fb, sprite_fb;
 	igt_display_t display;
 	bool extended;
@@ -965,6 +968,8 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 	int num_outputs = 0;
 	enum pipe pipe;
 
+	igt_sysfs_set_u32(data->sysfs_fd, "debug", 0xa);
+
 	for_each_pipe(&data->display, pipe) {
 		igt_output_t *output;
 
@@ -1107,6 +1112,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_display_require_output(&data.display);
 
+		igt_require((data.sysfs_fd = open(DEBUG_LEVEL, O_RDONLY)) >= 0);
+		data.log_level = igt_sysfs_get_u32(data.sysfs_fd, "debug");
+
 		for_each_connected_output(&data.display, output)
 			count++;
 	}
@@ -1181,6 +1189,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_fixture {
+		igt_sysfs_set_u32(data.sysfs_fd, "debug", data.log_level);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.34.1
