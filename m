Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E4B10E8B3
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 14:27:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 19:46:57 +0530
Message-Id: <20231201141703.3013801-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 1/7] tests/kms_vrr: Use lib helper to print
 connector modes
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

Instead of writing a new logic at test level, use library helper
to print connector modes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 13b347631..a9098597b 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -65,13 +65,6 @@
  */
 #define TEST_DURATION_NS (5000000000ull)
 
-#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
-#define DRM_MODE_ARG(m) \
-	(m)->name, (m)->vrefresh, (m)->clock, \
-	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
-	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
-	(m)->type, (m)->flags
-
 enum {
 	TEST_BASIC = 1 << 0,
 	TEST_DPMS = 1 << 1,
@@ -162,14 +155,16 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
 	drmModeConnectorPtr connector = output->config.connector;
 	drmModeModeInfo mode = *igt_output_get_mode(output);
 
-	igt_debug("Default Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
+	igt_info("Default Mode: ");
+	kmstest_dump_mode(&mode);
 
 	for (i = 0; i < connector->count_modes; i++)
 		if (connector->modes[i].vrefresh > mode.vrefresh &&
 		    connector->modes[i].vrefresh <= vrr_max)
 			mode = connector->modes[i];
 
-	igt_debug("Override Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
+	igt_info("Override Mode: ");
+	kmstest_dump_mode(&mode);
 
 	return mode;
 }
-- 
2.40.0
