Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3400F6E8AA
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 20:07:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Aug 2021 13:07:33 -0700
Message-Id: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/5] i915/perf: add tests for triggered OA reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>

By whitelisting a couple of registers we can allow an application
batch to trigger OA reports in the OA buffer by switching back & forth
an inverter on the condition logic.

v2: Wait before sampling the timestamp used to end the OA buffer search
v3:
- Ensure OA regs are whitelisted and reports are triggered only when
  perf_stream_paranoid is set to 0.
- Drop root to trigger reports.
v4:
- wait for children after igt_assert
- use new api for intel batch buffer
- clean up test code

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 421 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 404 insertions(+), 17 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e641d5d2..fa3840eb 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -53,6 +53,8 @@ IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
 #define OAREPORT_REASON_SHIFT          19
 #define OAREPORT_REASON_TIMER          (1<<0)
 #define OAREPORT_REASON_INTERNAL       (3<<1)
+#define OAREPORT_REASON_TRIGGER1       (1<<1)
+#define OAREPORT_REASON_TRIGGER2       (1<<2)
 #define OAREPORT_REASON_CTX_SWITCH     (1<<3)
 #define OAREPORT_REASON_GO             (1<<4)
 #define OAREPORT_REASON_CLK_RATIO      (1<<5)
@@ -204,6 +206,7 @@ static struct intel_perf *intel_perf = NULL;
 static struct intel_perf_metric_set *test_set = NULL;
 static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
