Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E230D10E0D0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 06:15:20 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:53:20 +0530
Message-Id: <20231121062320.1860993-3-jeevan.b@intel.com>
In-Reply-To: <20231121062320.1860993-1-jeevan.b@intel.com>
References: <20231121062320.1860993-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/intel/kms_psr: Add FBC support to
 PSR/PSR2 tests
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
 tests/intel/kms_psr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 6b80f6f4b..88ee03ac2 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -35,6 +35,7 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+#include "i915/intel_fbc.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -376,6 +377,7 @@ typedef struct {
 	int mod_stride;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	bool fbc_flag;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -802,6 +804,11 @@ static void test_setup(data_t *data)
 			psr_entered = true;
 			break;
 		}
+
+		if (data->fbc_flag)
+			igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+								  pipe),
+								  "FBC still disabled");
 	}
 
 	igt_assert(psr_entered);
@@ -821,6 +828,7 @@ igt_main
 {
 	int z;
 	enum operations op;
+	enum pipe pipe;
 	const char *append_subtest_name[3] = {
 		"psr_",
 		"psr2_",
@@ -837,6 +845,11 @@ igt_main
 		data.bops = buf_ops_create(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
+		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd) == 20)) &&
+		    (intel_fbc_supported_on_chipset(data.drm_fd, pipe))) {
+			data.fbc_flag = true;
+			intel_fbc_enable(data.drm_fd);
+		}
 	}
 
 	for (z = 0; z < ARRAY_SIZE(modes); z++) {
-- 
2.25.1
