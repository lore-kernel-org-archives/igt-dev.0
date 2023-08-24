Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE48010E486
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 05:49:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 11:11:10 +0530
Message-Id: <20230824054123.820518-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
References: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 03/16] tests/kms_getfb: Extended ccs tests to
 support XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for ccs tests work on XE driver.

V2: - Update XE blocklist
V3: - New patch for blocklist changes

Fixes: 5fd20e72a (tests/kms_getfb: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_getfb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index f90e51d64..6ee58caab 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -48,6 +48,7 @@
 #include "i915/gem_create.h"
 #include "igt_device.h"
 #include "xe/xe_query.h"
+#include "xe/xe_ioctl.h"
 
 IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
 
@@ -145,7 +146,10 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
 	}
 
-	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
+	if (is_i915_device(fd))
+		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
+	else
+		add.handles[0] = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
 	igt_require(add.handles[0] != 0);
 
 	if (!HAS_FLATCCS(devid))
@@ -315,7 +319,7 @@ static void test_duplicate_handles(int fd)
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
 
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
 			      "skip because flat ccs has only one buffer.\n");
 
@@ -421,7 +425,7 @@ static void test_getfb2(int fd)
 		struct drm_mode_fb_cmd2 get = { };
 		int i;
 
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		get_ccs_fb(fd, &add_ccs);
 		igt_require(add_ccs.fb_id != 0);
 		get.fb_id = add_ccs.fb_id;
-- 
2.40.0
