Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 11:06:40 -0700
Message-Id: <20230314180640.2275192-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915_pm_rps: Enable waitboost tests for SLPC
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

Waitboost is supported with SLPC. Re-enable the tests so
we have coverage.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_rps.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index 4865ed1f..d4ee2d58 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -939,30 +939,22 @@ igt_main
 
 	/* Checks if we achieve boost using gem_wait */
 	igt_subtest("waitboost") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		waitboost(drm_fd, false);
 	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
 	igt_subtest("fence-order") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		fence_order(drm_fd);
 	}
 
 	igt_describe("Check if context reuse does not affect waitboosting");
 	igt_subtest("engine-order") {
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		engine_order(drm_fd);
 	}
 
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang;
-		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
-			      "This subtest is not supported when SLPC is enabled\n");
 		hang = igt_allow_hang(drm_fd, 0, 0);
 		waitboost(drm_fd, true);
 		igt_disallow_hang(drm_fd, hang);
-- 
2.38.1
