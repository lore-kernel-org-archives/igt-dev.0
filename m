Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83916E18F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 11:06:36 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 15 Apr 2020 14:06:25 +0300
Message-Id: <20200415110625.24509-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gem_wait/gem_busy: Make the "all" variant a
 normal subtest
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

While dynamic subtests are kind of testlistable, the support for them
is dark and full of terrors. Cornercases like resuming or
multiple-mode are not quite fully specified and can lead to surprises
later.

The subtests in question don't carry any context so conversion to
normal subtests is straightforward.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_busy.c                 | 10 +++++-----
 tests/i915/gem_wait.c                 | 12 ++++++------
 tests/intel-ci/fast-feedback.testlist |  6 +++---
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 5e4e2d93..4e574434 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -495,12 +495,12 @@ igt_main
 			igt_fork_hang_detector(fd);
 		}
 
-		igt_subtest_with_dynamic("busy") {
-			igt_dynamic("all") {
-				gem_quiescent_gpu(fd);
-				all(fd);
-			}
+		igt_subtest("busy-all") {
+			gem_quiescent_gpu(fd);
+			all(fd);
+		}
 
+		igt_subtest_with_dynamic("busy") {
 			__for_each_physical_engine(fd, e) {
 				igt_dynamic_f("%s", e->name) {
 					gem_quiescent_gpu(fd);
diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 43b3a658..73337845 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -149,13 +149,13 @@ static void test_all_engines(const char *name, int i915, unsigned int test)
 {
 	const struct intel_execution_engine2 *e;
 
-	igt_subtest_with_dynamic(name) {
-		igt_dynamic("all") {
-			gem_quiescent_gpu(i915);
-			basic(i915, ALL_ENGINES, test);
-			gem_quiescent_gpu(i915);
-		}
+	igt_subtest_f("%s-all", name) {
+		gem_quiescent_gpu(i915);
+		basic(i915, ALL_ENGINES, test);
+		gem_quiescent_gpu(i915);
+	}
 
+	igt_subtest_with_dynamic(name) {
 		__for_each_physical_engine(i915, e) {
 			igt_dynamic_f("%s", e->name) {
 				gem_quiescent_gpu(i915);
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad438..b80ccebb 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -6,7 +6,7 @@ igt@fbdev@mmap
 igt@gem_basic@bad-close
 igt@gem_basic@create-close
 igt@gem_basic@create-fd-close
-igt@gem_busy@busy@all
+igt@gem_busy@busy-all
 igt@gem_close_race@basic-process
 igt@gem_close_race@basic-threads
 igt@gem_ctx_create@basic
@@ -41,8 +41,8 @@ igt@gem_sync@basic-each
 igt@gem_tiled_blits@basic
 igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
-igt@gem_wait@busy@all
-igt@gem_wait@wait@all
+igt@gem_wait@busy-all
+igt@gem_wait@wait-all
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
