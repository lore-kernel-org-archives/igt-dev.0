Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D310E0BB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 12:09:49 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Mar 2023 13:09:05 +0100
Message-Id: <20230301120905.1019314-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exercise_blt: Don't allow hangs
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

Hangs in this test are undesirable, so don't allow them.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_exercise_blt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
index 02c54f85..fb11fb92 100644
--- a/tests/i915/gem_exercise_blt.c
+++ b/tests/i915/gem_exercise_blt.c
@@ -353,7 +353,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	struct igt_collection *set;
 	const intel_ctx_t *ctx;
 	int i915;
-	igt_hang_t hang;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -369,7 +368,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					    I915_SYSTEM_MEMORY,
 					    I915_DEVICE_MEMORY);
 		ctx = intel_ctx_create_all_physical(i915);
-		hang = igt_allow_hang(i915, ctx->id, 0);
 	}
 
 	igt_describe("Check fast-copy blit");
@@ -383,7 +381,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		igt_disallow_hang(i915, hang);
 		close(i915);
 	}
 }
-- 
2.25.1
