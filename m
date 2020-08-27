Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38706EB4F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 16:52:40 +0000 (UTC)
From: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
Date: Thu, 27 Aug 2020 16:52:27 +0000
Message-Id: <20200827165227.17914-1-sowmyax.kaparthi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] Fixing the latency of hrtimer
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

This test undergoes sanity check that we are not spending more than
1/100th of the time awake in the kernel. The right thing would be to
adjust that value by the number of expected wakeups. We expect the
kernel time not to exceed 1/100th of the total test duration at the
default hrtimer of 200Hz/every5ms. Scale that by the provided hrtimer if
applicable.

Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
---
 tests/i915/perf.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index a894fd38..20d0cc82 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1993,6 +1993,7 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 
 	int64_t start, end;
 	int n = 0;
+	uint64_t max_expected_kernel_ns;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
@@ -2098,7 +2099,13 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 	 */
 	igt_assert(n > (min_iterations + n_extra_iterations));
 
-	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
+	if (set_kernel_hrtimer) {
+		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
+					 /(5 * 1000 * 1000);
+	} else {
+		max_expected_kernel_ns = test_duration_ns / 100;
+	}
+	igt_assert(kernel_ns <= max_expected_kernel_ns);
 
 	__perf_close(stream_fd);
 }
@@ -2152,6 +2159,7 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
+	uint64_t max_expected_kernel_ns;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
@@ -2286,7 +2294,13 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 	 */
 	igt_assert(n > (min_iterations + n_extra_iterations));
 
-	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
+	if (set_kernel_hrtimer) {
+		max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100)
+					 /(5 * 1000 * 1000);
+	} else {
+		max_expected_kernel_ns = test_duration_ns / 100;
+	}
+	igt_assert(kernel_ns <= max_expected_kernel_ns);
 
 	__perf_close(stream_fd);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
