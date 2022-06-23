Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3489F11A059
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 09:33:23 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Thu, 23 Jun 2022 15:02:10 +0530
Message-Id: <20220623093210.1345241-2-sinjan.kumar@intel.com>
In-Reply-To: <20220623093210.1345241-1-sinjan.kumar@intel.com>
References: <20220623093210.1345241-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/1] tests/i915/gem_busy : Added subtests
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

From: Sinjan Kumar <sinjan.kumar@intel.com>

Added subtest description to gem_busy tests

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_busy.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 603691f2..63028069 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -447,6 +447,7 @@ igt_main
 			igt_fork_hang_detector(fd);
 		}
 
+		igt_describe("Basic test to check busyness of each engine.");
 		igt_subtest_with_dynamic("busy") {
 			igt_dynamic("all") {
 				gem_quiescent_gpu(fd);
@@ -461,6 +462,8 @@ igt_main
 			}
 		}
 
+		igt_describe("Test to check race condition by randomly closing "
+			     "the handle using gem_close.");
 		igt_subtest("close-race")
 			close_race(fd, ctx);
 
@@ -482,12 +485,17 @@ igt_main
 				gem_require_mmap_device_coherent(fd);
 			}
 
+			igt_describe("Extended test to check busyness of "
+				     "dwstore-capable engines.");
 			test_each_engine_store("extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, 0);
 				gem_quiescent_gpu(fd);
 			}
 
+			igt_describe("Extended test to check busyness of engine "
+				     "busyness of dwstore-capable engines while "
+				     "doing parallel execution.");
 			test_each_engine_store("parallel", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, PARALLEL);
@@ -501,6 +509,9 @@ igt_main
 				igt_require(has_semaphores(fd));
 			}
 
+		igt_describe("Test to check busyness of engine on submitting "
+			     "a new batch while engine is busy in executing "
+			     "previous batch.");
 			test_each_engine("semaphore", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				semaphore(fd, ctx, e);
@@ -520,6 +531,8 @@ igt_main
 			hang = igt_allow_hang(fd, ctx->id, 0);
 		}
 
+		igt_describe("Basic test to check hang state beahaviour of "
+			     "engine with increased timeout.");
 		test_each_engine("hang", fd, ctx, e) {
 			gem_quiescent_gpu(fd);
 			basic(fd, ctx, e, HANG);
@@ -532,6 +545,9 @@ igt_main
 				gem_require_mmap_device_coherent(fd);
 			}
 
+			igt_describe("Extended test to check hang state "
+				     "behaviour of dwstore-capable engines "
+				     " with increased timeout.");
 			test_each_engine_store("hang-extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, HANG);
-- 
2.25.1
