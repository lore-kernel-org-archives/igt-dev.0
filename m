Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4217610E0A7
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:02 -0700
Message-ID: <20230808010017.37819-6-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/20] tests/i915/perf: Track variables
 across i915 and xe
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

Create "struct i915_xe" which will contain those perf variables which have
different values between i915 and xe. Current the struct has sysctl paths
which are '"/proc/sys/dev/i915' for i915 and '/proc/sys/dev/xe' for xe. The
structure is expected to have more fields as xe uapi diverges from i915.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 67 +++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 3565d61cc393..6ab371857847 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -45,6 +45,8 @@
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "drm.h"
+#include "xe/xe_query.h"
+
 /**
  * TEST: perf
  * Description: Test the i915 perf metrics streaming interface
@@ -419,6 +421,12 @@ static struct oa_format mtl_oa_formats[I915_OA_FORMAT_MAX] = {
 		.report_hdr_64bit = true, },
 };
 
+/* Track variables which have different values between i915 and xe */
+static struct i915_xe {
+	char sysctl_path_paranoid[80];
+	char sysctl_path_max_sample_rate[80];
+} i9xe;
+
 static bool hsw_undefined_a_counters[45] = {
 	[4] = true,
 	[6] = true,
@@ -1416,7 +1424,7 @@ test_system_wide_paranoid(void)
 			.properties_ptr = to_user_pointer(properties),
 		};
 
-		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+		write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 		igt_drop_root();
 
@@ -1441,7 +1449,7 @@ test_system_wide_paranoid(void)
 			.num_properties = ARRAY_SIZE(properties) / 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
-		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
+		write_u64_file(i9xe.sysctl_path_paranoid, 0);
 
 		igt_drop_root();
 
@@ -1452,7 +1460,7 @@ test_system_wide_paranoid(void)
 	igt_waitchildren();
 
 	/* leave in paranoid state */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 }
 
 static void
