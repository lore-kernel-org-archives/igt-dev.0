Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B0910E37E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 20:02:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 01:24:43 +0530
Message-Id: <20230807195500.4103092-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
References: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 03/20] tests/kms_getfb: Extended ccs tests to
 support XE
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

Add support for ccs tests work on XE driver.

V2: - Update XE blocklist

Fixes: 5fd20e72a (tests/kms_getfb: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt |  1 -
 tests/kms_getfb.c               | 10 +++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 1778e91f1..805939507 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -78,7 +78,6 @@ igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
 igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
-igt@kms_getfb@.*-ccs
 igt@kms_plane_lowres@tiling-(4|x|y|yf)
 igt@kms_.*@.*hang.*
 ##################################################################
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index afcf07fe8..7ffa056f5 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -43,6 +43,7 @@
 #include "i915/gem_create.h"
 #include "igt_device.h"
 #include "xe/xe_query.h"
+#include "xe/xe_ioctl.h"
 
 IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
 
@@ -140,7 +141,10 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
 	}
 
-	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
+	if (is_i915_device(fd))
+		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
+	else
+		add.handles[0] = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
 	igt_require(add.handles[0] != 0);
 
 	if (!HAS_FLATCCS(devid))
@@ -270,7 +274,7 @@ static void test_duplicate_handles(int fd)
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
 
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
 			      "skip because flat ccs has only one buffer.\n");
 
@@ -345,7 +349,7 @@ static void test_getfb2(int fd)
 		struct drm_mode_fb_cmd2 get = { };
 		int i;
 
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		get_ccs_fb(fd, &add_ccs);
 		igt_require(add_ccs.fb_id != 0);
 		get.fb_id = add_ccs.fb_id;
-- 
2.40.0
