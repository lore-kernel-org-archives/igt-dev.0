Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3B010E937
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 11:27:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Apr 2023 16:52:40 +0530
Message-Id: <20230419112243.1719789-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
References: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 3/6] tests/kms_flip: Add XE support
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

V2: - Minor cleanups
V3: - Don't run the test instead of SKIP

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_flip.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5e82f4a2f..e4c98b8ec 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -44,6 +44,7 @@
 
 #include "i915/gem_create.h"
 #include "igt_stats.h"
+#include "xe/xe_query.h"
 
 #define TEST_DPMS		(1 << 0)
 
@@ -1353,9 +1354,13 @@ restart:
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
 	if (o->flags & TEST_BO_TOOBIG) {
-		igt_skip_on(!is_i915_device(drm_fd));
+		igt_skip_on(!is_intel_device(drm_fd));
 		bo_size = 4*gem_mappable_aperture_size(drm_fd);
-		igt_require(bo_size < gem_global_aperture_size(drm_fd));
+
+		if (is_i915_device(drm_fd))
+			igt_require(bo_size < gem_global_aperture_size(drm_fd));
+		else
+			igt_require(bo_size < (1ULL << xe_va_bits(drm_fd)));
 	}
 
 	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
@@ -1552,14 +1557,19 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
 }
 
-static int run_test(int duration, int flags)
+static void run_test(int duration, int flags)
 {
 	struct test_output o;
 	int i, n, modes = 0;
 
-	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
+	/* No tiling support in XE. */
+	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
+		return;
+
+	igt_require((flags & TEST_HANG) == 0 ||
+		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
-		    gem_available_fences(drm_fd));
+		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
@@ -1618,17 +1628,21 @@ static int run_test(int duration, int flags)
 	}
 
 	drmModeFreeResources(resources);
-	return 1;
 }
 
-static int run_pair(int duration, int flags)
+static void run_pair(int duration, int flags)
 {
 	struct test_output o;
 	int i, j, m, n, modes = 0;
 
-	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
+	/* No tiling support in XE. */
+	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
+		return;
+
+	igt_require((flags & TEST_HANG) == 0 ||
+		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
-		    gem_available_fences(drm_fd));
+		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
@@ -1693,7 +1707,6 @@ static int run_pair(int duration, int flags)
 	}
 
 	drmModeFreeResources(resources);
-	return 1;
 }
 
 static void get_timestamp_format(void)
@@ -1813,6 +1826,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
 
+		if (is_xe_device(drm_fd))
+			xe_device_get(drm_fd);
+
 		if (is_i915_device(drm_fd)) {
 			bops = buf_ops_create(drm_fd);
 		}
@@ -1878,6 +1894,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 	igt_stop_signal_helper();
 
-	igt_fixture
+	igt_fixture {
+		if (is_xe_device(drm_fd))
+			xe_device_put(drm_fd);
+
 		close(drm_fd);
+	}
 }
-- 
2.40.0