+struct intel_mmio_data mmio_data;
 
 static igt_render_copyfunc_t render_copy = NULL;
 static uint32_t (*read_report_ticks)(const uint32_t *report,
@@ -294,6 +297,23 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
 	return ret;
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
 static int
 lookup_format(int i915_perf_fmt_id)
 {
@@ -3151,6 +3171,283 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 	emit_report_perf_count(ibb, dst, report_dst_offset, report_id);
 }
 
+/* The following register all have the same layout. */
+#define OAREPORTTRIG2 (0x2744)
+#define   OAREPORTTRIG2_INVERT_A_0  (1 << 0)
+#define   OAREPORTTRIG2_INVERT_A_1  (1 << 1)
+#define   OAREPORTTRIG2_INVERT_A_2  (1 << 2)
+#define   OAREPORTTRIG2_INVERT_A_3  (1 << 3)
+#define   OAREPORTTRIG2_INVERT_A_4  (1 << 4)
+#define   OAREPORTTRIG2_INVERT_A_5  (1 << 5)
+#define   OAREPORTTRIG2_INVERT_A_6  (1 << 6)
+#define   OAREPORTTRIG2_INVERT_A_7  (1 << 7)
+#define   OAREPORTTRIG2_INVERT_A_8  (1 << 8)
+#define   OAREPORTTRIG2_INVERT_A_9  (1 << 9)
+#define   OAREPORTTRIG2_INVERT_A_10 (1 << 10)
+#define   OAREPORTTRIG2_INVERT_A_11 (1 << 11)
+#define   OAREPORTTRIG2_INVERT_A_12 (1 << 12)
+#define   OAREPORTTRIG2_INVERT_A_13 (1 << 13)
+#define   OAREPORTTRIG2_INVERT_A_14 (1 << 14)
+#define   OAREPORTTRIG2_INVERT_A_15 (1 << 15)
+#define   OAREPORTTRIG2_INVERT_B_0  (1 << 16)
+#define   OAREPORTTRIG2_INVERT_B_1  (1 << 17)
+#define   OAREPORTTRIG2_INVERT_B_2  (1 << 18)
+#define   OAREPORTTRIG2_INVERT_B_3  (1 << 19)
+#define   OAREPORTTRIG2_INVERT_C_0  (1 << 20)
+#define   OAREPORTTRIG2_INVERT_C_1  (1 << 21)
+#define   OAREPORTTRIG2_INVERT_D_0  (1 << 22)
+#define   OAREPORTTRIG2_THRESHOLD_ENABLE      (1 << 23)
+#define   OAREPORTTRIG2_REPORT_TRIGGER_ENABLE (1 << 31)
+#define OAREPORTTRIG6 (0x2754)
+#define OA_PERF_COUNTER_A(idx) (0x2800 + 8 * (idx))
+#define GEN8_OASTATUS (0x2b08)
+
+#define GEN12_OAREPORTTRIG2 (0xd924)
+#define GEN12_OAREPORTTRIG6 (0xd934)
+#define GEN12_OAG_PERF_COUNTER_A(idx) (0xD980 + 8 * (idx))
+#define GEN12_OAG_OASTATUS (0xdafc)
+
+#define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
+
+/*
+ * We have 2 trigger registers that each generate a different
+ * report reason.
+ */
+static const uint32_t gen9_oa_wl[] = {
+	OAREPORTTRIG2,
+	OAREPORTTRIG6,
+	OA_PERF_COUNTER_A(18),
+	GEN8_OASTATUS,
+};
+static const uint32_t gen12_oa_wl[] = {
+	GEN12_OAREPORTTRIG2,
+	GEN12_OAREPORTTRIG6,
+	GEN12_OAG_PERF_COUNTER_A(18),
+	GEN12_OAG_OASTATUS,
+};
+
+static const uint32_t nonpriv_slots[] = {
+	0x24d0, 0x24d4, 0x24d8, 0x24dc, 0x24e0, 0x24e4, 0x24e8, 0x24ec,
+	0x24f0, 0x24f4, 0x24f8, 0x24fc, 0x2010, 0x2014, 0x2018, 0x201c,
+	0x21e0, 0x21e4, 0x21e8, 0x21ec,
+};
+
+struct test_perf {
+	const uint32_t *slots;
+	uint32_t num_slots;
+	const uint32_t *wl;
+	uint32_t num_wl;
+} perf;
+
+static void perf_init_whitelist(void)
+{
+	perf.slots = nonpriv_slots;
+
+	if (intel_gen(devid) >= 12) {
+		perf.num_slots = 20;
+		perf.wl = gen12_oa_wl;
+		perf.num_wl = i915_perf_revision(drm_fd) < 7 ? 2 :
+			       ARRAY_SIZE(gen12_oa_wl);
+	} else {
+		perf.num_slots = 12;
+		perf.wl = gen9_oa_wl;
+		perf.num_wl = i915_perf_revision(drm_fd) < 7 ? 2 :
+			       ARRAY_SIZE(gen9_oa_wl);
+	}
+}
+
+static void
+emit_triggered_oa_report(struct intel_bb *ibb, uint32_t trigger)
+{
+	const uint32_t *triggers = perf.wl;
+
+	assert(trigger <= 1);
+
+	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM);
+	intel_bb_out(ibb, triggers[trigger]);
+	intel_bb_out(ibb, OAREPORTTRIG2_INVERT_C_1 |
+			  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM);
+	intel_bb_out(ibb, triggers[trigger]);
+	intel_bb_out(ibb, OAREPORTTRIG2_INVERT_C_1 |
+			  OAREPORTTRIG2_INVERT_D_0 |
+			  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+}
+
+static uint64_t
+rcs_timestmap_reg_read(int fd)
+{
+	struct drm_i915_reg_read rr = {
+		.offset = 0x2358 | I915_REG_READ_8B_WA, /* render ring timestamp */
+	};
+
+	do_ioctl(fd, DRM_IOCTL_I915_REG_READ, &rr);
+
+	return rr.val;
+}
+
+/*
+ * Verify that we can trigger OA reports into the OA buffer using
+ * MI_LRI.
+ */
+static void
+test_triggered_oa_reports(int paranoid)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(1000000);
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_CTX_HANDLE, UINT64_MAX, /* updated below */
+
+		/* Note: we have to specify at least one sample property even
+		 * though we aren't interested in samples in this case
+		 */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+		/* Note: no OA exponent specified in this case */
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct drm_i915_perf_record_header *header;
+	struct buf_ops *bops;
+	uint32_t context;
+	struct igt_helper_process child = {};
+	struct intel_bb *ibb;
+	struct intel_buf src[2], dst[2];
+	uint64_t timestamp32_mask = (1ull << 32) - 1;
+	uint64_t timestamps[2];
+	uint32_t buf_size = 16 * 1024 * 1024;
+	uint8_t *buf = malloc(buf_size);
+	int width = 800;
+	int height = 600;
+	uint32_t trigger_counts[2] = { 0, };
+	int ret;
+
+	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", paranoid);
+
+	do {
+		igt_fork_helper(&child) {
+			if (!paranoid)
+				igt_drop_root();
+
+			bops = buf_ops_create(drm_fd);
+
+			scratch_buf_init(bops, &src[0], width, height, 0xff0000ff);
+			scratch_buf_init(bops, &dst[0], width, height, 0x00ff00ff);
+			scratch_buf_init(bops, &src[1], 2 * width, height, 0xff0000ff);
+			scratch_buf_init(bops, &dst[1], 2 * width, height, 0x00ff00ff);
+
+			context = gem_context_create(drm_fd);
+			igt_assert(context);
+			ibb = intel_bb_create_with_context(drm_fd, context, BATCH_SZ);
+			properties[1] = context;
+
+			timestamps[0] = rcs_timestmap_reg_read(drm_fd);
+
+			stream_fd = __perf_open(drm_fd, &param, false);
+
+			emit_triggered_oa_report(ibb, 0);
+
+			render_copy(ibb,
+				    &src[0], 0, 0, width, height,
+				    &dst[0], 0, 0);
+
+			emit_triggered_oa_report(ibb, 0);
+
+			emit_triggered_oa_report(ibb, 1);
+
+			render_copy(ibb,
+				    &src[1], 0, 0, 2 * width, height,
+				    &dst[1], 0, 0);
+
+			emit_triggered_oa_report(ibb, 1);
+
+			intel_bb_flush_render(ibb);
+			intel_bb_sync(ibb);
+
+			timestamps[1] = rcs_timestmap_reg_read(drm_fd);
+
+			if (timestamps[1] < timestamps[0] ||
+			    (timestamps[1] & timestamp32_mask) < (timestamps[1] & timestamp32_mask)) {
+				igt_debug("Timestamp rollover, trying again\n");
+				exit(EAGAIN);
+			}
+
+			ret = i915_read_reports_until_timestamp(test_set->perf_oa_format,
+								buf, buf_size,
+								timestamps[0] & timestamp32_mask,
+								timestamps[1] & timestamp32_mask);
+
+			for (size_t offset = 0; offset < ret; offset += header->size) {
+				uint32_t *report;
+
+				header = (void *)(buf + offset);
+
+				igt_assert_eq(header->pad, 0); /* Reserved */
+
+				igt_assert_neq(header->type, DRM_I915_PERF_RECORD_OA_BUFFER_LOST);
+
+				if (header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST)
+					continue;
+
+				/* Currently the only other record type expected is a
+				 * _SAMPLE. Notably this test will need updating if
+				 * i915-perf is extended in the future with additional
+				 * record types.
+				 */
+				igt_assert_eq(header->type, DRM_I915_PERF_RECORD_SAMPLE);
+
+				report = (void *)(header + 1);
+
+				igt_debug("report ts=0x%08x hw_id=0x%08x reason=%s\n",
+					  report[1], report[2],
+					  gen8_read_report_reason(report));
+
+				if (gen8_report_reason(report) & OAREPORT_REASON_TRIGGER1) {
+					igt_assert_eq(trigger_counts[1], 0);
+					trigger_counts[0]++;
+				}
+				if (gen8_report_reason(report) & OAREPORT_REASON_TRIGGER2) {
+					igt_assert_eq(trigger_counts[0], 2);
+					trigger_counts[1]++;
+				}
+			}
+
+			if (paranoid) {
+				igt_assert_eq(trigger_counts[0], 0);
+				igt_assert_eq(trigger_counts[1], 0);
+			} else {
+				igt_assert_eq(trigger_counts[0], 2);
+				igt_assert_eq(trigger_counts[1], 2);
+			}
+
+			for (int i = 0; i < ARRAY_SIZE(src); i++) {
+				intel_buf_close(bops, &src[i]);
+				intel_buf_close(bops, &dst[i]);
+			}
+
+			intel_bb_destroy(ibb);
+			gem_context_destroy(drm_fd, context);
+			buf_ops_destroy(bops);
+			__perf_close(stream_fd);
+		}
+
+		ret = igt_wait_helper(&child);
+
+		igt_assert(WEXITSTATUS(ret) == EAGAIN ||
+			   WEXITSTATUS(ret) == 0);
+
+	} while (WEXITSTATUS(ret) == EAGAIN);
+
+	free(buf);
+}
+
 /* Tests the INTEL_performance_query use case where an unprivileged process
  * should be able to configure the OA unit for per-context metrics (for a
  * context associated with that process' drm file descriptor) and the counters
@@ -4777,6 +5074,88 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
+static void dump_whitelist(const char *msg)
+{
+	int i;
+
+	igt_debug("%s\n", msg);
+
+	for (i = 0; i < perf.num_slots; i++)
+		igt_debug("FORCE_TO_NON_PRIV_%02d = %08x\n",
+			  i, intel_register_read(&mmio_data, perf.slots[i]));
+}
+
+static bool in_whitelist(uint32_t reg)
+{
+	int i;
+
+	for (i = 0; i < perf.num_slots; i++) {
+		uint32_t fpriv = intel_register_read(&mmio_data, perf.slots[i]);
+
+		if ((fpriv & RING_FORCE_TO_NONPRIV_ADDRESS_MASK) == reg)
+			return true;
+	}
+
+	return false;
+}
+
+static void oa_regs_in_whitelist(bool are_present)
+{
+	int i;
+
+	if (are_present) {
+		for (i = 0; i < perf.num_wl; i++)
+			igt_assert(in_whitelist(perf.wl[i]));
+	} else {
+		for (i = 0; i < perf.num_wl; i++)
+			igt_assert(!in_whitelist(perf.wl[i]));
+	}
+}
+
+static void test_oa_regs_whitelist(int paranoid)
+{
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", paranoid);
+	intel_register_access_init(&mmio_data, intel_get_pci_device(),
+				   0, drm_fd);
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	dump_whitelist("oa whitelisted");
+
+	/*
+	 * oa registers are whitelisted only if paranoid = 0. if so, make sure
+	 * that the registers are in the nonpriv slots. if not, make sure the
+	 * registers are NOT present in the nonpriv slots.
+	 */
+	if (paranoid)
+		oa_regs_in_whitelist(false);
+	else
+		oa_regs_in_whitelist(true);
+
+	__perf_close(stream_fd);
+
+	dump_whitelist("oa remove whitelist");
+
+	/*
+	 * after perf close, check that registers are removed from the nonpriv
+	 * slots
+	 */
+	oa_regs_in_whitelist(false);
+
+	intel_register_access_fini(&mmio_data);
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -4889,23 +5268,6 @@ test_sysctl_defaults(void)
 	igt_assert_eq(max_freq, 100000);
 }
 
