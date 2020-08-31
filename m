Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD3895B2
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 14:37:54 +0000 (UTC)
From: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
Date: Mon, 31 Aug 2020 14:37:49 +0000
Message-Id: <20200831143749.6226-1-sowmyax.kaparthi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] Dropping kernel_ns check for parameterized tests
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
To: igt-dev@lists.freedesktop.org, umesh.nerlige.ramappa@intel.com, lionel.g.landwerlin@intel.com, sowmyax.kaparthi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

In this patch kernel_ns is not checked at all because the intent
of the test is to make sure we are woken up a predetermined number
of times for different values of hrtimer.

Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
---
 tests/i915/perf.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 20d0cc82..ba477f1c 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1993,7 +1993,6 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 
 	int64_t start, end;
 	int n = 0;
-	uint64_t max_expected_kernel_ns;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
@@ -2099,13 +2098,8 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 	 */
 	igt_assert(n > (min_iterations + n_extra_iterations));
 
-	if (set_kernel_hrtimer) {
-		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
-					 /(5 * 1000 * 1000);
-	} else {
-		max_expected_kernel_ns = test_duration_ns / 100;
-	}
-	igt_assert(kernel_ns <= max_expected_kernel_ns);
+	if (!set_kernel_hrtimer)
+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
 
 	__perf_close(stream_fd);
 }
@@ -2159,7 +2153,6 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
-	uint64_t max_expected_kernel_ns;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
@@ -2294,13 +2287,8 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	 */
 	igt_assert(n > (min_iterations + n_extra_iterations));
 
-	if (set_kernel_hrtimer) {
-		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
-					 /(5 * 1000 * 1000);
-	} else {
-		max_expected_kernel_ns = test_duration_ns / 100;
-	}
-	igt_assert(kernel_ns <= max_expected_kernel_ns);
+	if (!set_kernel_hrtimer)
+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
 
 	__perf_close(stream_fd);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
