Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DC010E03C
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 09:25:08 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Jun 2023 11:24:51 +0200
Message-Id: <20230602092451.808960-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] gem_exec_balancer: move no-GuC
 requirement to test functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_fixture inside of subtest_group will get executed even for test
outside of it. It does not influence such test execution, but misleading
warnings are printed, for example:
  ./gem_exec_balancer --r nop
  ...test output...
  Subtest nop: SUCCESS (36,896s)
  Test requirement not met in [...]gem_exec_balancer.c:3608:
  Test requirement: !gem_using_guc_submission(i915)

Such message can be printed before or after proper test output and
is confusing especially in case test fails.

v2: improved commit message

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by : Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/i915/gem_exec_balancer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 004ba9a14fe..9190fc2383f 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -1525,6 +1525,7 @@ bonded_runner(int i915,
 	 * submission across multiple engines.
 	 */
 	igt_require(gem_scheduler_has_preemption(i915));
+	igt_require(!gem_using_guc_submission(i915));
 
 	cycles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 
@@ -1996,6 +1997,7 @@ static void sliced(int i915)
 
 	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(!gem_using_guc_submission(i915));
 
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
@@ -3605,7 +3607,6 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(!gem_using_guc_submission(i915));
 			intel_allocator_multiprocess_start();
 		}
 
-- 
2.34.1
