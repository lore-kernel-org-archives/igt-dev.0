Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49E210F017
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 03:59:07 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Thu, 16 Jun 2022 09:28:20 +0530
Message-Id: <20220616035821.880966-2-sinjan.kumar@intel.com>
In-Reply-To: <20220616035821.880966-1-sinjan.kumar@intel.com>
References: <20220616035821.880966-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_busy : Added subtests
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

added subtest description to gem_busy tests

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_busy.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 603691f2..7a4c5c50 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -447,6 +447,8 @@ igt_main
 			igt_fork_hang_detector(fd);
 		}
 
+		igt_describe("Basic test to check busyness of each engine "
+			     "context in parallel");
 		igt_subtest_with_dynamic("busy") {
 			igt_dynamic("all") {
 				gem_quiescent_gpu(fd);
@@ -461,6 +463,8 @@ igt_main
 			}
 		}
 
+		igt_describe("Test to check race condition by randomly closing "
+			     "the handle using gem_close");
 		igt_subtest("close-race")
 			close_race(fd, ctx);
 
@@ -482,12 +486,17 @@ igt_main
 				gem_require_mmap_device_coherent(fd);
 			}
 
+			igt_describe("Extended test to check busyness of engine "
+				     "classes [Read/Write]");
 			test_each_engine_store("extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, 0);
 				gem_quiescent_gpu(fd);
 			}
 
+			igt_describe("Extended test to check busyness of engine "
+				     "classes [Read/Write] while doing parallel "
+				     "execution");
 			test_each_engine_store("parallel", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, PARALLEL);
@@ -501,6 +510,9 @@ igt_main
 				igt_require(has_semaphores(fd));
 			}
 
+		igt_describe("Test to check wait signal mechanism by submitting "
+			     "a new batch when engine is busy in executing "
+			     "previous batch");
 			test_each_engine("semaphore", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				semaphore(fd, ctx, e);
@@ -520,6 +532,9 @@ igt_main
 			hang = igt_allow_hang(fd, ctx->id, 0);
 		}
 
+		igt_describe("Basic test to check hang state beahaviour of "
+			     "engine by checking task completion with "
+			     "increased timeout");
 		test_each_engine("hang", fd, ctx, e) {
 			gem_quiescent_gpu(fd);
 			basic(fd, ctx, e, HANG);
@@ -532,6 +547,10 @@ igt_main
 				gem_require_mmap_device_coherent(fd);
 			}
 
+			igt_describe("Extended test to check hang state "
+				     "behaviour of engine class [Read/Write] "
+				     "by checking task completion with "
+				     "increased timeout");
 			test_each_engine_store("hang-extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
 				one(fd, ctx, e, HANG);
-- 
2.25.1