-static int i915_perf_revision(int fd)
-{
-	drm_i915_getparam_t gp;
-	int value = 1, ret;
-
-	gp.param = I915_PARAM_PERF_REVISION;
-	gp.value = &value;
-	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
-	if (ret == -1) {
-		/* If the param is missing, consider version 1. */
-		igt_assert_eq(errno, EINVAL);
-		return 1;
-	}
-
-	return value;
-}
-
 igt_main
 {
 	igt_fixture {
@@ -5119,6 +5481,31 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(intel_gen(devid) > 8);
+			igt_require(i915_perf_revision(drm_fd) >= 6);
+			perf_init_whitelist();
+		}
+
+		igt_describe("Verify that OA registers are whitelisted for paranoid 0");
+		igt_subtest("oa-regs-whitelisted")
+			test_oa_regs_whitelist(0);
+
+		igt_describe("Verify that OA registers are not whitelisted for paranoid 1");
+		igt_subtest("oa-regs-not-whitelisted")
+			test_oa_regs_whitelist(1);
+
+		igt_describe("Verify reports triggered when perf_stream_paranoid is 0");
+		igt_subtest("triggered-oa-reports-paranoid-0")
+			test_triggered_oa_reports(0);
+
+		igt_describe("Verify reports not triggered when perf_stream_paranoid is 1");
+		igt_subtest("triggered-oa-reports-paranoid-1")
+			test_triggered_oa_reports(1);
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
-- 
2.20.1
