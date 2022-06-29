Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2917C10E212
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 08:24:38 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com
Date: Wed, 29 Jun 2022 13:53:53 +0530
Message-Id: <20220629082354.3907635-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220629082354.3907635-1-janga.rahul.kumar@intel.com>
References: <20220629082354.3907635-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_fence : Add subtests
 description
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test description for below subtests:
basic-busy-all, basic-wait-all, busy-hang-all, wait-hang-all,
basic-busy, basic-wait, basic-await, nb-await.

v2 : Modified subtests description.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/i915/gem_exec_fence.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index b7ce425d..a6499a68 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -3012,8 +3012,12 @@ igt_main
 			igt_fork_hang_detector(i915);
 		}
 
+		igt_describe("Basic check for composite fence on all busy engines.");
 		igt_subtest("basic-busy-all")
 			test_fence_busy_all(i915, ctx, 0);
+
+		igt_describe("Basic check for composite fence with additional wait on all busy"
+			     " engines.");
 		igt_subtest("basic-wait-all")
 			test_fence_busy_all(i915, ctx, WAIT);
 
@@ -3022,8 +3026,13 @@ igt_main
 			hang = igt_allow_hang(i915, ctx->id, 0);
 		}
 
+		igt_describe("Check for composite fence on all busy engines with a pending gpu"
+			     " hang.");
 		igt_subtest("busy-hang-all")
 			test_fence_busy_all(i915, ctx, HANG);
+
+		igt_describe("Check for composite fence with additional wait on all busy engines"
+			     " and with a pending gpu hang.");
 		igt_subtest("wait-hang-all")
 			test_fence_busy_all(i915, ctx, WAIT | HANG);
 
@@ -3044,24 +3053,34 @@ igt_main
 				intel_allocator_multiprocess_start();
 			}
 
+			igt_describe("Basic check for explicit fence on each busy engine.");
 			igt_subtest_with_dynamic("basic-busy") {
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
 						test_fence_busy(i915, ctx, e, 0);
 				}
 			}
+
+			igt_describe("Basic check for explicit fence with additinal wait time on"
+				     " each busy engine.");
 			igt_subtest_with_dynamic("basic-wait") {
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
 						test_fence_busy(i915, ctx, e, WAIT);
 				}
 			}
+
+			igt_describe("Basic check for explicit fence with async wait on each"
+				     " engine.");
 			igt_subtest_with_dynamic("basic-await") {
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
 						test_fence_await(i915, ctx, e, 0);
 				}
 			}
+
+			igt_describe("Check for explicit fence with non-blocking wait on each"
+				     " engine.");
 			igt_subtest_with_dynamic("nb-await") {
 				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-- 
2.25.1
