Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CCC48BF6
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7FB10ED06;
	Fri, 16 Feb 2024 23:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j33Vpu1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8B310ECE9
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125433; x=1739661433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=co81hqOxVSOuPz9BA1hYoKRsXtj4YIO0OsvPtqO9CVA=;
 b=j33Vpu1r2B4BKsosfXyOoBbbgvbNlo3Lrm1lblnPfXECVde9telQvr2V
 aRN3kOR3rVsRPaWtkwzVsoGHuMBDq86lZy/A6G005fgEecovMgQhkqAMC
 stZVxpnkyUwBox8YuOFsFW9Tk69G6B98vjwFkFfFaFncgVlI8+53jVnPq
 BXzdvgQtVFbUhbIOPvGLFFMmx9AQAdvog2EkKEyRh0ksZFoF0ORqf9PNY
 ecobJIMMjUCtjpR8sUg+dPGo9VVSpFn6EDkVgx32zpszeHOx2RgLqGF28
 IQRq5Tr9Pj4XX2la2s35cdMW+Lw9VYKqTk76QVo2YVYyEeBItGyFtioBx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724285"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626881"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 10/18] tests/intel/xe_oa: Add "oa-formats" subtest
Date: Fri, 16 Feb 2024 15:16:55 -0800
Message-ID: <20240216231703.845644-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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

Add "oa-formats" subtest.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 550 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 550 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e1ad1dd3d901..74277b906575 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -330,6 +330,9 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
 		.bc_report = 0 },
 };
 
+/* No A counters currently reserved/undefined for gen8+ so far */
+static bool undefined_a_counters[45];
+
 static int drm_fd = -1;
 static int sysfs = -1;
 static int pm_fd = -1;
@@ -516,6 +519,57 @@ write_u64_file(const char *path, uint64_t val)
 	fclose(f);
 }
 
+static uint64_t
+read_report_ticks(const uint32_t *report, enum xe_oa_format_name format)
+{
+
+	struct oa_format fmt = get_oa_format(format);
+
+	return fmt.report_hdr_64bit ? *(uint64_t *)&report[6] : report[3];
+}
+
+/*
+ * t0 is a value sampled before t1. width is number of bits used to represent
+ * t0/t1. Normally t1 is greater than t0. In cases where t1 < t0 use this
+ * helper. Since the size of t1/t0 is already 64 bits, no special handling is
+ * needed for width = 64.
+ */
+static uint64_t
+elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
+{
+	uint32_t max_bits = sizeof(t1) * 8;
+
+	igt_assert(width <= max_bits);
+
+	if (t1 < t0 && width != max_bits)
+		return ((1ULL << width) - t0) + t1;
+
+	return t1 - t0;
+}
+
+static uint64_t
+oa_tick_delta(const uint32_t *report1,
+	      const uint32_t *report0,
+	      enum xe_oa_format_name format)
+{
+	return elapsed_delta(read_report_ticks(report1, format),
+			     read_report_ticks(report0, format), 32);
+}
+
+static void
+read_report_clock_ratios(const uint32_t *report,
+			      uint32_t *slice_freq_mhz,
+			      uint32_t *unslice_freq_mhz)
+{
+	uint32_t unslice_freq = report[0] & 0x1ff;
+	uint32_t slice_freq_low = (report[0] >> 25) & 0x7f;
+	uint32_t slice_freq_high = (report[0] >> 9) & 0x3;
+	uint32_t slice_freq = slice_freq_low | (slice_freq_high << 7);
+
+	*slice_freq_mhz = (slice_freq * 16666) / 1000;
+	*unslice_freq_mhz = (unslice_freq * 16666) / 1000;
+}
+
 static uint32_t
 report_reason(const uint32_t *report)
 {
@@ -523,6 +577,27 @@ report_reason(const uint32_t *report)
 		OAREPORT_REASON_MASK);
 }
 
+static const char *
+read_report_reason(const uint32_t *report)
+{
+	uint32_t reason = report_reason(report);
+
+	if (reason & (1<<0))
+		return "timer";
+	else if (reason & (1<<1))
+	      return "internal trigger 1";
+	else if (reason & (1<<2))
+	      return "internal trigger 2";
+	else if (reason & (1<<3))
+	      return "context switch";
+	else if (reason & (1<<4))
+	      return "GO 1->0 transition (enter RC6)";
+	else if (reason & (1<<5))
+		return "[un]slice clock ratio change";
+	else
+		return "unknown";
+}
+
 static uint64_t
 oa_timestamp(const uint32_t *report, enum xe_oa_format_name format)
 {
@@ -531,6 +606,17 @@ oa_timestamp(const uint32_t *report, enum xe_oa_format_name format)
 	return fmt.report_hdr_64bit ? *(uint64_t *)&report[2] : report[1];
 }
 
