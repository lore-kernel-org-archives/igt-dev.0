Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0554F6E83F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 21:50:06 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Wed, 25 Mar 2020 14:50:04 -0700
Message-Id: <20200325215005.5489-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
References: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/3] tests/perf: new tests for parameterized OA
 buffer polling
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

2 new tests verifying that the OA buffer is properly checked at the
frequency specified by userspace.

v2: (Umesh)
- Capture start_times in test_polling
- Second parameterized test used a 500us hrtimer. Occassionally, this
  timing does not fall within the duration/100 requirement for the time
  spent in kernel. Change this value to 2ms to accommodate all
  platforms.

v3: (Lionel)
- Use NUM_PROPERTIES

v4: (Umesh)
- Update poll parameter name
- Update perf revision check to 5 in new tests
- Fix oa sampling rate message in igt_debug prints

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/perf.c | 144 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 106 insertions(+), 38 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 724f6f80..8f6537d6 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -234,6 +234,24 @@ get_oa_format(enum drm_i915_oa_format format)
 		return gen8_oa_formats[format];
 }
 
+static char *
+pretty_print_oa_period(uint64_t oa_period_ns)
+{
+	static char result[100];
+	static const char *units[4] = { "ns", "us", "ms", "s" };
+	double val = oa_period_ns;
+	int iter = 0;
+
+	while (iter < (ARRAY_SIZE(units) - 1) &&
+	       val >= 1000.0f) {
+		val /= 1000.0f;
+		iter++;
+	}
+
+	snprintf(result, sizeof(result), "%.3f%s", val, units[iter]);
+	return result;
+}
+
 static void
 __perf_close(int fd)
 {
@@ -1921,15 +1939,9 @@ get_time(void)
  * kernelspace.
  */
 static void
-test_blocking(void)
+test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
 {
-	/* ~40 milliseconds
-	 *
-	 * Having a period somewhat > sysconf(_SC_CLK_TCK) helps to stop
-	 * scheduling (liable to kick in when we make blocking poll()s/reads)
-	 * from interfering with the test.
-	 */
-	int oa_exponent = max_oa_exponent_for_period_lte(40000000);
+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
@@ -1939,11 +1951,16 @@ test_blocking(void)
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+		/* Kernel configuration (optional) */
+		DRM_I915_PERF_PROP_POLL_OA_PERIOD, kernel_hrtimer,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = set_kernel_hrtimer ?
+				  NUM_PROPERTIES(properties) :
+				  NUM_PROPERTIES(properties) - 1,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint8_t buf[1024 * 1024];
@@ -1965,7 +1982,7 @@ test_blocking(void)
 	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
 	 * to check for data and giving some time to read().
 	 */
-	int min_iterations = (test_duration_ns / (oa_period + 6000000ull));
+	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
 
 	int64_t start, end;
 	int n = 0;
@@ -1975,9 +1992,10 @@ test_blocking(void)
 	times(&start_times);
 
 	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d,"
-		  " estimated max iter. = %d, oa_period = %"PRIu64"ns\n",
+		  " estimated max iter. = %d, oa_period = %s\n",
 		  (int)tick_ns, test_duration_ns,
-		  min_iterations, max_iterations, oa_period);
+		  min_iterations, max_iterations,
+		  pretty_print_oa_period(oa_period));
 
 	/* In the loop we perform blocking polls while the HW is sampling at
 	 * ~25Hz, with the expectation that we spend most of our time blocked
@@ -2052,8 +2070,8 @@ test_blocking(void)
 	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
 	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
 
-	igt_debug("%d blocking reads during test with ~25Hz OA sampling (expect no more than %d)\n",
-		  n, max_iterations);
+	igt_debug("%d blocking reads during test with %lu Hz OA sampling (expect no more than %d)\n",
+		  n, NSEC_PER_SEC / oa_period, max_iterations);
 	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
 		  n_extra_iterations);
 	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
@@ -2079,15 +2097,9 @@ test_blocking(void)
 }
 
 static void
-test_polling(void)
+test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
 {
-	/* ~40 milliseconds
-	 *
-	 * Having a period somewhat > sysconf(_SC_CLK_TCK) helps to stop
-	 * scheduling (liable to kick in when we make blocking poll()s/reads)
-	 * from interfering with the test.
-	 */
-	int oa_exponent = max_oa_exponent_for_period_lte(40000000);
+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
 	uint64_t properties[] = {
 		/* Include OA reports in samples */
@@ -2097,12 +2109,17 @@ test_polling(void)
 		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+		/* Kernel configuration (optional) */
+		DRM_I915_PERF_PROP_POLL_OA_PERIOD, kernel_hrtimer,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED |
 			I915_PERF_FLAG_FD_NONBLOCK,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = set_kernel_hrtimer ?
+				  NUM_PROPERTIES(properties) :
+				  NUM_PROPERTIES(properties) - 1,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint8_t buf[1024 * 1024];
@@ -2116,15 +2133,16 @@ test_polling(void)
 	int n_extra_iterations = 0;
 
 	/* It's a bit tricky to put a lower limit here, but we expect a
-	 * relatively low latency for seeing reports, while we don't currently
-	 * give any control over this in the api.
+	 * relatively low latency for seeing reports.
 	 *
-	 * We assume a maximum latency of 6 millisecond to deliver a POLLIN and
-	 * read() after a new sample is written (46ms per iteration) considering
-	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
-	 * to check for data and giving some time to read().
+	 * We assume a maximum latency of kernel_hrtimer + some margin
+	 * to deliver a POLLIN and read() after a new sample is
+	 * written (40ms + hrtimer + margin per iteration) considering
+	 * the knowledge that that the driver uses a 200Hz hrtimer
+	 * (5ms period) to check for data and giving some time to
+	 * read().
 	 */
-	int min_iterations = (test_duration_ns / (oa_period + 6000000ull));
+	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
 
@@ -2132,8 +2150,9 @@ test_polling(void)
 
 	times(&start_times);
 
-	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d, max iter. = %d\n",
-		  (int)tick_ns, test_duration_ns,
+	igt_debug("tick length = %dns, oa period = %s, "
+		  "test duration = %"PRIu64"ns, min iter. = %d, max iter. = %d\n",
+		  (int)tick_ns, pretty_print_oa_period(oa_period), test_duration_ns,
 		  min_iterations, max_iterations);
 
 	/* In the loop we perform blocking polls while the HW is sampling at
@@ -2239,8 +2258,8 @@ test_polling(void)
 	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
 	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
 
-	igt_debug("%d blocking reads during test with ~25Hz OA sampling (expect no more than %d)\n",
-		  n, max_iterations);
+	igt_debug("%d non-blocking reads during test with %lu Hz OA sampling (expect no more than %d)\n",
+		  n, NSEC_PER_SEC / oa_period, max_iterations);
 	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
 		  n_extra_iterations);
 	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
@@ -4588,6 +4607,23 @@ test_sysctl_defaults(void)
 	igt_assert_eq(max_freq, 100000);
 }
 
+static int i915_perf_revision(int fd)
+{
+	drm_i915_getparam_t gp;
+	int value = 1, ret;
+
+	gp.param = I915_PARAM_PERF_REVISION;
+	gp.value = &value;
+	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
+	if (ret == -1) {
+		/* If the param is missing, consider version 1. */
+		igt_assert_eq(errno, EINVAL);
+		return 1;
+	}
+
+	return value;
+}
+
 igt_main
 {
 	igt_fixture {
@@ -4670,11 +4706,43 @@ igt_main
 	igt_subtest("enable-disable")
 		test_enable_disable();
 
-	igt_subtest("blocking")
-		test_blocking();
+	igt_describe("Test blocking read with default hrtimer frequency");
+	igt_subtest("blocking") {
+		test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
+			      false /* set_kernel_hrtimer */,
+			      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */);
+	}
+
+	igt_describe("Test blocking read with different hrtimer frequencies");
+	igt_subtest("blocking-parameterized") {
+		igt_require(i915_perf_revision(drm_fd) >= 5);
+
+		test_blocking(10 * 1000 * 1000 /* 10ms oa period */,
+			      true /* set_kernel_hrtimer */,
+			      40 * 1000 * 1000 /* default 40ms hrtimer */);
+		test_blocking(500 * 1000 /* 500us oa period */,
+			      true /* set_kernel_hrtimer */,
+			      2 * 1000 * 1000 /* default 2ms hrtimer */);
+	}
 
-	igt_subtest("polling")
-		test_polling();
+	igt_describe("Test polled read with default hrtimer frequency");
+	igt_subtest("polling") {
+		test_polling(40 * 1000 * 1000 /* 40ms oa period */,
+			     false /* set_kernel_hrtimer */,
+			     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */);
+	}
+
+	igt_describe("Test polled read with different hrtimer frequencies");
+	igt_subtest("polling-parameterized") {
+		igt_require(i915_perf_revision(drm_fd) >= 5);
+
+		test_polling(10 * 1000 * 1000 /* 10ms oa period */,
+			     true /* set_kernel_hrtimer */,
+			     40 * 1000 * 1000 /* default 40ms hrtimer */);
+		test_polling(500 * 1000 /* 500us oa period */,
+			     true /* set_kernel_hrtimer */,
+			     2 * 1000 * 1000 /* default 2ms hrtimer */);
+	}
 
 	igt_subtest("short-reads")
 		test_short_reads();
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
