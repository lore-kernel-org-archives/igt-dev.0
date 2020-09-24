Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866386E11F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 16:25:14 +0000 (UTC)
Date: Thu, 24 Sep 2020 09:24:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200924162432.GA8620@orsosgc001.ra.intel.com>
References: <20200818203547.24461-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818203547.24461-1-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] i915/perf: add tests for triggered OA
 reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 01:35:46PM -0700, Umesh Nerlige Ramappa wrote:
>From: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>
>By whitelisting a couple of registers we can allow an application
>batch to trigger OA reports in the OA buffer by switching back & forth
>an inverter on the condition logic.
>
>v2: Wait before sampling the timestamp used to end the OA buffer search
>v3:
>- Ensure OA regs are whitelisted and reports are triggered only when
>  perf_stream_paranoid is set to 0.
>- Drop root to trigger reports.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
> tests/i915/perf.c | 449 ++++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 430 insertions(+), 19 deletions(-)
>
>diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>index 92edc9f1..b030cfad 100644
>--- a/tests/i915/perf.c
>+++ b/tests/i915/perf.c
>@@ -53,6 +53,8 @@ IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> #define OAREPORT_REASON_SHIFT          19
> #define OAREPORT_REASON_TIMER          (1<<0)
> #define OAREPORT_REASON_INTERNAL       (3<<1)
>+#define OAREPORT_REASON_TRIGGER1       (1<<1)
>+#define OAREPORT_REASON_TRIGGER2       (1<<2)
> #define OAREPORT_REASON_CTX_SWITCH     (1<<3)
> #define OAREPORT_REASON_GO             (1<<4)
> #define OAREPORT_REASON_CLK_RATIO      (1<<5)
>@@ -204,6 +206,7 @@ static struct intel_perf *intel_perf = NULL;
> static struct intel_perf_metric_set *test_set = NULL;
> static bool *undefined_a_counters;
> static uint64_t oa_exp_1_millisec;
>+struct intel_mmio_data mmio_data;
>
> static igt_render_copyfunc_t render_copy = NULL;
> static uint32_t (*read_report_ticks)(uint32_t *report,
>@@ -293,6 +296,23 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
> 	return ret;
> }
>
>+static int i915_perf_revision(int fd)
>+{
>+	drm_i915_getparam_t gp;
>+	int value = 1, ret;
>+
>+	gp.param = I915_PARAM_PERF_REVISION;
>+	gp.value = &value;
>+	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
>+	if (ret == -1) {
>+		/* If the param is missing, consider version 1. */
>+		igt_assert_eq(errno, EINVAL);
>+		return 1;
>+	}
>+
>+	return value;
>+}
>+
> static int
> lookup_format(int i915_perf_fmt_id)
> {
>@@ -383,11 +403,17 @@ gen8_read_report_clock_ratios(uint32_t *report,
> 	*unslice_freq_mhz = (unslice_freq * 16666) / 1000;
> }
>
>+static uint32_t
>+gen8_report_reason(const uint32_t *report)
>+{
>+	return ((report[0] >> OAREPORT_REASON_SHIFT) &
>+		OAREPORT_REASON_MASK);
>+}
>+
> static const char *
> gen8_read_report_reason(const uint32_t *report)
> {
>-	uint32_t reason = ((report[0] >> OAREPORT_REASON_SHIFT) &
>-			   OAREPORT_REASON_MASK);
>+	uint32_t reason = gen8_report_reason(report);
>
> 	if (reason & (1<<0))
> 		return "timer";
>@@ -3118,6 +3144,268 @@ emit_stall_timestamp_and_rpc(struct intel_batchbuffer *batch,
> 	emit_report_perf_count(batch, dst, report_dst_offset, report_id);
> }
>
>+/* The following register all have the same layout. */
>+#define OAREPORTTRIG2 (0x2744)
>+#define   OAREPORTTRIG2_INVERT_A_0  (1 << 0)
>+#define   OAREPORTTRIG2_INVERT_A_1  (1 << 1)
>+#define   OAREPORTTRIG2_INVERT_A_2  (1 << 2)
>+#define   OAREPORTTRIG2_INVERT_A_3  (1 << 3)
>+#define   OAREPORTTRIG2_INVERT_A_4  (1 << 4)
>+#define   OAREPORTTRIG2_INVERT_A_5  (1 << 5)
>+#define   OAREPORTTRIG2_INVERT_A_6  (1 << 6)
>+#define   OAREPORTTRIG2_INVERT_A_7  (1 << 7)
>+#define   OAREPORTTRIG2_INVERT_A_8  (1 << 8)
>+#define   OAREPORTTRIG2_INVERT_A_9  (1 << 9)
>+#define   OAREPORTTRIG2_INVERT_A_10 (1 << 10)
>+#define   OAREPORTTRIG2_INVERT_A_11 (1 << 11)
>+#define   OAREPORTTRIG2_INVERT_A_12 (1 << 12)
>+#define   OAREPORTTRIG2_INVERT_A_13 (1 << 13)
>+#define   OAREPORTTRIG2_INVERT_A_14 (1 << 14)
>+#define   OAREPORTTRIG2_INVERT_A_15 (1 << 15)
>+#define   OAREPORTTRIG2_INVERT_B_0  (1 << 16)
>+#define   OAREPORTTRIG2_INVERT_B_1  (1 << 17)
>+#define   OAREPORTTRIG2_INVERT_B_2  (1 << 18)
>+#define   OAREPORTTRIG2_INVERT_B_3  (1 << 19)
>+#define   OAREPORTTRIG2_INVERT_C_0  (1 << 20)
>+#define   OAREPORTTRIG2_INVERT_C_1  (1 << 21)
>+#define   OAREPORTTRIG2_INVERT_D_0  (1 << 22)
>+#define   OAREPORTTRIG2_THRESHOLD_ENABLE      (1 << 23)
>+#define   OAREPORTTRIG2_REPORT_TRIGGER_ENABLE (1 << 31)
>+#define OAREPORTTRIG6 (0x2754)
>+#define OA_PERF_COUNTER_A(idx) (0x2800 + 8 * (idx))
>+#define GEN8_OASTATUS (0x2b08)
>+
>+#define GEN12_OAREPORTTRIG2 (0xd924)
>+#define GEN12_OAREPORTTRIG6 (0xd934)
>+#define GEN12_OAG_PERF_COUNTER_A(idx) (0xD980 + 8 * (idx))
>+#define GEN12_OAG_OASTATUS (0xdafc)
>+
>+/*
>+ * We have 2 trigger registers that each generate a different
>+ * report reason.
>+ */
>+static const uint32_t gen8_oa_wl[] = {
>+	OAREPORTTRIG2,
>+	OAREPORTTRIG6,
>+	OA_PERF_COUNTER_A(18),
>+	GEN8_OASTATUS,
>+};
>+static const uint32_t gen12_oa_wl[] = {
>+	GEN12_OAREPORTTRIG2,
>+	GEN12_OAREPORTTRIG6,
>+	GEN12_OAG_PERF_COUNTER_A(18),
>+	GEN12_OAG_OASTATUS,
>+};
>+
>+static void
>+emit_triggered_oa_report(struct intel_batchbuffer *batch,
>+			 uint32_t trigger)
>+{
>+	const uint32_t *triggers = intel_gen(devid) >= 12 ? gen12_oa_wl: gen8_oa_wl;
>+
>+	assert(trigger <= 1);
>+
>+	BEGIN_BATCH(6, 0);
>+	OUT_BATCH(MI_LOAD_REGISTER_IMM);
>+	OUT_BATCH(triggers[trigger]);
>+	OUT_BATCH(OAREPORTTRIG2_INVERT_C_1 |
>+		  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
>+	OUT_BATCH(MI_LOAD_REGISTER_IMM);
>+	OUT_BATCH(triggers[trigger]);
>+	OUT_BATCH(OAREPORTTRIG2_INVERT_C_1 |
>+		  OAREPORTTRIG2_INVERT_D_0 |
>+		  OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
>+	ADVANCE_BATCH();
>+}
>+
>+static uint64_t
>+rcs_timestmap_reg_read(int fd)
>+{
>+	struct drm_i915_reg_read rr = {
>+		.offset = 0x2358 | I915_REG_READ_8B_WA, /* render ring timestamp */
>+	};
>+
>+	do_ioctl(fd, DRM_IOCTL_I915_REG_READ, &rr);
>+
>+	return rr.val;
>+}
>+
>+/*
>+ * Verify that we can trigger OA reports into the OA buffer using
>+ * MI_LRI.
>+ */
>+static void
>+test_triggered_oa_reports(int paranoid)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(1000000);
>+	uint64_t properties[] = {
>+		DRM_I915_PERF_PROP_CTX_HANDLE, UINT64_MAX, /* updated below */
>+
>+		/* Note: we have to specify at least one sample property even
>+		 * though we aren't interested in samples in this case
>+		 */
>+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
>+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
>+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
>+
>+		/* Note: no OA exponent specified in this case */
>+	};
>+	struct drm_i915_perf_open_param param = {
>+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	struct drm_i915_perf_record_header *header;
>+	drm_intel_bufmgr *bufmgr;
>+	drm_intel_context *context;
>+	struct igt_helper_process child = {};
>+	struct intel_batchbuffer *batch;
>+	struct igt_buf src[2], dst[2];
>+	uint64_t timestamp32_mask = (1ull << 32) - 1;
>+	uint64_t timestamps[2];
>+	uint32_t buf_size = 16 * 1024 * 1024;
>+	uint8_t *buf = malloc(buf_size);
>+	uint32_t ctx_id;
>+	int width = 800;
>+	int height = 600;
>+	uint32_t trigger_counts[2] = { 0, };
>+	int ret;
>+
>+	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", paranoid);
>+
>+	do {
>+		igt_fork_helper(&child) {
>+			if (!paranoid)
>+				igt_drop_root();
>+
>+			bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
>+			drm_intel_bufmgr_gem_enable_reuse(bufmgr);
>+
>+			scratch_buf_init(bufmgr, &src[0], width, height, 0xff0000ff);
>+			scratch_buf_init(bufmgr, &dst[0], width, height, 0x00ff00ff);
>+			scratch_buf_init(bufmgr, &src[1], 2 * width, height, 0xff0000ff);
>+			scratch_buf_init(bufmgr, &dst[1], 2 * width, height, 0x00ff00ff);
>+
>+			batch = intel_batchbuffer_alloc(bufmgr, devid);
>+
>+			context = drm_intel_gem_context_create(bufmgr);
>+			igt_assert(context);
>+
>+			ret = drm_intel_gem_context_get_id(context, &ctx_id);
>+			properties[1] = ctx_id;
>+
>+
>+			timestamps[0] = rcs_timestmap_reg_read(drm_fd);
>+
>+			stream_fd = __perf_open(drm_fd, &param, false);
>+
>+			emit_triggered_oa_report(batch, 0);
>+
>+			render_copy(batch,
>+				    context,
>+				    &src[0], 0, 0, width, height,
>+				    &dst[0], 0, 0);
>+
>+			emit_triggered_oa_report(batch, 0);
>+
>+			emit_triggered_oa_report(batch, 1);
>+
>+			render_copy(batch,
>+				    context,
>+				    &src[1], 0, 0, 2 * width, height,
>+				    &dst[1], 0, 0);
>+
>+			emit_triggered_oa_report(batch, 1);
>+
>+			intel_batchbuffer_flush_with_context(batch, context);
>+
>+			/* On some failures, this timestamp is too early as in
>+			 * we bail out before seeing the triggered report. Wait
>+			 * a little more and then check.
>+			 */
>+			usleep(50000);
>+
>+			timestamps[1] = rcs_timestmap_reg_read(drm_fd);
>+
>+			if (timestamps[1] < timestamps[0] ||
>+			    (timestamps[1] & timestamp32_mask) < (timestamps[1] & timestamp32_mask)) {
>+				igt_debug("Timestamp rollover, trying again\n");
>+				exit(EAGAIN);
>+			}
>+
>+			ret = i915_read_reports_until_timestamp(test_set->perf_oa_format,
>+								buf, buf_size,
>+								timestamps[0] & timestamp32_mask,
>+								timestamps[1] & timestamp32_mask);
>+
>+			for (size_t offset = 0; offset < ret; offset += header->size) {
>+				uint32_t *report;
>+
>+				header = (void *)(buf + offset);
>+
>+				igt_assert_eq(header->pad, 0); /* Reserved */
>+
>+				igt_assert_neq(header->type, DRM_I915_PERF_RECORD_OA_BUFFER_LOST);
>+
>+				if (header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST)
>+					continue;
>+
>+				/* Currently the only other record type expected is a
>+				 * _SAMPLE. Notably this test will need updating if
>+				 * i915-perf is extended in the future with additional
>+				 * record types.
>+				 */
>+				igt_assert_eq(header->type, DRM_I915_PERF_RECORD_SAMPLE);
>+
>+				report = (void *)(header + 1);
>+
>+				igt_debug("report ts=0x%08x hw_id=0x%08x reason=%s\n",
>+					  report[1], report[2],
>+					  gen8_read_report_reason(report));
>+
>+				if (gen8_report_reason(report) & OAREPORT_REASON_TRIGGER1) {
>+					igt_assert_eq(trigger_counts[1], 0);
>+					trigger_counts[0]++;
>+				}
>+				if (gen8_report_reason(report) & OAREPORT_REASON_TRIGGER2) {
>+					igt_assert_eq(trigger_counts[0], 2);
>+					trigger_counts[1]++;
>+				}
>+			}
>+
>+			if (paranoid) {
>+				igt_assert_eq(trigger_counts[0], 0);
>+				igt_assert_eq(trigger_counts[1], 0);
>+			} else {
>+				igt_assert_eq(trigger_counts[0], 2);
>+				igt_assert_eq(trigger_counts[1], 2);
>+			}
>+
>+			for (int i = 0; i < ARRAY_SIZE(src); i++) {
>+				drm_intel_bo_unreference(src[i].bo);
>+				drm_intel_bo_unreference(dst[i].bo);
>+			}
>+
>+			intel_batchbuffer_free(batch);
>+			drm_intel_gem_context_destroy(context);
>+			drm_intel_bufmgr_destroy(bufmgr);
>+			__perf_close(stream_fd);
>+		}
>+
>+
>+		ret = igt_wait_helper(&child);
>+
>+		igt_assert(WEXITSTATUS(ret) == EAGAIN ||
>+			   WEXITSTATUS(ret) == 0);
>+
>+	} while (WEXITSTATUS(ret) == EAGAIN);
>+
>+	free(buf);
>+}
>+
> /* Tests the INTEL_performance_query use case where an unprivileged process
>  * should be able to configure the OA unit for per-context metrics (for a
>  * context associated with that process' drm file descriptor) and the counters
>@@ -4768,6 +5056,122 @@ test_whitelisted_registers_userspace_config(void)
> 	i915_perf_remove_config(drm_fd, config_id);
> }
>
>+#define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
>+
>+static uint32_t gen12_wl_slots[] = {
>+	0x24d0, 0x24d4, 0x24d8, 0x24dc, 0x24e0, 0x24e4, 0x24e8, 0x24ec,
>+	0x24f0, 0x24f4, 0x24f8, 0x24fc, 0x2010, 0x2014, 0x2018, 0x201c,
>+	0x21e0, 0x21e4, 0x21e8, 0x21ec,
>+};
>+
>+static uint32_t gen9_wl_slots[] = {
>+	0x24d0, 0x24d4, 0x24d8, 0x24dc, 0x24e0, 0x24e4, 0x24e8, 0x24ec,
>+	0x24f0, 0x24f4, 0x24f8, 0x24fc,
>+};
>+
>+static void dump_wl(uint32_t *slots, uint32_t count)
>+{
>+	int i;
>+
>+	for (i = 0; i < count; i++)
>+		igt_debug("LOCAL: FORCE_TO_NON_PRIV_%02d = %08x\n",
>+			  i, intel_register_read(&mmio_data, slots[i]));
>+}
>+
>+static void dump_whitelist(const char *msg)
>+{
>+	igt_debug("%s\n", msg);
>+
>+	if (intel_gen(devid) >= 12)
>+		dump_wl(gen12_wl_slots, ARRAY_SIZE(gen12_wl_slots));
>+	else if (intel_gen(devid) > 8)
>+		dump_wl(gen9_wl_slots, ARRAY_SIZE(gen9_wl_slots));
>+	else
>+		return;
>+}
>+
>+static bool in_whitelist(uint32_t reg)
>+{
>+	uint32_t *slots, count;
>+	int i;
>+
>+	if (intel_gen(devid) >= 12) {
>+		slots = gen12_wl_slots;
>+		count = ARRAY_SIZE(gen12_wl_slots);
>+	} else {
>+		slots = gen9_wl_slots;
>+		count = ARRAY_SIZE(gen9_wl_slots);
>+	}
>+
>+	for (i = 0; i < count; i++) {
>+		uint32_t fpriv = intel_register_read(&mmio_data, slots[i]);
>+
>+		if ((fpriv & RING_FORCE_TO_NONPRIV_ADDRESS_MASK) == reg)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+static void oa_regs_in_whitelist(bool are_present)
>+{
>+	const uint32_t *regs;
>+	uint32_t count;
>+	int i;
>+
>+	if (intel_gen(devid) >= 12) {
>+		regs = gen12_oa_wl;
>+		count = i915_perf_revision(drm_fd) >= 7 ?
>+			ARRAY_SIZE(gen12_oa_wl) : 2;
>+	} else {
>+		regs = gen8_oa_wl;
>+		count = i915_perf_revision(drm_fd) >= 7 ?
>+			ARRAY_SIZE(gen8_oa_wl) : 2;
>+	}
>+
>+	for (i = 0; i < count; i++)
>+		if (are_present)
>+			igt_assert(in_whitelist(regs[i]));
>+		else
>+			igt_assert(!in_whitelist(regs[i]));
>+}
>+
>+static void test_oa_regs_whitelist(int paranoid)
>+{
>+	uint64_t properties[] = {
>+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
>+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
>+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
>+
>+	};
>+	struct drm_i915_perf_open_param param = {
>+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", paranoid);
>+	intel_register_access_init(&mmio_data, intel_get_pci_device(),
>+				   0, drm_fd);
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	dump_whitelist("oa whitelisted");
>+
>+	if (paranoid)
>+		oa_regs_in_whitelist(false);
>+	else
>+		oa_regs_in_whitelist(true);
>+
>+	__perf_close(stream_fd);
>+
>+	dump_whitelist("oa remove whitelist");
>+
>+	/* after perf close, whitelist should be removed */
>+	oa_regs_in_whitelist(false);
>+
>+	intel_register_access_fini(&mmio_data);
>+}
>+
> static unsigned
> read_i915_module_ref(void)
> {
>@@ -4880,23 +5284,6 @@ test_sysctl_defaults(void)
> 	igt_assert_eq(max_freq, 100000);
> }
>
>-static int i915_perf_revision(int fd)
>-{
>-	drm_i915_getparam_t gp;
>-	int value = 1, ret;
>-
>-	gp.param = I915_PARAM_PERF_REVISION;
>-	gp.value = &value;
>-	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
>-	if (ret == -1) {
>-		/* If the param is missing, consider version 1. */
>-		igt_assert_eq(errno, EINVAL);
>-		return 1;
>-	}
>-
>-	return value;
>-}
>-
> igt_main
> {
> 	igt_fixture {
>@@ -5096,6 +5483,30 @@ igt_main
> 	igt_subtest("whitelisted-registers-userspace-config")
> 		test_whitelisted_registers_userspace_config();
>
>+
>+	igt_subtest_group {
>+		igt_fixture {
>+			igt_require(intel_gen(devid) > 8);
>+			igt_require(i915_perf_revision(drm_fd) >= 6);
>+		}
>+
>+		igt_describe("Verify that OA registers are whitelisted for paranoid 0");
>+		igt_subtest("oa-regs-whitelisted")
>+			test_oa_regs_whitelist(0);
>+
>+		igt_describe("Verify that OA registers are not whitelisted for paranoid 1");
>+		igt_subtest("oa-regs-not-whitelisted")
>+			test_oa_regs_whitelist(1);
>+
>+		igt_describe("Verify reports triggered when perf_stream_paranoid is 0");
>+		igt_subtest("triggered-oa-reports-paranoid-0")
>+			test_triggered_oa_reports(0);
>+
>+		igt_describe("Verify reports not triggered when perf_stream_paranoid is 1");
>+		igt_subtest("triggered-oa-reports-paranoid-1")
>+			test_triggered_oa_reports(1);
>+	}
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
>-- 
>2.20.1
>
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
