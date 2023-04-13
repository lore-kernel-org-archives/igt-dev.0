Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0FB10E8B9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 16:32:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 21:57:30 +0530
Message-Id: <20230413162732.1155058-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 5/7] tests/kms_flip: Add XE support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5e82f4a2f84..5f5e84ba27c 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -44,6 +44,7 @@
 
 #include "i915/gem_create.h"
 #include "igt_stats.h"
+#include "xe/xe_query.h"
 
 #define TEST_DPMS		(1 << 0)
 
@@ -792,7 +793,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 
 	memset(&hang, 0, sizeof(hang));
 	if (do_flip && (o->flags & TEST_HANG)) {
-		igt_require_intel(drm_fd);
+		igt_require_i915(drm_fd);
+		/* TODO: Add XE support? */
 		ahnd = get_reloc_ahnd(drm_fd, 0);
 		hang = hang_gpu(drm_fd, ahnd);
 	}
@@ -1347,15 +1349,21 @@ restart:
 		o->fb_width *= 2;
 
 	modifier = DRM_FORMAT_MOD_LINEAR;
-	if (o->flags & TEST_FENCE_STRESS)
+	if (o->flags & TEST_FENCE_STRESS) {
+		igt_skip_on(!is_i915_device(drm_fd));
 		modifier = I915_FORMAT_MOD_X_TILED;
+	}
 
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
@@ -1557,9 +1565,10 @@ static int run_test(int duration, int flags)
 	struct test_output o;
 	int i, n, modes = 0;
 
-	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
+	igt_require((flags & TEST_HANG) == 0 ||
+		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
-		    gem_available_fences(drm_fd));
+		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
@@ -1626,9 +1635,10 @@ static int run_pair(int duration, int flags)
 	struct test_output o;
 	int i, j, m, n, modes = 0;
 
-	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
+	igt_require((flags & TEST_HANG) == 0 ||
+		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
-		    gem_available_fences(drm_fd));
+		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
@@ -1813,6 +1823,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
 
+		if (is_xe_device(drm_fd))
+			xe_device_get(drm_fd);
+
 		if (is_i915_device(drm_fd)) {
 			bops = buf_ops_create(drm_fd);
 		}
@@ -1878,6 +1891,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
