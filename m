Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1476FC2D0D1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504F10EBE2;
	Thu, 20 Jun 2024 20:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYt0c5Rf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69F310E190
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913660; x=1750449660;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fcg/9+vBKRRsAgM7g/vpiG0DVR7ox9wdFtSVJNYmcyw=;
 b=IYt0c5RfLav7+wejLeli36wVUkzlqBam91eIFvMbeH7dfTNidGZ39sjL
 1HSSHbFPRlO4dzX5I54u6NPbG1JmgjgKEwvnPNZa1wzN5xsvKbLeZMD6F
 F3DzyrYsSxhoOb1Hm+dTUBtuk+jhiaXxFPyNIgiLHQQS147uesXQNUe3K
 9ZOLSAmke3XMtBZpQiao+5KOHXbQJH8sNDd8S/oAuBWen9SjQQ6IXxyT7
 kbgnWfLmEA7BI6JRxs++IF7/7BImLDO8rI5Sur15gl0r/2MSOQYJuEs4Y
 bokpUH559RYhVBugaxiYoVzsDPSlAlVGqorF6Kr0iq4yOPIdJNDfkW+hr g==;
X-CSE-ConnectionGUID: Xnrcc8eTR1SPemGROkVe2w==
X-CSE-MsgGUID: 4JDmsKPlQzi0Zj2PJYxmRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329334"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
X-CSE-ConnectionGUID: HEE1KCOBQwKjd8YANJqH1w==
X-CSE-MsgGUID: /HMxYJY+R2uvBo7ELa8LZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459855"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/28] tests/intel/xe_oa: OAR/OAC tests
Date: Thu, 20 Jun 2024 13:00:41 -0700
Message-ID: <20240620200054.3550653-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

"mi-rpc", "oa-tlb-invalidate" and "unprivileged-single-ctx-counters" tests.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 698 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 698 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index d7f00e78b9..c4a45568aa 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -597,6 +597,18 @@ read_report_reason(const uint32_t *report)
 		return "unknown";
 }
 
+static uint32_t
+cs_timestamp_frequency(int fd)
+{
+	return xe_gt_list(drm_fd)->gt_list[0].reference_clock;
+}
+
+static uint64_t
+cs_timebase_scale(uint32_t u32_delta)
+{
+	return ((uint64_t)u32_delta * NSEC_PER_SEC) / cs_timestamp_frequency(drm_fd);
+}
+
 static uint64_t
 oa_timestamp(const uint32_t *report, enum intel_xe_oa_format_name format)
 {
@@ -663,6 +675,15 @@ oa_report_get_ctx_id(uint32_t *report)
 	return report[2];
 }
 