@@ -2287,7 +2295,7 @@ test_invalid_oa_exponent(void)
 static void
 test_low_oa_exponent_permissions(void)
 {
-	int max_freq = read_u64_file("/proc/sys/dev/i915/oa_max_sample_rate");
+	int max_freq = read_u64_file(i9xe.sysctl_path_max_sample_rate);
 	int bad_exponent = max_oa_exponent_for_freq_gt(max_freq);
 	int ok_exponent = bad_exponent + 1;
 	uint64_t properties[] = {
@@ -2309,7 +2317,7 @@ test_low_oa_exponent_permissions(void)
 	igt_assert_eq(max_freq, 100000);
 
 	/* Avoid EACCES errors opening a stream without CAP_SYS_ADMIN */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
+	write_u64_file(i9xe.sysctl_path_paranoid, 0);
 
 	igt_fork(child, 1) {
 		igt_drop_root();
@@ -2332,7 +2340,7 @@ test_low_oa_exponent_permissions(void)
 
 	oa_period = timebase_scale(2 << ok_exponent);
 	oa_freq = NSEC_PER_SEC / oa_period;
-	write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", oa_freq - 100);
+	write_u64_file(i9xe.sysctl_path_max_sample_rate, oa_freq - 100);
 
 	igt_fork(child, 1) {
 		igt_drop_root();
@@ -2343,8 +2351,8 @@ test_low_oa_exponent_permissions(void)
 	igt_waitchildren();
 
 	/* restore the defaults */
-	write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_max_sample_rate, 100000);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 }
 
 static void
@@ -2369,7 +2377,7 @@ test_per_context_mode_unprivileged(void)
 	};
 
 	/* should be default, but just to be sure... */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	igt_fork(child, 1) {
 		uint32_t ctx_id = 0xffffffff; /* invalid id */
@@ -3567,7 +3575,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	struct oa_format format = get_oa_format(fmt);
 
 	/* Ensure perf_stream_paranoid is set to 1 by default */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	bops = buf_ops_create(drm_fd);
 	ctx_id = gem_context_create(drm_fd);
@@ -3749,7 +3757,7 @@ hsw_test_single_ctx_counters(void)
 	};
 
 	/* should be default, but just to be sure... */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	igt_fork(child, 1) {
 		struct buf_ops *bops;
@@ -3988,7 +3996,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 	struct igt_helper_process child = {};
 
 	/* should be default, but just to be sure... */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	do {
 
@@ -4694,7 +4702,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(const struct intel_executio
 	struct igt_helper_process child = {};
 
 	/* Ensure perf_stream_paranoid is set to 1 by default */
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	do {
 		igt_fork_helper(&child) {
@@ -5010,7 +5018,7 @@ test_global_sseu_config(const intel_ctx_t *ctx, const struct intel_execution_eng
 
 	igt_require(__builtin_popcount(default_sseu.subslice_mask) > 1);
 
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
+	write_u64_file(i9xe.sysctl_path_paranoid, 0);
 
 	sseu_param = make_valid_reduced_sseu_config(default_sseu,
 						    e->class,
@@ -5027,7 +5035,7 @@ test_global_sseu_config(const intel_ctx_t *ctx, const struct intel_execution_eng
 
 	igt_waitchildren();
 
-	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+	write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 	stream_fd = __perf_open(drm_fd, &param, false);
 	__perf_close(stream_fd);
@@ -5509,8 +5517,8 @@ test_i915_ref_count(void)
 static void
 test_sysctl_defaults(void)
 {
-	int paranoid = read_u64_file("/proc/sys/dev/i915/perf_stream_paranoid");
-	int max_freq = read_u64_file("/proc/sys/dev/i915/oa_max_sample_rate");
+	int paranoid = read_u64_file(i9xe.sysctl_path_paranoid);
+	int max_freq = read_u64_file(i9xe.sysctl_path_max_sample_rate);
 
 	igt_assert_eq(paranoid, 1);
 	igt_assert_eq(max_freq, 100000);
@@ -5912,9 +5920,9 @@ igt_main
 		 */
 		drm_load_module(DRIVER_INTEL);
 
-		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
+		igt_require(stat(i9xe.sysctl_path_paranoid, &sb)
 			    == 0);
-		igt_require(stat("/proc/sys/dev/i915/oa_max_sample_rate", &sb)
+		igt_require(stat(i9xe.sysctl_path_max_sample_rate, &sb)
 			    == 0);
 	}
 
@@ -5931,8 +5939,17 @@ igt_main
 		igt_assert_eq(drm_fd, -1);
 
 		/* Avoid the normal exithandler, our perf-fd interferes */
-		drm_fd = __drm_open_driver(DRIVER_INTEL);
-		igt_require_gem(drm_fd);
+		drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+		igt_require(is_intel_device(drm_fd));
+		if (is_xe_device(drm_fd)) {
+			xe_device_get(drm_fd);
+			sprintf(i9xe.sysctl_path_paranoid, "/proc/sys/dev/xe/perf_stream_paranoid");
+			sprintf(i9xe.sysctl_path_max_sample_rate, "/proc/sys/dev/xe/oa_max_sample_rate");
+		} else {
+			igt_require_gem(drm_fd);
+			sprintf(i9xe.sysctl_path_paranoid, "/proc/sys/dev/i915/perf_stream_paranoid");
+			sprintf(i9xe.sysctl_path_max_sample_rate, "/proc/sys/dev/i915/oa_max_sample_rate");
+		}
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = perf_sysfs_open(drm_fd);
@@ -5941,8 +5958,8 @@ igt_main
 
 		ctx = intel_ctx_create_all_physical(drm_fd);
 		set_default_engine(ctx);
-		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
-		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
+		write_u64_file(i9xe.sysctl_path_paranoid, 1);
+		write_u64_file(i9xe.sysctl_path_max_sample_rate, 100000);
 
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
 		perf_oa_groups = get_engine_groups(drm_fd, &num_perf_oa_groups);
@@ -6184,8 +6201,8 @@ igt_main
 
 	igt_fixture {
 		/* leave sysctl options in their default state... */
-		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
-		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+		write_u64_file(i9xe.sysctl_path_max_sample_rate, 100000);
+		write_u64_file(i9xe.sysctl_path_paranoid, 1);
 
 		if (intel_perf)
 			intel_perf_free(intel_perf);
-- 
2.41.0
