Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98E2A726D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 23:57:05 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 Aug 2022 23:56:43 +0000
Message-Id: <20220822235657.280702-10-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
References: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/23] i915/perf: Use ARRAY_SIZE
 consistently for num_properties
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

Replace all variations of calculating the num_properties with
ARRAY_SIZE.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 62 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index b61dd6e2..c120c898 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -86,8 +86,6 @@ IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
 
 #define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
 
-#define NUM_PROPERTIES(p) (sizeof(p) / (2 * sizeof(uint64_t)))
-
 struct accumulator {
 #define MAX_RAW_OA_COUNTERS 62
 	enum drm_i915_oa_format format;
@@ -1069,7 +1067,7 @@ test_system_wide_paranoid(void)
 		struct drm_i915_perf_open_param param = {
 			.flags = I915_PERF_FLAG_FD_CLOEXEC |
 				I915_PERF_FLAG_FD_NONBLOCK,
-			.num_properties = sizeof(properties) / 16,
+			.num_properties = ARRAY_SIZE(properties) / 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
 
@@ -1095,7 +1093,7 @@ test_system_wide_paranoid(void)
 		struct drm_i915_perf_open_param param = {
 			.flags = I915_PERF_FLAG_FD_CLOEXEC |
 				I915_PERF_FLAG_FD_NONBLOCK,
-			.num_properties = sizeof(properties) / 16,
+			.num_properties = ARRAY_SIZE(properties) / 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
@@ -1126,7 +1124,7 @@ test_invalid_open_flags(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = ~0, /* Undefined flag bits set! */
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1148,7 +1146,7 @@ test_invalid_oa_metric_set_id(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_FD_NONBLOCK,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1182,7 +1180,7 @@ test_invalid_oa_format_id(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_FD_NONBLOCK,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1214,7 +1212,7 @@ test_missing_sample_flags(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1354,7 +1352,7 @@ open_and_read_2_oa_reports(int format_id,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1833,7 +1831,7 @@ test_invalid_oa_exponent(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -1868,7 +1866,7 @@ test_low_oa_exponent_permissions(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint64_t oa_period, oa_freq;
@@ -1931,7 +1929,7 @@ test_per_context_mode_unprivileged(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -2007,8 +2005,8 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED,
 		.num_properties = set_kernel_hrtimer ?
-				  NUM_PROPERTIES(properties) :
-				  NUM_PROPERTIES(properties) - 1,
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 1,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint8_t buf[1024 * 1024];
@@ -2167,8 +2165,8 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
 			I915_PERF_FLAG_DISABLED |
 			I915_PERF_FLAG_FD_NONBLOCK,
 		.num_properties = set_kernel_hrtimer ?
-				  NUM_PROPERTIES(properties) :
-				  NUM_PROPERTIES(properties) - 1,
+				  ARRAY_SIZE(properties) / 2 :
+				  (ARRAY_SIZE(properties) / 2) - 1,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint8_t buf[1024 * 1024];
@@ -2358,7 +2356,7 @@ static void test_polling_small_buf(void)
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED |
 			I915_PERF_FLAG_FD_NONBLOCK,
-		.num_properties = NUM_PROPERTIES(properties),
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint32_t test_duration = 80 * 1000 * 1000;
@@ -2458,7 +2456,7 @@ gen12_test_oa_tlb_invalidate(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			I915_PERF_FLAG_DISABLED,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	int num_reports1, num_reports2, num_expected_reports;
@@ -2649,7 +2647,7 @@ test_non_zero_reason(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	struct drm_i915_perf_record_header *header;
@@ -2734,7 +2732,7 @@ test_enable_disable(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			 I915_PERF_FLAG_DISABLED, /* Verify we start disabled */
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
@@ -2883,7 +2881,7 @@ test_short_reads(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	size_t record_size = 256 + sizeof(struct drm_i915_perf_record_header);
@@ -2975,7 +2973,7 @@ test_non_sampling_read_error(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	int ret;
@@ -3011,7 +3009,7 @@ test_disabled_read_error(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			 I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	uint32_t oa_report0[64];
@@ -3168,7 +3166,7 @@ test_mi_rpc(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	struct buf_ops *bops = buf_ops_create(drm_fd);
@@ -3271,7 +3269,7 @@ hsw_test_single_ctx_counters(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 
@@ -4253,7 +4251,7 @@ test_rc6_disable(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	unsigned long rc6_start, rc6_end, rc6_enabled;
@@ -4309,7 +4307,7 @@ test_stress_open_close(void)
 		struct drm_i915_perf_open_param param = {
 			.flags = I915_PERF_FLAG_FD_CLOEXEC |
 			         I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-			.num_properties = NUM_PROPERTIES(properties),
+			.num_properties = ARRAY_SIZE(properties) / 2,
 			.properties_ptr = to_user_pointer(properties),
 		};
 
@@ -4405,8 +4403,8 @@ test_global_sseu_config_invalid(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-		.num_properties = NUM_PROPERTIES(properties),
-			.properties_ptr = to_user_pointer(properties),
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
@@ -4480,8 +4478,8 @@ test_global_sseu_config(void)
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC |
 		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
-		.num_properties = NUM_PROPERTIES(properties),
-			.properties_ptr = to_user_pointer(properties),
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
@@ -4913,7 +4911,7 @@ test_i915_ref_count(void)
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
-		.num_properties = sizeof(properties) / 16,
+		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
 	unsigned baseline, ref_count0, ref_count1;
-- 
2.25.1
