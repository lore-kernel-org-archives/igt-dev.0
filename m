Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C625C10EA3B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 14:21:47 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 25 May 2022 16:21:34 +0200
Message-Id: <20220525142134.1015217-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_module_load: Add the "load" test
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

Add a fake test that:
- Asserts i915 and associated drivers are not yet loaded;
- Loads the i915 driver if that's not the case yet;
- Performs a small set of sanity tests to make sure the GPU is there.

The reload test now also performs the same checks.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/i915/i915_module_load.c | 52 +++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index f5f98acc..46608aa8 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -30,6 +30,7 @@
 #include <sys/ioctl.h>
 #include <fcntl.h>
 
+#include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt_debugfs.h"
 #include "igt_aux.h"
@@ -236,21 +237,54 @@ hda_dynamic_debug(bool enable)
 	fclose(fp);
 }
 
+static void load_and_check_i915(void)
+{
+	int error;
+	int drm_fd;
+
+	hda_dynamic_debug(true);
+	error = igt_i915_driver_load(NULL);
+	hda_dynamic_debug(false);
+
+	igt_assert_eq(error, 0);
+
+	/* driver is ready, check if it's bound */
+	drm_fd = __drm_open_driver(DRIVER_INTEL);
+	igt_fail_on_f(drm_fd < 0, "Cannot open the i915 DRM driver after modprobing i915.\n");
+
+	/* make sure the GPU is idle */
+	gem_quiescent_gpu(drm_fd);
+	close(drm_fd);
+
+	/* make sure we can do basic memory ops */
+	gem_sanitycheck();
+}
+
 igt_main
 {
+	igt_describe("Assert that i915 and friends are not yet loaded, then load them.");
+	igt_subtest("load") {
+		const char * unwanted_drivers[] = {
+			"i915",
+			"intel-gtt",
+			"snd_hda_intel",
+			"snd_hdmi_lpe_audio",
+			NULL
+		};
+
+		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
+			igt_abort_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
+			               "%s is already loaded!\n", unwanted_drivers[i]);
+		}
+
+		load_and_check_i915();
+	}
+
 	igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
 	igt_subtest("reload") {
-		int load_error;
-
 		igt_i915_driver_unload();
 
-		hda_dynamic_debug(true);
-		load_error = igt_i915_driver_load(NULL);
-		hda_dynamic_debug(false);
-
-		igt_assert_eq(load_error, 0);
-
-		gem_sanitycheck();
+		load_and_check_i915();
 
 		/* only default modparams, can leave module loaded */
 	}
-- 
2.36.1