+static int
+oar_unit_default_format(void)
+{
+	if (IS_DG2(devid) || IS_METEORLAKE(devid))
+		return XE_OAR_FORMAT_A32u40_A4u32_B8_C8;
+
+	return default_test_set->perf_oa_format;
+}
+
 static void *buf_map(int fd, struct intel_buf *buf, bool write)
 {
 	void *p;
@@ -701,6 +722,21 @@ scratch_buf_init(struct buf_ops *bops,
 	scratch_buf_memset(buf, width, height, color);
 }
 
+static void
+emit_report_perf_count(struct intel_bb *ibb,
+		       struct intel_buf *dst,
+		       int dst_offset,
+		       uint32_t report_id)
+{
+	intel_bb_add_intel_buf(ibb, dst, true);
+
+	intel_bb_out(ibb, OA_MI_REPORT_PERF_COUNT);
+	intel_bb_emit_reloc(ibb, dst->handle,
+			    I915_GEM_DOMAIN_INSTRUCTION, I915_GEM_DOMAIN_INSTRUCTION,
+			    dst_offset, dst->addr.offset);
+	intel_bb_out(ibb, report_id);
+}
+
 static bool
 oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
 {
@@ -741,6 +777,31 @@ get_40bit_a_delta(uint64_t value0, uint64_t value1)
 		return value1 - value0;
 }
 
+static void
+accumulate_uint32(size_t offset,
+		  uint32_t *report0,
+                  uint32_t *report1,
+                  uint64_t *delta)
+{
+	uint32_t value0 = *(uint32_t *)(((uint8_t *)report0) + offset);
+	uint32_t value1 = *(uint32_t *)(((uint8_t *)report1) + offset);
+
+	*delta += (uint32_t)(value1 - value0);
+}
+
+static void
+accumulate_uint40(int a_index,
+                  uint32_t *report0,
+                  uint32_t *report1,
+		  enum intel_xe_oa_format_name format,
+                  uint64_t *delta)
+{
+	uint64_t value0 = read_40bit_a_counter(report0, format, a_index),
+		 value1 = read_40bit_a_counter(report1, format, a_index);
+
+	*delta += get_40bit_a_delta(value0, value1);
+}
+
 static void
 accumulate_uint64(int a_index,
 		  const uint32_t *report0,
@@ -754,6 +815,78 @@ accumulate_uint64(int a_index,
 	*delta += (value1 - value0);
 }
 
+static void
+accumulate_reports(struct accumulator *accumulator,
+		   uint32_t *start,
+		   uint32_t *end)
+{
+	struct oa_format format = get_oa_format(accumulator->format);
+	uint64_t *deltas = accumulator->deltas;
+	int idx = 0;
+
+	/* timestamp */
+	deltas[idx] += oa_timestamp_delta(end, start, accumulator->format);
+	idx++;
+
+	/* clock cycles */
+	deltas[idx] += oa_tick_delta(end, start, accumulator->format);
+	idx++;
+
+	for (int i = 0; i < format.n_a40; i++) {
+		accumulate_uint40(i, start, end, accumulator->format,
+				  deltas + idx++);
+	}
+
+	for (int i = 0; i < format.n_a64; i++) {
+		accumulate_uint64(i, start, end, accumulator->format,
+				  deltas + idx++);
+	}
+
+	for (int i = 0; i < format.n_a; i++) {
+		accumulate_uint32(format.a_off + 4 * i,
+				  start, end, deltas + idx++);
+	}
+
+	for (int i = 0; i < format.n_b; i++) {
+		accumulate_uint32(format.b_off + 4 * i,
+				  start, end, deltas + idx++);
+	}
+
+	for (int i = 0; i < format.n_c; i++) {
+		accumulate_uint32(format.c_off + 4 * i,
+				  start, end, deltas + idx++);
+	}
+}
+
+static void
+accumulator_print(struct accumulator *accumulator, const char *title)
+{
+	struct oa_format format = get_oa_format(accumulator->format);
+	uint64_t *deltas = accumulator->deltas;
+	int idx = 0;
+
+	igt_debug("%s:\n", title);
+	igt_debug("\ttime delta = %"PRIu64"\n", deltas[idx++]);
+	igt_debug("\tclock cycle delta = %"PRIu64"\n", deltas[idx++]);
+
+	for (int i = 0; i < format.n_a40; i++)
+		igt_debug("\tA%u = %"PRIu64"\n", i, deltas[idx++]);
+
+	for (int i = 0; i < format.n_a64; i++)
+		igt_debug("\tA64_%u = %"PRIu64"\n", i, deltas[idx++]);
+
+	for (int i = 0; i < format.n_a; i++) {
+		int a_id = format.first_a + i;
+		igt_debug("\tA%u = %"PRIu64"\n", a_id, deltas[idx++]);
+	}
+
+	for (int i = 0; i < format.n_a; i++)
+		igt_debug("\tB%u = %"PRIu64"\n", i, deltas[idx++]);
+
+	for (int i = 0; i < format.n_c; i++)
+		igt_debug("\tC%u = %"PRIu64"\n", i, deltas[idx++]);
+}
+
 /* The TestOa metric set is designed so */
 static void
 sanity_check_reports(const uint32_t *oa_report0, const uint32_t *oa_report1,
@@ -2165,6 +2298,92 @@ static void test_polling_small_buf(void)
 		   0.20 * n_expect_read_bytes);
 }
 
+static int
+num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
+			   int64_t *duration_ns, int fmt)
+{
+	uint8_t buf[1024 * 1024];
+	int64_t start, end;
+	int num_reports = 0;
+	size_t format_size = get_oa_format(fmt).size;
+
+	igt_debug("Expected duration = %"PRId64"\n", *duration_ns);
+
+	stream_fd = __perf_open(drm_fd, param, true);
+
+	start = get_time();
+	do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
+	for (/* nop */; ((end = get_time()) - start) < *duration_ns; /* nop */) {
+		int ret;
+
+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
+		       (errno == EINTR || errno == EIO))
+			;
+
+		igt_assert(ret > 0);
+
+		for (int offset = 0; offset < ret; offset += format_size) {
+			uint32_t *report = (void *)(buf + offset);
+
+			if (report_reason(report) & OAREPORT_REASON_TIMER)
+				num_reports++;
+		}
+	}
+	__perf_close(stream_fd);
+
+	*duration_ns = end - start;
+
+	igt_debug("Actual duration = %"PRIu64"\n", *duration_ns);
+
+	return num_reports;
+}
+
+/**
+ * SUBTEST: oa-tlb-invalidate
+ * Description: Open OA stream twice to verify OA TLB invalidation
+ */
+static void
+test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	int num_reports1, num_reports2, num_expected_reports;
+	int64_t duration;
+
+	/* Capture reports for 5 seconds twice and then make sure you get around
+	 * the same number of reports. In the case of failure, the number of
+	 * reports will vary largely since the beginning of the OA buffer
+	 * will have invalid entries.
+	 */
+	duration = 5LL * NSEC_PER_SEC;
+	num_reports1 = num_valid_reports_captured(&param, &duration, test_set->perf_oa_format);
+	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
+	igt_debug("expected num reports = %d\n", num_expected_reports);
+	igt_debug("actual num reports = %d\n", num_reports1);
+	igt_assert(num_reports1 > 0.95 * num_expected_reports);
+
+	duration = 5LL * NSEC_PER_SEC;
+	num_reports2 = num_valid_reports_captured(&param, &duration, test_set->perf_oa_format);
+	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
+	igt_debug("expected num reports = %d\n", num_expected_reports);
+	igt_debug("actual num reports = %d\n", num_reports2);
+	igt_assert(num_reports2 > 0.95 * num_expected_reports);
+}
+
 /**
  * SUBTEST: buffer-fill
  * Description: Test filling, wraparound and overflow of OA buffer
@@ -2750,6 +2969,468 @@ test_disabled_read_error(void)
 	__perf_close(stream_fd);
 }
 
+/**
+ * SUBTEST: mi-rpc
+ * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
+ */
+static void
+test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
+
+{
+	uint64_t fmt = ((IS_DG2(devid) || IS_METEORLAKE(devid)) &&
+			hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) ?
+		XE_OAC_FORMAT_A24u64_B8_C8 : oar_unit_default_format();
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* On Gen12, MI RPC uses OAR. OAR is configured only for the
+		 * render context that wants to measure the performance. Hence a
+		 * context must be specified in the gen12 MI RPC when compared
+		 * to previous gens.
+		 *
+		 * Have a random value here for the context id, but initialize
+		 * it once you figure out the context ID for the work to be
+		 * measured
+		 */
+		DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID, UINT64_MAX,
+
+		/* OA unit configuration:
+		 * DRM_XE_OA_PROPERTY_SAMPLE_OA is no longer required for Gen12
+		 * because the OAR unit increments counters only for the
+		 * relevant context. No other parameters are needed since we do
+		 * not rely on the OA buffer anymore to normalize the counter
+		 * values.
+		 */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	struct intel_buf *buf;
+#define INVALID_CTX_ID 0xffffffff
+	uint32_t ctx_id = INVALID_CTX_ID;
+	uint32_t vm = 0;
+	uint32_t *report32;
+	size_t format_size_32;
+	struct oa_format format = get_oa_format(fmt);
+
+	/* Ensure perf_stream_paranoid is set to 1 by default */
+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+	bops = buf_ops_create(drm_fd);
+	vm = xe_vm_create(drm_fd, 0, 0);
+	ctx_id = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	igt_assert_neq(ctx_id, INVALID_CTX_ID);
+	properties[3] = ctx_id;
+
+	ibb = intel_bb_create_with_context(drm_fd, ctx_id, vm, NULL, BATCH_SZ);
+	buf = intel_buf_create(bops, 4096, 1, 8, 64,
+			       I915_TILING_NONE, I915_COMPRESSION_NONE);
+
+	buf_map(drm_fd, buf, true);
+	memset(buf->ptr, 0x80, 4096);
+	intel_buf_unmap(buf);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+#define REPORT_ID 0xdeadbeef
+#define REPORT_OFFSET 0
+	emit_report_perf_count(ibb,
+			       buf,
+			       REPORT_OFFSET,
+			       REPORT_ID);
+	intel_bb_flush_render(ibb);
+	intel_bb_sync(ibb);
+
+	buf_map(drm_fd, buf, false);
+	report32 = buf->ptr;
+	format_size_32 = format.size >> 2;
+	dump_report(report32, format_size_32, "mi-rpc");
+
+	/* Sanity check reports
+	 * reportX_32[0]: report id passed with mi-rpc
+	 * reportX_32[1]: timestamp. NOTE: wraps around in ~6 minutes.
+	 *
+	 * reportX_32[format.b_off]: check if the entire report was filled.
+	 * B0 counter falls in the last 64 bytes of this report format.
+	 * Since reports are filled in 64 byte blocks, we should be able to
+	 * assure that the report was filled by checking the B0 counter. B0
+	 * counter is defined to be zero, so we can easily validate it.
+	 *
+	 * reportX_32[format_size_32]: outside report, make sure only the report
+	 * size amount of data was written.
+	 */
+	igt_assert_eq(report32[0], REPORT_ID);
+	igt_assert(oa_timestamp(report32, test_set->perf_oa_format));
+	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
+	igt_assert_eq(report32[format_size_32], 0x80808080);
+
+	intel_buf_unmap(buf);
+	intel_buf_destroy(buf);
+	intel_bb_destroy(ibb);
+	xe_exec_queue_destroy(drm_fd, ctx_id);
+	xe_vm_destroy(drm_fd, vm);
+	buf_ops_destroy(bops);
+	__perf_close(stream_fd);
+}
+
+static void
+emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
+			     struct intel_buf *dst,
+			     int timestamp_offset,
+			     int report_dst_offset,
+			     uint32_t report_id)
+{
+	uint32_t pipe_ctl_flags = (PIPE_CONTROL_CS_STALL |
+				   PIPE_CONTROL_RENDER_TARGET_FLUSH |
+				   PIPE_CONTROL_WRITE_TIMESTAMP);
+
+	intel_bb_add_intel_buf(ibb, dst, true);
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
+	intel_bb_out(ibb, pipe_ctl_flags);
+	intel_bb_emit_reloc(ibb, dst->handle,
+			    I915_GEM_DOMAIN_INSTRUCTION, I915_GEM_DOMAIN_INSTRUCTION,
+			    timestamp_offset, dst->addr.offset);
+	intel_bb_out(ibb, 0); /* imm lower */
+	intel_bb_out(ibb, 0); /* imm upper */
+
+	emit_report_perf_count(ibb, dst, report_dst_offset, report_id);
+}
+
+static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = oar_unit_default_format();
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Have a random value here for the context id, but initialize
+		 * it once you figure out the context ID for the work to be
+		 * measured
+		 */
+		DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID, UINT64_MAX,
+
+		/* OA unit configuration:
+		 * DRM_XE_OA_PROPERTY_SAMPLE_OA is no longer required for Gen12
+		 * because the OAR unit increments counters only for the
+		 * relevant context. No other parameters are needed since we do
+		 * not rely on the OA buffer anymore to normalize the counter
+		 * values.
+		 */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	struct buf_ops *bops;
+	struct intel_bb *ibb0, *ibb1;
+	struct intel_buf src[3], dst[3], *dst_buf;
+	uint32_t context0_id, context1_id, vm = 0;
+	uint32_t *report0_32, *report1_32, *report2_32, *report3_32;
+	uint64_t timestamp0_64, timestamp1_64;
+	uint64_t delta_ts64, delta_oa32;
+	uint64_t delta_ts64_ns, delta_oa32_ns;
+	uint64_t delta_delta;
+	int width = 800;
+	int height = 600;
+#define INVALID_CTX_ID 0xffffffff
+	uint32_t ctx0_id = INVALID_CTX_ID;
+	uint32_t ctx1_id = INVALID_CTX_ID;
+	int ret;
+	struct accumulator accumulator = {
+		.format = fmt
+	};
+
+	bops = buf_ops_create(drm_fd);
+
+	for (int i = 0; i < ARRAY_SIZE(src); i++) {
+		scratch_buf_init(bops, &src[i], width, height, 0xff0000ff);
+		scratch_buf_init(bops, &dst[i], width, height, 0x00ff00ff);
+	}
+
+	vm = xe_vm_create(drm_fd, 0, 0);
+	context0_id = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	context1_id = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	ibb0 = intel_bb_create_with_context(drm_fd, context0_id, vm, NULL, BATCH_SZ);
+	ibb1 = intel_bb_create_with_context(drm_fd, context1_id, vm, NULL, BATCH_SZ);
+
+	igt_debug("submitting warm up render_copy\n");
+
+	/* Submit some early, unmeasured, work to the context we want */
+	render_copy(ibb0,
+		    &src[0], 0, 0, width, height,
+		    &dst[0], 0, 0);
+
+	/* Initialize the context parameter to the perf open ioctl here */
+	properties[3] = context0_id;
+
+	igt_debug("opening xe oa stream\n");
+	stream_fd = __perf_open(drm_fd, &param, false);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	dst_buf = intel_buf_create(bops, 4096, 1, 8, 64,
+				   I915_TILING_NONE,
+				   I915_COMPRESSION_NONE);
+
+	/* Set write domain to cpu briefly to fill the buffer with 80s */
+	buf_map(drm_fd, dst_buf, true /* write enable */);
+	memset(dst_buf->ptr, 0x80, 2048);
+	memset((uint8_t *) dst_buf->ptr + 2048, 0, 2048);
+	intel_buf_unmap(dst_buf);
+
+	/* Submit an mi-rpc to context0 before measurable work */
+#define BO_TIMESTAMP_OFFSET0 1024
+#define BO_REPORT_OFFSET0 0
+#define BO_REPORT_ID0 0xdeadbeef
+	emit_stall_timestamp_and_rpc(ibb0,
+				     dst_buf,
+				     BO_TIMESTAMP_OFFSET0,
+				     BO_REPORT_OFFSET0,
+				     BO_REPORT_ID0);
+	intel_bb_flush_render(ibb0);
+
+	/* Remove intel_buf from ibb0 added implicitly in rendercopy */
+	intel_bb_remove_intel_buf(ibb0, dst_buf);
+
+	/* This is the work/context that is measured for counter increments */
+	render_copy(ibb0,
+		    &src[0], 0, 0, width, height,
+		    &dst[0], 0, 0);
+	intel_bb_flush_render(ibb0);
+
+	/* Submit an mi-rpc to context1 before work
+	 *
+	 * On gen12, this measurement should just yield counters that are
+	 * all zeroes, since the counters will only increment for the
+	 * context passed to perf open ioctl
+	 */
+#define BO_TIMESTAMP_OFFSET2 1040
+#define BO_REPORT_OFFSET2 512
+#define BO_REPORT_ID2 0x00c0ffee
+	emit_stall_timestamp_and_rpc(ibb1,
+				     dst_buf,
+				     BO_TIMESTAMP_OFFSET2,
+				     BO_REPORT_OFFSET2,
+				     BO_REPORT_ID2);
+	intel_bb_flush_render(ibb1);
+
+	/* Submit two copies on the other context to avoid a false
+	 * positive in case the driver somehow ended up filtering for
+	 * context1
+	 */
+	render_copy(ibb1,
+		    &src[1], 0, 0, width, height,
+		    &dst[1], 0, 0);
+
+	render_copy(ibb1,
+		    &src[2], 0, 0, width, height,
+		    &dst[2], 0, 0);
+	intel_bb_flush_render(ibb1);
+
+	/* Submit an mi-rpc to context1 after all work */
+#define BO_TIMESTAMP_OFFSET3 1048
+#define BO_REPORT_OFFSET3 768
+#define BO_REPORT_ID3 0x01c0ffee
+	emit_stall_timestamp_and_rpc(ibb1,
+				     dst_buf,
+				     BO_TIMESTAMP_OFFSET3,
+				     BO_REPORT_OFFSET3,
+				     BO_REPORT_ID3);
+	intel_bb_flush_render(ibb1);
+
+	/* Remove intel_buf from ibb1 added implicitly in rendercopy */
+	intel_bb_remove_intel_buf(ibb1, dst_buf);
+
+	/* Submit an mi-rpc to context0 after all measurable work */
+#define BO_TIMESTAMP_OFFSET1 1032
+#define BO_REPORT_OFFSET1 256
+#define BO_REPORT_ID1 0xbeefbeef
+	emit_stall_timestamp_and_rpc(ibb0,
+				     dst_buf,
+				     BO_TIMESTAMP_OFFSET1,
+				     BO_REPORT_OFFSET1,
+				     BO_REPORT_ID1);
+	intel_bb_flush_render(ibb0);
+	intel_bb_sync(ibb0);
+	intel_bb_sync(ibb1);
+
+	buf_map(drm_fd, dst_buf, false);
+
+	/* Sanity check reports
+	 * reportX_32[0]: report id passed with mi-rpc
+	 * reportX_32[1]: timestamp
+	 * reportX_32[2]: context id
+	 *
+	 * report0_32: start of measurable work
+	 * report1_32: end of measurable work
+	 * report2_32: start of other work
+	 * report3_32: end of other work
+	 */
+	report0_32 = dst_buf->ptr;
+	igt_assert_eq(report0_32[0], 0xdeadbeef);
+	igt_assert(oa_timestamp(report0_32, fmt));
+	ctx0_id = report0_32[2];
+	igt_debug("MI_RPC(start) CTX ID: %u\n", ctx0_id);
+	dump_report(report0_32, 64, "report0_32");
+
+	report1_32 = report0_32 + 64;
+	igt_assert_eq(report1_32[0], 0xbeefbeef);
+	igt_assert(oa_timestamp(report1_32, fmt));
+	ctx1_id = report1_32[2];
+	igt_debug("CTX ID1: %u\n", ctx1_id);
+	dump_report(report1_32, 64, "report1_32");
+
+	/* Verify that counters in context1 are all zeroes */
+	report2_32 = report0_32 + 128;
+	igt_assert_eq(report2_32[0], 0x00c0ffee);
+	igt_assert(oa_timestamp(report2_32, fmt));
+	dump_report(report2_32, 64, "report2_32");
+	igt_assert_eq(0, memcmp(&report2_32[4],
+				(uint8_t *) dst_buf->ptr + 2048,
+				240));
+
+	report3_32 = report0_32 + 192;
+	igt_assert_eq(report3_32[0], 0x01c0ffee);
+	igt_assert(oa_timestamp(report3_32, fmt));
+	dump_report(report3_32, 64, "report3_32");
+	igt_assert_eq(0, memcmp(&report3_32[4],
+				(uint8_t *) dst_buf->ptr + 2048,
+				240));
+
+	/* Accumulate deltas for counters - A0, A21 and A26 */
+	memset(accumulator.deltas, 0, sizeof(accumulator.deltas));
+	accumulate_reports(&accumulator, report0_32, report1_32);
+	igt_debug("total: A0 = %"PRIu64", A21 = %"PRIu64", A26 = %"PRIu64"\n",
+			accumulator.deltas[2 + 0],
+			accumulator.deltas[2 + 21],
+			accumulator.deltas[2 + 26]);
+
+	igt_debug("oa_timestamp32 0 = %"PRIu64"\n", oa_timestamp(report0_32, fmt));
+	igt_debug("oa_timestamp32 1 = %"PRIu64"\n", oa_timestamp(report1_32, fmt));
+	igt_debug("ctx_id 0 = %u\n", report0_32[2]);
+	igt_debug("ctx_id 1 = %u\n", report1_32[2]);
+
+	/* The delta as calculated via the PIPE_CONTROL timestamp or
+	 * the OA report timestamps should be almost identical but
+	 * allow a 500 nanoseconds margin.
+	 */
+	timestamp0_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET0);
+	timestamp1_64 = *(uint64_t *)(((uint8_t *)dst_buf->ptr) + BO_TIMESTAMP_OFFSET1);
+
+	igt_debug("ts_timestamp64 0 = %"PRIu64"\n", timestamp0_64);
+	igt_debug("ts_timestamp64 1 = %"PRIu64"\n", timestamp1_64);
+
+	delta_ts64 = timestamp1_64 - timestamp0_64;
+	delta_oa32 = oa_timestamp_delta(report1_32, report0_32, fmt);
+
+	/* Sanity check that we can pass the delta to timebase_scale */
+	delta_oa32_ns = timebase_scale(delta_oa32);
+	delta_ts64_ns = cs_timebase_scale(delta_ts64);
+
+	igt_debug("oa32 delta = %"PRIu64", = %"PRIu64"ns\n",
+			delta_oa32, delta_oa32_ns);
+	igt_debug("ts64 delta = %"PRIu64", = %"PRIu64"ns\n",
+			delta_ts64, delta_ts64_ns);
+
+	delta_delta = delta_ts64_ns > delta_oa32_ns ?
+		      (delta_ts64_ns - delta_oa32_ns) :
+		      (delta_oa32_ns - delta_ts64_ns);
+	if (delta_delta > 500) {
+		igt_debug("delta_delta = %"PRIu64". exceeds margin, skipping..\n",
+			  delta_delta);
+		exit(EAGAIN);
+	}
+
+	igt_debug("n samples written = %"PRIu64"/%"PRIu64" (%ix%i)\n",
+		  accumulator.deltas[2 + 21],
+		  accumulator.deltas[2 + 26],
+		  width, height);
+	accumulator_print(&accumulator, "filtered");
+
+	/* Verify that the work actually happened by comparing the src
+	 * and dst buffers
+	 */
+	buf_map(drm_fd, &src[0], false);
+	buf_map(drm_fd, &dst[0], false);
+
+	ret = memcmp(src[0].ptr, dst[0].ptr, 4 * width * height);
+	intel_buf_unmap(&src[0]);
+	intel_buf_unmap(&dst[0]);
+
+	if (ret != 0) {
+		accumulator_print(&accumulator, "total");
+		exit(EAGAIN);
+	}
+
+	/* FIXME: can we deduce the presence of A26 from get_oa_format(fmt)? */
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+		goto skip_check;
+
+	/* Check that this test passed. The test measures the number of 2x2
+	 * samples written to the render target using the counter A26. For
+	 * OAR, this counter will only have increments relevant to this specific
+	 * context. The value equals the width * height of the rendered work.
+	 */
+	igt_assert_eq(accumulator.deltas[2 + 26], width * height);
+
+ skip_check:
+	/* Clean up */
+	for (int i = 0; i < ARRAY_SIZE(src); i++) {
+		intel_buf_close(bops, &src[i]);
+		intel_buf_close(bops, &dst[i]);
+	}
+
+	intel_buf_unmap(dst_buf);
+	intel_buf_destroy(dst_buf);
+	intel_bb_destroy(ibb0);
+	intel_bb_destroy(ibb1);
+	xe_exec_queue_destroy(drm_fd, context0_id);
+	xe_exec_queue_destroy(drm_fd, context1_id);
+	xe_vm_destroy(drm_fd, vm);
+	buf_ops_destroy(bops);
+	__perf_close(stream_fd);
+}
+
+/**
+ * SUBTEST: unprivileged-single-ctx-counters
+ * Description: A harder test for OAR/OAC using MI_REPORT_PERF_COUNT
+ */
+static void
+test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instance *hwe)
+{
+	int child_ret;
+	struct igt_helper_process child = {};
+
+	/* Ensure perf_stream_paranoid is set to 1 by default */
+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+	do {
+		igt_fork_helper(&child) {
+			/* A local device for local resources. */
+			drm_fd = drm_reopen_driver(drm_fd);
+
+			igt_drop_root();
+
+			single_ctx_helper(hwe);
+
+			drm_close_driver(drm_fd);
+		}
+		child_ret = igt_wait_helper(&child);
+		igt_assert(WEXITSTATUS(child_ret) == EAGAIN ||
+			   WEXITSTATUS(child_ret) == 0);
+	} while (WEXITSTATUS(child_ret) == EAGAIN);
+}
+
 static unsigned read_xe_module_ref(void)
 {
 	FILE *fp = fopen("/proc/modules", "r");
@@ -3017,6 +3698,23 @@ igt_main
 	igt_subtest("short-reads")
 		test_short_reads();
 
+	igt_subtest_group {
+		igt_subtest_with_dynamic("mi-rpc")
+			__for_one_hwe_in_oag(hwe)
+				test_mi_rpc(hwe);
+
+		igt_subtest_with_dynamic("oa-tlb-invalidate")
+			__for_one_hwe_in_oag(hwe)
+				test_oa_tlb_invalidate(hwe);
+
+		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
+			igt_require_f(render_copy, "no render-copy function\n");
+			igt_require(intel_graphics_ver(devid) < IP_VER(20, 0));
+			__for_one_render_engine(hwe)
+				test_single_ctx_render_target_writes_a_counter(hwe);
+		}
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
-- 
2.41.0

