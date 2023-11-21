Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E120E10E0BB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 06:15:14 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:53:19 +0530
Message-Id: <20231121062320.1860993-2-jeevan.b@intel.com>
In-Reply-To: <20231121062320.1860993-1-jeevan.b@intel.com>
References: <20231121062320.1860993-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/kms_psr2_sf: Add FBC
 support to PSR2 tests
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

For intel_display_ver 20, FBC can be enabled along with PSR/PSR2,
thereby adding FBC checks to validate this scenario.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a597c8701..f49c6dfbf 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -26,6 +26,7 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 #include "kms_dsc_helper.h"
+#include "i915/intel_fbc.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -160,6 +161,7 @@ typedef struct {
 	int test_plane_id;
 	igt_plane_t *test_plane;
 	bool big_fb_test;
+	bool fbc_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -865,6 +867,11 @@ static void run(data_t *data)
 
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
+	if (data->fbc_flag)
+		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+							  data->pipe),
+							  "FBC still disabled");
+
 	data->screen_changes = 0;
 
 	switch (data->op) {
@@ -986,6 +993,12 @@ igt_main
 
 		display_init(&data);
 
+		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd) == 20)) &&
+		    (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))) {
+			data.fbc_flag = true;
+			intel_fbc_enable(data.drm_fd);
+		}
+
 		/* Test if PSR2 can be enabled */
 		igt_require_f(psr_enable(data.drm_fd,
 					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
-- 
2.25.1