+static uint64_t
+oa_timestamp_delta(const uint32_t *report1,
+		   const uint32_t *report0,
+		   enum xe_oa_format_name format)
+{
+	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
+
+	return elapsed_delta(oa_timestamp(report1, format),
+			     oa_timestamp(report0, format), width);
+}
+
 static uint64_t
 timebase_scale(uint64_t delta)
 {
@@ -567,6 +653,191 @@ oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
 	return false;
 }
 
+static uint64_t
+read_40bit_a_counter(const uint32_t *report,
+			  enum xe_oa_format_name fmt, int a_id)
+{
+	struct oa_format format = get_oa_format(fmt);
+	uint8_t *a40_high = (((uint8_t *)report) + format.a40_high_off);
+	uint32_t *a40_low = (uint32_t *)(((uint8_t *)report) +
+					 format.a40_low_off);
+	uint64_t high = (uint64_t)(a40_high[a_id]) << 32;
+
+	return a40_low[a_id] | high;
+}
+
+static uint64_t
+xehpsdv_read_64bit_a_counter(const uint32_t *report, enum xe_oa_format_name fmt, int a_id)
+{
+	struct oa_format format = get_oa_format(fmt);
+	uint64_t *a64 = (uint64_t *)(((uint8_t *)report) + format.a64_off);
+
+	return a64[a_id];
+}
+
+static uint64_t
+get_40bit_a_delta(uint64_t value0, uint64_t value1)
+{
+	if (value0 > value1)
+		return (1ULL << 40) + value1 - value0;
+	else
+		return value1 - value0;
+}
+
+static void
+accumulate_uint64(int a_index,
+		  const uint32_t *report0,
+		  const uint32_t *report1,
+		  enum xe_oa_format_name format,
+		  uint64_t *delta)
+{
+	uint64_t value0 = xehpsdv_read_64bit_a_counter(report0, format, a_index),
+		 value1 = xehpsdv_read_64bit_a_counter(report1, format, a_index);
+
+	*delta += (value1 - value0);
+}
+
+/* The TestOa metric set is designed so */
+static void
+sanity_check_reports(const uint32_t *oa_report0, const uint32_t *oa_report1,
+		     enum xe_oa_format_name fmt)
+{
+	struct oa_format format = get_oa_format(fmt);
+	uint64_t time_delta = timebase_scale(oa_timestamp_delta(oa_report1,
+								oa_report0,
+								fmt));
+	uint64_t clock_delta = oa_tick_delta(oa_report1, oa_report0, fmt);
+	uint64_t max_delta;
+	uint64_t freq;
+	uint32_t *rpt0_b = (uint32_t *)(((uint8_t *)oa_report0) +
+					format.b_off);
+	uint32_t *rpt1_b = (uint32_t *)(((uint8_t *)oa_report1) +
+					format.b_off);
+	uint32_t b;
+	uint32_t ref;
+
+	igt_debug("report type: %s->%s\n",
+		  read_report_reason(oa_report0),
+		  read_report_reason(oa_report1));
+
+	freq = time_delta ? (clock_delta * 1000) / time_delta : 0;
+	igt_debug("freq = %"PRIu64"\n", freq);
+
+	igt_debug("clock delta = %"PRIu64"\n", clock_delta);
+
+	max_delta = clock_delta * intel_perf->devinfo.n_eus;
+
+	/* Gen8+ has some 40bit A counters... */
+	for (int j = format.first_a40; j < format.n_a40 + format.first_a40; j++) {
+		uint64_t value0 = read_40bit_a_counter(oa_report0, fmt, j);
+		uint64_t value1 = read_40bit_a_counter(oa_report1, fmt, j);
+		uint64_t delta = get_40bit_a_delta(value0, value1);
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A40_%d: delta = %"PRIu64"\n", j, delta);
+		igt_assert_f(delta <= max_delta,
+			     "A40_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
+			     j, delta, max_delta);
+	}
+
+	for (int j = 0; j < format.n_a64; j++) {
+		uint64_t delta = 0;
+
+		accumulate_uint64(j, oa_report0, oa_report1, fmt, &delta);
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A64_%d: delta = %"PRIu64"\n", format.first_a + j, delta);
+		igt_assert_f(delta <= max_delta,
+			     "A64_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
+			     format.first_a + j, delta, max_delta);
+	}
+
+	for (int j = 0; j < format.n_a; j++) {
+		uint32_t *a0 = (uint32_t *)(((uint8_t *)oa_report0) +
+					    format.a_off);
+		uint32_t *a1 = (uint32_t *)(((uint8_t *)oa_report1) +
+					    format.a_off);
+		int a_id = format.first_a + j;
+		uint32_t delta = a1[j] - a0[j];
+
+		if (undefined_a_counters[a_id])
+			continue;
+
+		igt_debug("A%d: delta = %"PRIu32"\n", a_id, delta);
+		igt_assert_f(delta <= max_delta,
+			     "A%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
+			     a_id, delta, max_delta);
+	}
+
+	/* The TestOa metric set defines all B counters to be a
+	 * multiple of the gpu clock
+	 */
+	if (format.n_b && (format.oa_type == DRM_XE_OA_FMT_TYPE_OAG || format.oa_type == DRM_XE_OA_FMT_TYPE_OAR)) {
+		if (clock_delta > 0) {
+			b = rpt1_b[0] - rpt0_b[0];
+			igt_debug("B0: delta = %"PRIu32"\n", b);
+			igt_assert_eq(b, 0);
+
+			b = rpt1_b[1] - rpt0_b[1];
+			igt_debug("B1: delta = %"PRIu32"\n", b);
+			igt_assert_eq(b, clock_delta);
+
+			b = rpt1_b[2] - rpt0_b[2];
+			igt_debug("B2: delta = %"PRIu32"\n", b);
+			igt_assert_eq(b, clock_delta);
+
+			b = rpt1_b[3] - rpt0_b[3];
+			ref = clock_delta / 2;
+			igt_debug("B3: delta = %"PRIu32"\n", b);
+			igt_assert(b >= ref - 1 && b <= ref + 1);
+
+			b = rpt1_b[4] - rpt0_b[4];
+			ref = clock_delta / 3;
+			igt_debug("B4: delta = %"PRIu32"\n", b);
+			igt_assert(b >= ref - 1 && b <= ref + 1);
+
+			b = rpt1_b[5] - rpt0_b[5];
+			ref = clock_delta / 3;
+			igt_debug("B5: delta = %"PRIu32"\n", b);
+			igt_assert(b >= ref - 1 && b <= ref + 1);
+
+			b = rpt1_b[6] - rpt0_b[6];
+			ref = clock_delta / 6;
+			igt_debug("B6: delta = %"PRIu32"\n", b);
+			igt_assert(b >= ref - 1 && b <= ref + 1);
+
+			b = rpt1_b[7] - rpt0_b[7];
+			ref = clock_delta * 2 / 3;
+			igt_debug("B7: delta = %"PRIu32"\n", b);
+			igt_assert(b >= ref - 1 && b <= ref + 1);
+		} else {
+			for (int j = 0; j < format.n_b; j++) {
+				b = rpt1_b[j] - rpt0_b[j];
+				igt_debug("B%i: delta = %"PRIu32"\n", j, b);
+				igt_assert_eq(b, 0);
+			}
+		}
+	}
+
+	for (int j = 0; j < format.n_c; j++) {
+		uint32_t *c0 = (uint32_t *)(((uint8_t *)oa_report0) +
+					    format.c_off);
+		uint32_t *c1 = (uint32_t *)(((uint8_t *)oa_report1) +
+					    format.c_off);
+		uint32_t delta = c1[j] - c0[j];
+
+		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu64"\n",
+			  j, delta, max_delta);
+		igt_assert_f(delta <= max_delta,
+			     "C%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
+			     j, delta, max_delta);
+	}
+}
+
 static bool
 init_sys_info(void)
 {
@@ -854,6 +1125,264 @@ read_2_oa_reports(int format_id,
 	igt_assert(!"reached");
 }
 
+static void
+open_and_read_2_oa_reports(int format_id,
+			   int exponent,
+			   uint32_t *oa_report0,
+			   uint32_t *oa_report1,
+			   bool timer_only,
+			   const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(format_id),
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	set_fd_flags(stream_fd, O_CLOEXEC);
+
+	read_2_oa_reports(format_id, exponent,
+			  oa_report0, oa_report1, timer_only);
+
+	__perf_close(stream_fd);
+}
+
+static void
+print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
+{
+	struct oa_format format = get_oa_format(fmt);
+	uint64_t ts0 = oa_timestamp(oa_report0, fmt);
+	uint64_t ts1 = oa_timestamp(oa_report1, fmt);
+
+	igt_debug("TIMESTAMP: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+		  ts0, ts1, ts1 - ts0);
+
+	{
+		uint64_t clock0 = read_report_ticks(oa_report0, fmt);
+		uint64_t clock1 = read_report_ticks(oa_report1, fmt);
+
+		igt_debug("CLOCK: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+			  clock0, clock1, clock1 - clock0);
+	}
+
+	{
+		uint32_t slice_freq0, slice_freq1, unslice_freq0, unslice_freq1;
+		const char *reason0 = read_report_reason(oa_report0);
+		const char *reason1 = read_report_reason(oa_report1);
+
+		igt_debug("CTX ID: 1st = %"PRIu32", 2nd = %"PRIu32"\n",
+			  oa_report0[2], oa_report1[2]);
+
+		read_report_clock_ratios(oa_report0,
+					 &slice_freq0, &unslice_freq0);
+		read_report_clock_ratios(oa_report1,
+					 &slice_freq1, &unslice_freq1);
+
+		igt_debug("SLICE CLK: 1st = %umhz, 2nd = %umhz, delta = %d\n",
+			  slice_freq0, slice_freq1,
+			  ((int)slice_freq1 - (int)slice_freq0));
+		igt_debug("UNSLICE CLK: 1st = %umhz, 2nd = %umhz, delta = %d\n",
+			  unslice_freq0, unslice_freq1,
+			  ((int)unslice_freq1 - (int)unslice_freq0));
+
+		igt_debug("REASONS: 1st = \"%s\", 2nd = \"%s\"\n", reason0, reason1);
+	}
+
+	/* Gen8+ has some 40bit A counters... */
+	for (int j = 0; j < format.n_a40; j++) {
+		uint64_t value0 = read_40bit_a_counter(oa_report0, fmt, j);
+		uint64_t value1 = read_40bit_a_counter(oa_report1, fmt, j);
+		uint64_t delta = get_40bit_a_delta(value0, value1);
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A%d: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+			  j, value0, value1, delta);
+	}
+
+	for (int j = 0; j < format.n_a64; j++) {
+		uint64_t value0 = xehpsdv_read_64bit_a_counter(oa_report0, fmt, j);
+		uint64_t value1 = xehpsdv_read_64bit_a_counter(oa_report1, fmt, j);
+		uint64_t delta = value1 - value0;
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A_64%d: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
+			  format.first_a + j, value0, value1, delta);
+	}
+
+	for (int j = 0; j < format.n_a; j++) {
+		uint32_t *a0 = (uint32_t *)(((uint8_t *)oa_report0) +
+					    format.a_off);
+		uint32_t *a1 = (uint32_t *)(((uint8_t *)oa_report1) +
+					    format.a_off);
+		int a_id = format.first_a + j;
+		uint32_t delta = a1[j] - a0[j];
+
+		if (undefined_a_counters[a_id])
+			continue;
+
+		igt_debug("A%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
+			  a_id, a0[j], a1[j], delta);
+	}
+
+	for (int j = 0; j < format.n_b; j++) {
+		uint32_t *b0 = (uint32_t *)(((uint8_t *)oa_report0) +
+					    format.b_off);
+		uint32_t *b1 = (uint32_t *)(((uint8_t *)oa_report1) +
+					    format.b_off);
+		uint32_t delta = b1[j] - b0[j];
+
+		igt_debug("B%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
+			  j, b0[j], b1[j], delta);
+	}
+
+	for (int j = 0; j < format.n_c; j++) {
+		uint32_t *c0 = (uint32_t *)(((uint8_t *)oa_report0) +
+					    format.c_off);
+		uint32_t *c1 = (uint32_t *)(((uint8_t *)oa_report1) +
+					    format.c_off);
+		uint32_t delta = c1[j] - c0[j];
+
+		igt_debug("C%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
+			  j, c0[j], c1[j], delta);
+	}
+}
+
+/* Debug function, only useful when reports don't make sense. */
+#if 0
+static void
+print_report(uint32_t *report, int fmt)
+{
+	struct oa_format format = get_oa_format(fmt);
+
+	igt_debug("TIMESTAMP: %"PRIu64"\n", oa_timestamp(report, fmt));
+
+	{
+		uint64_t clock = read_report_ticks(report, fmt);
+
+		igt_debug("CLOCK: %"PRIu64"\n", clock);
+	}
+
+	{
+		uint32_t slice_freq, unslice_freq;
+		const char *reason = read_report_reason(report);
+
+		read_report_clock_ratios(report, &slice_freq, &unslice_freq);
+
+		igt_debug("SLICE CLK: %umhz\n", slice_freq);
+		igt_debug("UNSLICE CLK: %umhz\n", unslice_freq);
+		igt_debug("REASON: \"%s\"\n", reason);
+		igt_debug("CTX ID: %"PRIu32"/%"PRIx32"\n", report[2], report[2]);
+	}
+
+	/* Gen8+ has some 40bit A counters... */
+	for (int j = 0; j < format.n_a40; j++) {
+		uint64_t value = read_40bit_a_counter(report, fmt, j);
+
+		if (undefined_a_counters[j])
+			continue;
+
+		igt_debug("A%d: %"PRIu64"\n", j, value);
+	}
+
+	for (int j = 0; j < format.n_a; j++) {
+		uint32_t *a = (uint32_t *)(((uint8_t *)report) +
+					   format.a_off);
+		int a_id = format.first_a + j;
+
+		if (undefined_a_counters[a_id])
+			continue;
+
+		igt_debug("A%d: %"PRIu32"\n", a_id, a[j]);
+	}
+
+	for (int j = 0; j < format.n_b; j++) {
+		uint32_t *b = (uint32_t *)(((uint8_t *)report) +
+					   format.b_off);
+
+		igt_debug("B%d: %"PRIu32"\n", j, b[j]);
+	}
+
+	for (int j = 0; j < format.n_c; j++) {
+		uint32_t *c = (uint32_t *)(((uint8_t *)report) +
+					   format.c_off);
+
+		igt_debug("C%d: %"PRIu32"\n", j, c[j]);
+	}
+}
+#endif
+
+static bool
+hwe_supports_oa_type(int oa_type, const struct drm_xe_engine_class_instance *hwe)
+{
+	switch (oa_type) {
+	case DRM_XE_OA_FMT_TYPE_OAM:
+	case DRM_XE_OA_FMT_TYPE_OAM_MPEC:
+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
+		       hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case DRM_XE_OA_FMT_TYPE_OAG:
+	case DRM_XE_OA_FMT_TYPE_OAR:
+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER;
+	case DRM_XE_OA_FMT_TYPE_OAC:
+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
+	case DRM_XE_OA_FMT_TYPE_PEC:
+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+		       hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
+	default:
+		return false;
+	}
+
+}
+
+/**
+ * SUBTEST: oa-formats
+ * Description: Test that supported OA formats work as expected
+ */
+static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
+{
+	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
+		struct oa_format format = get_oa_format(i);
+		uint32_t oa_report0[format.size / 4];
+		uint32_t oa_report1[format.size / 4];
+
+		if (!format.name) /* sparse, indexed by ID */
+			continue;
+
+		if (!hwe_supports_oa_type(format.oa_type, hwe))
+			continue;
+
+		igt_debug("Checking OA format %s\n", format.name);
+
+		open_and_read_2_oa_reports(i,
+					   oa_exp_1_millisec,
+					   oa_report0,
+					   oa_report1,
+					   false, /* timer reports only */
+					   hwe);
+
+		print_reports(oa_report0, oa_report1, i);
+		sanity_check_reports(oa_report0, oa_report1, i);
+	}
+}
+
+
 static unsigned read_xe_module_ref(void)
 {
 	FILE *fp = fopen("/proc/modules", "r");
@@ -970,8 +1499,25 @@ test_sysctl_defaults(void)
 	igt_assert_eq(paranoid, 1);
 }
 
+#define __for_one_render_engine_0(hwe) \
+	xe_for_each_engine(drm_fd, hwe) \
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
+			break; \
+	for_each_if(hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
+		igt_dynamic_f("rcs-%d", hwe->engine_instance)
+
+#define __for_one_render_engine(hwe)	      \
+	for (int m = 0, done = 0; !done; m++) \
+		for_each_if(m < xe_number_engines(drm_fd) && \
+			    (hwe = &xe_engine(drm_fd, m)->instance) && \
+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER && \
+			    (done = 1)) \
+			igt_dynamic_f("rcs-%d", hwe->engine_instance)
+
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe = NULL;
+
 	igt_fixture {
 		struct stat sb;
 
@@ -1022,6 +1568,10 @@ igt_main
 	igt_subtest("missing-sample-flags")
 		test_missing_sample_flags();
 
+	igt_subtest_with_dynamic("oa-formats")
+		__for_one_render_engine(hwe)
+			test_oa_formats(hwe);
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
-- 
2.41.0

