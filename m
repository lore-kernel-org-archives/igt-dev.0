Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3007B6E4B0
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2020 18:00:31 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  4 Aug 2020 11:00:29 -0700
Message-Id: <20200804180030.70087-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] HAX i915/perf: add tests for triggered OA
 reports
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

From: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>

By whitelisting a couple of registers we can allow an application
batch to trigger OA reports in the OA buffer by switching back & forth
an inverter on the condition logic.

v2: Wait before sampling the timestamp used to end the OA buffer search
v3:
- Ensure OA regs are whitelisted and reports are triggered only when
  perf_stream_paranoid is set to 0.
- Drop root to trigger reports.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c                     | 449 ++++++++++++++++++++++++--
 tests/intel-ci/fast-feedback.testlist | 165 +---------
 2 files changed, 434 insertions(+), 180 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 92edc9f1..b030cfad 100644
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
 static uint32_t (*read_report_ticks)(uint32_t *report,
@@ -293,6 +296,23 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
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
@@ -383,11 +403,17 @@ gen8_read_report_clock_ratios(uint32_t *report,
 	*unslice_freq_mhz = (unslice_freq * 16666) / 1000;
 }
 
+static uint32_t
+gen8_report_reason(const uint32_t *report)
+{
+	return ((report[0] >> OAREPORT_REASON_SHIFT) &
+		OAREPORT_REASON_MASK);
+}
+
 static const char *
 gen8_read_report_reason(const uint32_t *report)
 {
-	uint32_t reason = ((report[0] >> OAREPORT_REASON_SHIFT) &
-			   OAREPORT_REASON_MASK);
+	uint32_t reason = gen8_report_reason(report);
 
 	if (reason & (1<<0))
 		return "timer";
@@ -3118,6 +3144,268 @@ emit_stall_timestamp_and_rpc(struct intel_batchbuffer *batch,
 	emit_report_perf_count(batch, dst, report_dst_offset, report_id);
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
+/*
+ * We have 2 trigger registers that each generate a different
+ * report reason.
+ */
+static const uint32_t gen8_oa_wl[] = {
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
+static void
+emit_triggered_oa_report(struct intel_batchbuffer *batch,
+			 uint32_t trigger)
+{
+	const uint32_t *triggers = intel_gen(devid) >= 12 ? gen12_oa_wl: gen8_oa_wl;
+
+	assert(trigger <= 1);
+
+	BEGIN_BATCH(6, 0);
+	OUT_BATCH(MI_LOAD_REGISTER_IMM);
+	OUT_BATCH(triggers[trigger]);
+	OUT_BATCH(OAREPORTTRIG2_INVERT_C_1 |
+		  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+	OUT_BATCH(MI_LOAD_REGISTER_IMM);
+	OUT_BATCH(triggers[trigger]);
+	OUT_BATCH(OAREPORTTRIG2_INVERT_C_1 |
+		  OAREPORTTRIG2_INVERT_D_0 |
+		  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+	ADVANCE_BATCH();
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
+	drm_intel_bufmgr *bufmgr;
+	drm_intel_context *context;
+	struct igt_helper_process child = {};
+	struct intel_batchbuffer *batch;
+	struct igt_buf src[2], dst[2];
+	uint64_t timestamp32_mask = (1ull << 32) - 1;
+	uint64_t timestamps[2];
+	uint32_t buf_size = 16 * 1024 * 1024;
+	uint8_t *buf = malloc(buf_size);
+	uint32_t ctx_id;
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
+			bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
+			drm_intel_bufmgr_gem_enable_reuse(bufmgr);
+
+			scratch_buf_init(bufmgr, &src[0], width, height, 0xff0000ff);
+			scratch_buf_init(bufmgr, &dst[0], width, height, 0x00ff00ff);
+			scratch_buf_init(bufmgr, &src[1], 2 * width, height, 0xff0000ff);
+			scratch_buf_init(bufmgr, &dst[1], 2 * width, height, 0x00ff00ff);
+
+			batch = intel_batchbuffer_alloc(bufmgr, devid);
+
+			context = drm_intel_gem_context_create(bufmgr);
+			igt_assert(context);
+
+			ret = drm_intel_gem_context_get_id(context, &ctx_id);
+			properties[1] = ctx_id;
+
+
+			timestamps[0] = rcs_timestmap_reg_read(drm_fd);
+
+			stream_fd = __perf_open(drm_fd, &param, false);
+
+			emit_triggered_oa_report(batch, 0);
+
+			render_copy(batch,
+				    context,
+				    &src[0], 0, 0, width, height,
+				    &dst[0], 0, 0);
+
+			emit_triggered_oa_report(batch, 0);
+
+			emit_triggered_oa_report(batch, 1);
+
+			render_copy(batch,
+				    context,
+				    &src[1], 0, 0, 2 * width, height,
+				    &dst[1], 0, 0);
+
+			emit_triggered_oa_report(batch, 1);
+
+			intel_batchbuffer_flush_with_context(batch, context);
+
+			/* On some failures, this timestamp is too early as in
+			 * we bail out before seeing the triggered report. Wait
+			 * a little more and then check.
+			 */
+			usleep(50000);
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
+				drm_intel_bo_unreference(src[i].bo);
+				drm_intel_bo_unreference(dst[i].bo);
+			}
+
+			intel_batchbuffer_free(batch);
+			drm_intel_gem_context_destroy(context);
+			drm_intel_bufmgr_destroy(bufmgr);
+			__perf_close(stream_fd);
+		}
+
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
@@ -4768,6 +5056,122 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
+#define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
+
+static uint32_t gen12_wl_slots[] = {
+	0x24d0, 0x24d4, 0x24d8, 0x24dc, 0x24e0, 0x24e4, 0x24e8, 0x24ec,
+	0x24f0, 0x24f4, 0x24f8, 0x24fc, 0x2010, 0x2014, 0x2018, 0x201c,
+	0x21e0, 0x21e4, 0x21e8, 0x21ec,
+};
+
+static uint32_t gen9_wl_slots[] = {
+	0x24d0, 0x24d4, 0x24d8, 0x24dc, 0x24e0, 0x24e4, 0x24e8, 0x24ec,
+	0x24f0, 0x24f4, 0x24f8, 0x24fc,
+};
+
+static void dump_wl(uint32_t *slots, uint32_t count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		igt_debug("LOCAL: FORCE_TO_NON_PRIV_%02d = %08x\n",
+			  i, intel_register_read(&mmio_data, slots[i]));
+}
+
+static void dump_whitelist(const char *msg)
+{
+	igt_debug("%s\n", msg);
+
+	if (intel_gen(devid) >= 12)
+		dump_wl(gen12_wl_slots, ARRAY_SIZE(gen12_wl_slots));
+	else if (intel_gen(devid) > 8)
+		dump_wl(gen9_wl_slots, ARRAY_SIZE(gen9_wl_slots));
+	else
+		return;
+}
+
+static bool in_whitelist(uint32_t reg)
+{
+	uint32_t *slots, count;
+	int i;
+
+	if (intel_gen(devid) >= 12) {
+		slots = gen12_wl_slots;
+		count = ARRAY_SIZE(gen12_wl_slots);
+	} else {
+		slots = gen9_wl_slots;
+		count = ARRAY_SIZE(gen9_wl_slots);
+	}
+
+	for (i = 0; i < count; i++) {
+		uint32_t fpriv = intel_register_read(&mmio_data, slots[i]);
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
+	const uint32_t *regs;
+	uint32_t count;
+	int i;
+
+	if (intel_gen(devid) >= 12) {
+		regs = gen12_oa_wl;
+		count = i915_perf_revision(drm_fd) >= 7 ?
+			ARRAY_SIZE(gen12_oa_wl) : 2;
+	} else {
+		regs = gen8_oa_wl;
+		count = i915_perf_revision(drm_fd) >= 7 ?
+			ARRAY_SIZE(gen8_oa_wl) : 2;
+	}
+
+	for (i = 0; i < count; i++)
+		if (are_present)
+			igt_assert(in_whitelist(regs[i]));
+		else
+			igt_assert(!in_whitelist(regs[i]));
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
+	if (paranoid)
+		oa_regs_in_whitelist(false);
+	else
+		oa_regs_in_whitelist(true);
+
+	__perf_close(stream_fd);
+
+	dump_whitelist("oa remove whitelist");
+
+	/* after perf close, whitelist should be removed */
+	oa_regs_in_whitelist(false);
+
+	intel_register_access_fini(&mmio_data);
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -4880,23 +5284,6 @@ test_sysctl_defaults(void)
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
@@ -5096,6 +5483,30 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(intel_gen(devid) > 8);
+			igt_require(i915_perf_revision(drm_fd) >= 6);
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
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..262f8d1c 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,163 +1,6 @@
 # Keep alphabetically sorted by default
 
-igt@core_auth@basic-auth
-igt@debugfs_test@read_all_entries
-igt@fbdev@mmap
-igt@gem_basic@bad-close
-igt@gem_basic@create-close
-igt@gem_basic@create-fd-close
-igt@gem_busy@busy@all
-igt@gem_close_race@basic-process
-igt@gem_close_race@basic-threads
-igt@gem_ctx_create@basic
-igt@gem_ctx_create@basic-files
-igt@gem_ctx_exec@basic
-igt@gem_exec_basic@basic
-igt@gem_exec_create@basic
-igt@gem_exec_fence@basic-busy
-igt@gem_exec_fence@basic-wait
-igt@gem_exec_fence@basic-await
-igt@gem_exec_fence@nb-await
-igt@gem_exec_gttfill@basic
-igt@gem_exec_parallel@engines
-igt@gem_exec_store@basic
-igt@gem_exec_suspend@basic-s0
-igt@gem_exec_suspend@basic-s3
-igt@gem_flink_basic@bad-flink
-igt@gem_flink_basic@bad-open
-igt@gem_flink_basic@basic
-igt@gem_flink_basic@double-flink
-igt@gem_flink_basic@flink-lifetime
-igt@gem_huc_copy@huc-copy
-igt@gem_linear_blits@basic
-igt@gem_mmap@basic
-igt@gem_mmap_gtt@basic
-igt@gem_render_linear_blits@basic
-igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-all
-igt@gem_sync@basic-all
-igt@gem_sync@basic-each
-igt@gem_tiled_blits@basic
-igt@gem_tiled_fence_blits@basic
-igt@gem_tiled_pread_basic
-igt@gem_wait@busy@all
-igt@gem_wait@wait@all
-igt@i915_getparams_basic@basic-eu-total
-igt@i915_getparams_basic@basic-subslice-total
-igt@i915_hangman@error-state-basic
-igt@kms_addfb_basic@addfb25-bad-modifier
-igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
-igt@kms_addfb_basic@addfb25-modifier-no-flag
-igt@kms_addfb_basic@addfb25-x-tiled
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch
-igt@kms_addfb_basic@addfb25-yf-tiled
-igt@kms_addfb_basic@addfb25-y-tiled
-igt@kms_addfb_basic@addfb25-y-tiled-small
-igt@kms_addfb_basic@bad-pitch-0
-igt@kms_addfb_basic@bad-pitch-1024
-igt@kms_addfb_basic@bad-pitch-128
-igt@kms_addfb_basic@bad-pitch-256
-igt@kms_addfb_basic@bad-pitch-32
-igt@kms_addfb_basic@bad-pitch-63
-igt@kms_addfb_basic@bad-pitch-65536
-igt@kms_addfb_basic@bad-pitch-999
-igt@kms_addfb_basic@basic
-igt@kms_addfb_basic@basic-x-tiled
-igt@kms_addfb_basic@basic-y-tiled
-igt@kms_addfb_basic@bo-too-small
-igt@kms_addfb_basic@bo-too-small-due-to-tiling
-igt@kms_addfb_basic@clobberred-modifier
-igt@kms_addfb_basic@framebuffer-vs-set-tiling
-igt@kms_addfb_basic@invalid-get-prop
-igt@kms_addfb_basic@invalid-get-prop-any
-igt@kms_addfb_basic@invalid-set-prop
-igt@kms_addfb_basic@invalid-set-prop-any
-igt@kms_addfb_basic@no-handle
-igt@kms_addfb_basic@size-max
-igt@kms_addfb_basic@small-bo
-igt@kms_addfb_basic@tile-pitch-mismatch
-igt@kms_addfb_basic@too-high
-igt@kms_addfb_basic@too-wide
-igt@kms_addfb_basic@unused-handle
-igt@kms_addfb_basic@unused-modifier
-igt@kms_addfb_basic@unused-offsets
-igt@kms_addfb_basic@unused-pitches
-igt@kms_busy@basic
-igt@kms_chamelium@dp-hpd-fast
-igt@kms_chamelium@dp-edid-read
-igt@kms_chamelium@dp-crc-fast
-igt@kms_chamelium@hdmi-hpd-fast
-igt@kms_chamelium@hdmi-edid-read
-igt@kms_chamelium@hdmi-crc-fast
-igt@kms_chamelium@vga-hpd-fast
-igt@kms_chamelium@vga-edid-read
-igt@kms_chamelium@common-hpd-after-suspend
-igt@kms_prop_blob@basic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
-igt@kms_flip@basic-flip-vs-dpms
-igt@kms_flip@basic-flip-vs-modeset
-igt@kms_flip@basic-flip-vs-wf_vblank
-igt@kms_flip@basic-plain-flip
-igt@kms_force_connector_basic@force-connector-state
-igt@kms_force_connector_basic@force-edid
-igt@kms_force_connector_basic@force-load-detect
-igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-a
-igt@kms_pipe_crc_basic@read-crc-pipe-b
-igt@kms_pipe_crc_basic@read-crc-pipe-c
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
-igt@kms_psr@primary_page_flip
-igt@kms_psr@cursor_plane_move
-igt@kms_psr@sprite_plane_onoff
-igt@kms_psr@primary_mmap_gtt
-igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rps@basic-api
-igt@prime_self_import@basic-llseek-bad
-igt@prime_self_import@basic-llseek-size
-igt@prime_self_import@basic-with_fd_dup
-igt@prime_self_import@basic-with_one_bo
-igt@prime_self_import@basic-with_one_bo_two_files
-igt@prime_self_import@basic-with_two_bos
-igt@prime_vgem@basic-fence-flip
-igt@prime_vgem@basic-fence-mmap
-igt@prime_vgem@basic-fence-read
-igt@prime_vgem@basic-gtt
-igt@prime_vgem@basic-read
-igt@prime_vgem@basic-write
-igt@vgem_basic@setversion
-igt@vgem_basic@create
-igt@vgem_basic@debugfs
-igt@vgem_basic@dmabuf-export
-igt@vgem_basic@dmabuf-fence
-igt@vgem_basic@dmabuf-fence-before
-igt@vgem_basic@dmabuf-mmap
-igt@vgem_basic@mmap
-igt@vgem_basic@second-client
-igt@vgem_basic@sysfs
-
-# All tests that do module unloading and reloading are executed last.
-# They will sometimes reveal issues of earlier tests leaving the
-# driver in a broken state that is not otherwise noticed in that test.
-
-igt@vgem_basic@unload
-igt@i915_module_load@reload
-igt@i915_pm_rpm@module-reload
-
-# Kernel selftests
-igt@i915_selftest@live
-igt@dmabuf@all
+igt@perf@oa-regs-whitelisted
+igt@perf@oa-regs-not-whitelisted
+igt@perf@triggered-oa-reports-paranoid-0
+igt@perf@triggered-oa-reports-paranoid-1
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
