Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 14 Oct 2021 12:42:38 -0700
Message-Id: <20211014194238.1078854-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] tests/i915: Skip gem_exec_fair on GuC
 based platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The gem_exec_fair test is specifically testing scheduler algorithm
performance. However, GuC does not implement the same algorithm as
execlist mode and this test is not applicable. So, until sw arch
approves a new algorithm and it is implemented in GuC, stop running
the test.

v2: Add exceptions for TGL/RKL/ADL-S - review feedback from Tvrtko.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_fair.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index ef5a450f6..fc690f438 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1302,6 +1302,8 @@ igt_main
 	int i915 = -1;
 
 	igt_fixture {
+		uint32_t devid;
+
 		igt_require_sw_sync();
 
 		i915 = drm_open_driver_master(DRIVER_INTEL);
@@ -1314,6 +1316,14 @@ igt_main
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(gem_scheduler_has_ctx_priority(i915));
 
+		/*
+		 * These tests are for a specific scheduling model which is
+		 * not currently implemented by GuC. So skip on GuC platforms.
+		 */
+		devid = intel_get_drm_devid(i915);
+		igt_require((intel_gen(devid) < 12) || IS_TIGERLAKE(devid) ||
+			    IS_ROCKETLAKE(devid) || IS_ALDERLAKE_S(devid));
+
 		cfg = intel_ctx_cfg_all_physical(i915);
 
 		igt_info("CS timestamp frequency: %d\n",
-- 
2.25.1
