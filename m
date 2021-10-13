Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Wed, 13 Oct 2021 15:43:17 -0700
Message-Id: <20211013224317.943625-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] tests/i915: Skip gem_exec_fair on GuC
 based platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The gem_exec_fair test is specifically testing scheduler algorithm
performance. However, GuC does not implement the same algorithm as
execlist mode and this test is not applicable. So, until sw arch
approves a new algorithm and it is implemented in GuC, stop running
the test.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_fair.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index ef5a450f6..ca9c73c6e 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1314,6 +1314,12 @@ igt_main
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(gem_scheduler_has_ctx_priority(i915));
 
+		/*
+		 * These tests are for a specific scheduling model which is
+		 * not currently implemented by GuC. So skip on GuC platforms.
+		 */
+		igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);
+
 		cfg = intel_ctx_cfg_all_physical(i915);
 
 		igt_info("CS timestamp frequency: %d\n",
-- 
2.25.1
