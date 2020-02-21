Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40D6E2C0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 13:41:40 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 21 Feb 2020 15:41:34 +0200
Message-Id: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: reuse the new i915-perf library
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
List-ID: <igt-dev@lists.freedesktop.org>

Now that most configs are stored inside IGT along with their uuid, we
can just source the correct one for that internal library.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/Makefile.am |   1 +
 tests/meson.build |   8 +-
 tests/perf.c      | 291 +++++++++++++++++-----------------------------
 3 files changed, 112 insertions(+), 188 deletions(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 87ffec2e..8219e79b 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -130,6 +130,7 @@ prime_self_import_CFLAGS = $(AM_CFLAGS) $(THREAD_CFLAGS)
 prime_self_import_LDADD = $(LDADD) -lpthread
 gem_userptr_blits_CFLAGS = $(AM_CFLAGS) $(THREAD_CFLAGS)
 gem_userptr_blits_LDADD = $(LDADD) -lpthread
+perf_LDADD = $(LDADD) $(top_builddir)/lib/libi915_perf.la
 perf_pmu_LDADD = $(LDADD) $(top_builddir)/lib/libigt_perf.la
 sw_sync_LDADD = $(LDADD) -latomic
 
diff --git a/tests/meson.build b/tests/meson.build
index fa0103e3..d945ca92 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -73,7 +73,6 @@ test_progs = [
 	'panfrost_gem_new',
 	'panfrost_prime',
 	'panfrost_submit',
-	'perf',
 	'prime_busy',
 	'prime_mmap',
 	'prime_mmap_coherency',
@@ -338,6 +337,13 @@ test_executables += executable('perf_pmu', 'perf_pmu.c',
 	   install : true)
 test_list += 'perf_pmu'
 
+test_executables += executable('perf', 'perf.c',
+	   dependencies : test_deps + [ lib_igt_i915_perf ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'perf'
+
 executable('testdisplay', ['testdisplay.c', 'testdisplay_hotplug.c'],
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
diff --git a/tests/perf.c b/tests/perf.c
index aa9a0085..4c77f558 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -40,6 +40,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "i915/perf.h"
 #include "drm.h"
 
 IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
@@ -194,13 +195,10 @@ static int sysfs = -1;
 static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
-static int n_eus;
 
-static uint64_t test_metric_set_id = UINT64_MAX;
-
-static uint64_t timestamp_frequency = 12500000;
 static uint64_t gt_max_freq_mhz = 0;
-static enum drm_i915_oa_format test_oa_format;
+static struct intel_perf *intel_perf = NULL;
+static struct intel_perf_metric_set *test_set = NULL;
 static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
 
@@ -389,7 +387,7 @@ gen8_read_report_reason(const uint32_t *report)
 static uint64_t
 timebase_scale(uint32_t u32_delta)
 {
-	return ((uint64_t)u32_delta * NSEC_PER_SEC) / timestamp_frequency;
+	return ((uint64_t)u32_delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
 }
 
 /* Returns: the largest OA exponent that will still result in a sampling period
@@ -429,7 +427,7 @@ max_oa_exponent_for_freq_gt(uint64_t frequency)
 static uint64_t
 oa_exponent_to_ns(int exponent)
 {
-       return 1000000000ULL * (2ULL << exponent) / timestamp_frequency;
+       return 1000000000ULL * (2ULL << exponent) / intel_perf->devinfo.timestamp_frequency;
 }
 
 static bool
@@ -580,7 +578,7 @@ hsw_sanity_check_render_basic_reports(uint32_t *oa_report0, uint32_t *oa_report1
 	 *
 	 * Sanity check that no counters exceed this delta.
 	 */
-	max_delta = clock_delta * n_eus;
+	max_delta = clock_delta * intel_perf->devinfo.n_eus;
 
 	/* 40bit A counters were only introduced for Gen8+ */
 	igt_assert_eq(format.n_a40, 0);
@@ -770,7 +768,7 @@ gen8_sanity_check_test_oa_reports(uint32_t *oa_report0, uint32_t *oa_report1,
 
 	igt_debug("clock delta = %"PRIu32"\n", clock_delta);
 
-	max_delta = clock_delta * n_eus;
+	max_delta = clock_delta * intel_perf->devinfo.n_eus;
 
 	/* Gen8+ has some 40bit A counters... */
 	for (int j = 0; j < format.n_a40; j++) {
@@ -854,142 +852,58 @@ gen8_sanity_check_test_oa_reports(uint32_t *oa_report0, uint32_t *oa_report1,
 	}
 }
 
-static uint64_t
-get_cs_timestamp_frequency(void)
-{
-	int cs_ts_freq = 0;
-	drm_i915_getparam_t gp;
-
-	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
-	gp.value = &cs_ts_freq;
-	if (igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
-		return cs_ts_freq;
-
-	igt_debug("Couldn't query CS timestamp frequency, trying to guess based on PCI-id\n");
-
-	if (IS_GEN7(devid) || IS_GEN8(devid))
-		return 12500000;
-	if (IS_SKYLAKE(devid) || IS_KABYLAKE(devid) || IS_COFFEELAKE(devid))
-		return 12000000;
-	if (IS_BROXTON(devid) || IS_GEMINILAKE(devid))
-		return 19200000;
-
-	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
-}
-
 static bool
 init_sys_info(void)
 {
 	const char *test_set_name = NULL;
-	const char *test_set_uuid = NULL;
-	char buf[256];
+	struct intel_perf_metric_set *metric_set_iter;
+
+	igt_assert_neq(devid, 0);
 
-	timestamp_frequency = get_cs_timestamp_frequency();
-	igt_debug("timestamp_frequency = %"PRIu64"\n", timestamp_frequency);
-	igt_require(timestamp_frequency);
+	intel_perf = intel_perf_for_fd(drm_fd);
+	igt_require(intel_perf);
 
+	igt_debug("timestamp_frequency = %"PRIu64"\n",
+		  intel_perf->devinfo.timestamp_frequency);
+	igt_assert_neq(intel_perf->devinfo.timestamp_frequency, 0);
+
+	/* We don't have a TestOa metric set for Haswell so use
+	 * RenderBasic
+	 */
 	if (IS_HASWELL(devid)) {
-		/* We don't have a TestOa metric set for Haswell so use
-		 * RenderBasic
-		 */
 		test_set_name = "RenderBasic";
-		test_set_uuid = "403d8832-1a27-4aa6-a64e-f5389ce7b212";
-		test_oa_format = I915_OA_FORMAT_A45_B8_C8;
-		undefined_a_counters = hsw_undefined_a_counters;
 		read_report_ticks = hsw_read_report_ticks;
 		sanity_check_reports = hsw_sanity_check_render_basic_reports;
-
-		if (intel_gt(devid) == 0)
-			n_eus = 10;
-		else if (intel_gt(devid) == 1)
-			n_eus = 20;
-		else if (intel_gt(devid) == 2)
-			n_eus = 40;
-		else {
-			igt_assert(!"reached");
-			return false;
-		}
+		undefined_a_counters = hsw_undefined_a_counters;
 	} else {
-		drm_i915_getparam_t gp;
-
 		test_set_name = "TestOa";
-		test_oa_format = I915_OA_FORMAT_A32u40_A4u32_B8_C8;
-		undefined_a_counters = gen8_undefined_a_counters;
 		read_report_ticks = gen8_read_report_ticks;
 		sanity_check_reports = gen8_sanity_check_test_oa_reports;
+		undefined_a_counters = gen8_undefined_a_counters;
+	}
 
-		if (IS_BROADWELL(devid)) {
-			test_set_uuid = "d6de6f55-e526-4f79-a6a6-d7315c09044e";
-		} else if (IS_CHERRYVIEW(devid)) {
-			test_set_uuid = "4a534b07-cba3-414d-8d60-874830e883aa";
-		} else if (IS_SKYLAKE(devid)) {
-			switch (intel_gt(devid)) {
-			case 1:
-				test_set_uuid = "1651949f-0ac0-4cb1-a06f-dafd74a407d1";
-				break;
-			case 2:
-				test_set_uuid = "2b985803-d3c9-4629-8a4f-634bfecba0e8";
-				break;
-			case 3:
-				test_set_uuid = "882fa433-1f4a-4a67-a962-c741888fe5f5";
-				break;
-			default:
-				igt_debug("unsupported Skylake GT size\n");
-				return false;
-			}
-		} else if (IS_BROXTON(devid)) {
-			test_set_uuid = "5ee72f5c-092f-421e-8b70-225f7c3e9612";
-		} else if (IS_KABYLAKE(devid)) {
-			switch (intel_gt(devid)) {
-			case 1:
-				test_set_uuid = "baa3c7e4-52b6-4b85-801e-465a94b746dd";
-				break;
-			case 2:
-				test_set_uuid = "f1792f32-6db2-4b50-b4b2-557128f1688d";
-				break;
-			default:
-				igt_debug("unsupported Kabylake GT size\n");
-				return false;
-			}
-		} else if (IS_GEMINILAKE(devid)) {
-			test_set_uuid = "dd3fd789-e783-4204-8cd0-b671bbccb0cf";
-		} else if (IS_COFFEELAKE(devid) || IS_COMETLAKE(devid)) {
-			switch (intel_gt(devid)) {
-			case 1:
-				test_set_uuid = "74fb4902-d3d3-4237-9e90-cbdc68d0a446";
-				break;
-			case 2:
-				test_set_uuid = "577e8e2c-3fa0-4875-8743-3538d585e3b0";
-				break;
-			default:
-				igt_debug("unsupported Coffeelake GT size\n");
-				return false;
-			}
-		} else if (IS_CANNONLAKE(devid)) {
-			test_set_uuid = "db41edd4-d8e7-4730-ad11-b9a2d6833503";
-		} else if (IS_ICELAKE(devid)) {
-			test_set_uuid = "a291665e-244b-4b76-9b9a-01de9d3c8068";
-		} else if (IS_TIGERLAKE(devid)) {
-			test_set_uuid = "80a833f0-2504-4321-8894-e9277844ce7b";
-		} else {
-			igt_debug("unsupported GT\n");
-			return false;
+	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
+			test_set = metric_set_iter;
+			break;
 		}
-
-		gp.param = I915_PARAM_EU_TOTAL;
-		gp.value = &n_eus;
-		do_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
 	}
 
+	if (!test_set)
+		return false;
+
 	igt_debug("%s metric set UUID = %s\n",
-		  test_set_name,
-		  test_set_uuid);
+		  test_set->symbol_name,
+		  test_set->hw_config_guid);
 
-	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
+	intel_perf_load_perf_configs(intel_perf, drm_fd);
+
+	if (test_set->perf_oa_metrics_set == 0)
+		return false;
 
-	snprintf(buf, sizeof(buf), "metrics/%s/id", test_set_uuid);
+	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
 
-	return try_sysfs_read_u64(buf, &test_metric_set_id);
+	return true;
 }
 
 static int
@@ -1058,8 +972,8 @@ test_system_wide_paranoid(void)
 			DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 			/* OA unit configuration */
-			DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		};
 		struct drm_i915_perf_open_param param = {
@@ -1084,8 +998,8 @@ test_system_wide_paranoid(void)
 			DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 			/* OA unit configuration */
-			DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		};
 		struct drm_i915_perf_open_param param = {
@@ -1116,8 +1030,8 @@ test_invalid_open_flags(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -1137,7 +1051,7 @@ test_invalid_oa_metric_set_id(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_METRICS_SET, UINT64_MAX,
 	};
@@ -1154,7 +1068,7 @@ test_invalid_oa_metric_set_id(void)
 	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
-	properties[ARRAY_SIZE(properties) - 1] = test_metric_set_id;
+	properties[ARRAY_SIZE(properties) - 1] = test_set->perf_oa_metrics_set;
 	stream_fd = __perf_open(drm_fd, &param, false);
 	__perf_close(stream_fd);
 
@@ -1171,7 +1085,7 @@ test_invalid_oa_format_id(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_FORMAT, UINT64_MAX,
 	};
@@ -1188,7 +1102,7 @@ test_invalid_oa_format_id(void)
 	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
 
 	/* Check that we aren't just seeing false positives... */
-	properties[ARRAY_SIZE(properties) - 1] = test_oa_format;
+	properties[ARRAY_SIZE(properties) - 1] = test_set->perf_oa_format;
 	stream_fd = __perf_open(drm_fd, &param, false);
 	__perf_close(stream_fd);
 
@@ -1204,9 +1118,9 @@ test_missing_sample_flags(void)
 		/* No _PROP_SAMPLE_xyz flags */
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -1343,7 +1257,7 @@ open_and_read_2_oa_reports(int format_id,
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
 		DRM_I915_PERF_PROP_OA_FORMAT, format_id,
 		DRM_I915_PERF_PROP_OA_EXPONENT, exponent,
 
@@ -1710,8 +1624,8 @@ test_oa_exponents(void)
 			DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 			/* OA unit configuration */
-			DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-			DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 			DRM_I915_PERF_PROP_OA_EXPONENT, exponent,
 		};
 		struct drm_i915_perf_open_param param = {
@@ -1720,7 +1634,7 @@ test_oa_exponents(void)
 			.properties_ptr = to_user_pointer(properties),
 		};
 		uint64_t expected_timestamp_delta = 2ULL << exponent;
-		size_t format_size = get_oa_format(test_oa_format).size;
+		size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 		size_t sample_size = (sizeof(struct drm_i915_perf_record_header) +
 				      format_size);
 		int max_reports = MAX_OA_BUF_SIZE / format_size;
@@ -1828,8 +1742,8 @@ test_invalid_oa_exponent(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, 31, /* maximum exponent expected
 						       to be accepted */
 	};
@@ -1864,8 +1778,8 @@ test_low_oa_exponent_permissions(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, bad_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -1927,8 +1841,8 @@ test_per_context_mode_unprivileged(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2014,8 +1928,8 @@ test_blocking(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2172,8 +2086,8 @@ test_polling(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2354,8 +2268,8 @@ test_buffer_fill(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2368,7 +2282,7 @@ test_buffer_fill(void)
 	uint8_t *buf = malloc(buf_size);
 	int len;
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(test_oa_format).size;
+	size_t report_size = get_oa_format(test_set->perf_oa_format).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -2497,8 +2411,8 @@ test_enable_disable(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2510,7 +2424,7 @@ test_enable_disable(void)
 	int buf_size = 65536 * (256 + sizeof(struct drm_i915_perf_record_header));
 	uint8_t *buf = malloc(buf_size);
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
-	size_t report_size = get_oa_format(test_oa_format).size;
+	size_t report_size = get_oa_format(test_set->perf_oa_format).size;
 	int n_full_oa_reports = oa_buf_size / report_size;
 	uint64_t fill_duration = n_full_oa_reports * oa_period;
 
@@ -2642,8 +2556,8 @@ test_short_reads(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2728,8 +2642,8 @@ test_non_sampling_read_error(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 
 		/* XXX: no sampling exponent */
 	};
@@ -2764,8 +2678,8 @@ test_disabled_read_error(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -2791,7 +2705,7 @@ test_disabled_read_error(void)
 	param.flags &= ~I915_PERF_FLAG_DISABLED;
 	stream_fd = __perf_open(drm_fd, &param, false);
 
-	read_2_oa_reports(test_oa_format,
+	read_2_oa_reports(test_set->perf_oa_format,
 			  oa_exponent,
 			  oa_report0,
 			  oa_report1,
@@ -2805,7 +2719,7 @@ test_disabled_read_error(void)
 
 	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
 
-	read_2_oa_reports(test_oa_format,
+	read_2_oa_reports(test_set->perf_oa_format,
 			  oa_exponent,
 			  oa_report0,
 			  oa_report1,
@@ -2836,8 +2750,8 @@ gen12_test_mi_rpc(void)
 		 * not rely on the OA buffer anymore to normalize the counter
 		 * values.
 		 */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -2853,7 +2767,7 @@ gen12_test_mi_rpc(void)
 	uint32_t *report32;
 	int ret;
 	size_t format_size_32;
-	struct oa_format format = get_oa_format(test_oa_format);
+	struct oa_format format = get_oa_format(test_set->perf_oa_format);
 
 	/* Ensure perf_stream_paranoid is set to 1 by default */
 	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
@@ -2932,8 +2846,8 @@ test_mi_rpc(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 
 		/* Note: no OA exponent specified in this case */
 	};
@@ -3049,8 +2963,8 @@ hsw_test_single_ctx_counters(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 
 		/* Note: no OA exponent specified in this case */
 	};
@@ -3204,7 +3118,7 @@ hsw_test_single_ctx_counters(void)
 		igt_assert_neq(report1_32[1], 0); /* timestamp */
 
 		print_reports(report0_32, report1_32,
-			      lookup_format(test_oa_format));
+			      lookup_format(test_set->perf_oa_format));
 
 		/* A40 == N samples written to all render targets */
 		n_samples_written = report1_32[43] - report0_32[43];
@@ -3286,8 +3200,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
 
 		/* Note: no OA exponent specified in this case */
@@ -3297,7 +3211,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	size_t format_size = get_oa_format(test_oa_format).size;
+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 	size_t sample_size = (sizeof(struct drm_i915_perf_record_header) +
 			      format_size);
 	int max_reports = MAX_OA_BUF_SIZE / format_size;
@@ -3333,7 +3247,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			uint32_t n_invalid_ctx = 0;
 			int ret;
 			struct accumulator accumulator = {
-				.format = test_oa_format
+				.format = test_set->perf_oa_format
 			};
 
 			bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
@@ -3508,7 +3422,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				exit(EAGAIN);
 			}
 
-			len = i915_read_reports_until_timestamp(test_oa_format,
+			len = i915_read_reports_until_timestamp(test_set->perf_oa_format,
 								buf, buf_size,
 								report0_32[1],
 								report1_32[1]);
@@ -3523,7 +3437,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				uint32_t reason;
 				const char *skip_reason = NULL, *report_reason = NULL;
 				struct accumulator laccumulator = {
-					.format = test_oa_format
+					.format = test_set->perf_oa_format
 				};
 
 
@@ -3654,7 +3568,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				if (report == report1_32) {
 					igt_debug("Breaking on end of report\n");
 					print_reports(report0_32, report1_32,
-						      lookup_format(test_oa_format));
+						      lookup_format(test_set->perf_oa_format));
 					break;
 				}
 			}
@@ -3722,8 +3636,8 @@ static void gen12_single_ctx_helper(void)
 		 * not rely on the OA buffer anymore to normalize the counter
 		 * values.
 		 */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 	};
 	struct drm_i915_perf_open_param param = {
 		.flags = I915_PERF_FLAG_FD_CLOEXEC,
@@ -3747,7 +3661,7 @@ static void gen12_single_ctx_helper(void)
 	uint32_t ctx1_id = INVALID_CTX_ID;
 	int ret;
 	struct accumulator accumulator = {
-		.format = test_oa_format
+		.format = test_set->perf_oa_format
 	};
 
 	bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
@@ -4047,8 +3961,8 @@ test_rc6_disable(void)
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
 
 		/* OA unit configuration */
-		DRM_I915_PERF_PROP_OA_METRICS_SET, test_metric_set_id,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 	};
 	struct drm_i915_perf_open_param param = {
@@ -4231,7 +4145,7 @@ test_create_destroy_userspace_config(void)
 
 		/* OA unit configuration */
 		DRM_I915_PERF_PROP_SAMPLE_OA, true,
-		DRM_I915_PERF_PROP_OA_FORMAT, test_oa_format,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
 		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
 		DRM_I915_PERF_PROP_OA_METRICS_SET
 	};
@@ -4502,8 +4416,8 @@ test_i915_ref_count(void)
 	 * init_sys_info()...
 	 */
 	igt_require(init_sys_info());
-	properties[3] = test_metric_set_id;
-	properties[5] = test_oa_format;
+	properties[3] = test_set->perf_oa_metrics_set;
+	properties[5] = test_set->perf_oa_format;
 	properties[7] = oa_exp_1_millisec;
 
 	ref_count0 = read_i915_module_ref();
@@ -4524,7 +4438,7 @@ test_i915_ref_count(void)
 
 	igt_assert(ref_count0 > baseline);
 
-	read_2_oa_reports(test_oa_format,
+	read_2_oa_reports(test_set->perf_oa_format,
 			  oa_exp_1_millisec,
 			  oa_report0,
 			  oa_report1,
@@ -4691,6 +4605,9 @@ igt_main
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
 
+		if (intel_perf)
+			intel_perf_free(intel_perf);
+
 		close(drm_fd);
 	}
 }
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
