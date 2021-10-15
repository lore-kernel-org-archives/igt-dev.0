Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri, 15 Oct 2021 14:54:34 -0700
Message-Id: <20211015215434.2036919-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 i-g-t] tests/i915: Skip gem_exec_fair on GuC
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
v3: Use the somewhat suspect submission test helpers instead - review
feedback from Ashutosh.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_fair.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index ef5a450f6..5cbb48f5a 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1314,6 +1314,12 @@ igt_main
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(gem_scheduler_has_ctx_priority(i915));
 
+		/*
+		 * These tests are for a specific scheduling model which is
+		 * not currently implemented by GuC. So skip on GuC platforms.
+		 */
+		igt_require(!gem_has_guc_submission(i915));
+
 		cfg = intel_ctx_cfg_all_physical(i915);
 
 		igt_info("CS timestamp frequency: %d\n",
-- 
2.25.1
