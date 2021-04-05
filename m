Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A440E89FE8
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Apr 2021 13:27:26 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Mon,  5 Apr 2021 18:57:21 +0530
Message-Id: <20210405132721.2806951-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: Add subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Gupta@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_flip_tiling.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 7a736fba..09e99580 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -173,6 +173,7 @@ igt_main
 	 * generated and compared to the reference one.
 	 */
 
+	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
@@ -187,6 +188,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
@@ -205,7 +207,7 @@ igt_main
 		}
 	}
 
-
+	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
@@ -232,6 +234,7 @@ igt_main
 	 * reference one.
 	 */
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_I915_FORMAT_MOD_X_TILED };
@@ -246,6 +249,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED };
@@ -264,6 +268,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
@@ -290,6 +295,7 @@ igt_main
 	 * reference one.
 	 */
 
+	igt_describe("Check pageflip from linear buffer to tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_X_TILED };
@@ -304,6 +310,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from linear buffer to tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED };
@@ -322,6 +329,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from linear buffer to tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
