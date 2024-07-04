Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E0BC3814E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2603810E02A;
	Thu,  4 Jul 2024 01:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnlHcaKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3143010E02A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055507; x=1751591507;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aE/TQsLW4iQ+885iDjeYTmnJvO+3GGtcUSu5xcK2XCo=;
 b=lnlHcaKUiVkJi0C3eMBXdnpGANAUvbbgq1ipZf53MYikr8ZaiN458X5A
 SG4BuDTeP6G3prMI9IINmgIn6yJInWvtSgwhDUF7w1TjoMhdKhZXwg75b
 Fau0QIc73OZfvBEj3B6Pesg1cVu/Gh106/5cY/g+pr2HEWcKPi69kn8CH
 0lOtJwJKeuMrBUhunskrcFHsIpM66b/csP2RyTn6XtQp8dbHi4dJNJlnC
 3jLMhlj/BXNnexsS/IdYvOtKhmBE4Z861SZyueNmKf/GXNj+8bRMwjrnh
 ECLitA8vluKOrGmtq0vb0R5IXQ49UGLJQPtiFOMHzeSA5qdbJmO7qg0gY w==;
X-CSE-ConnectionGUID: plnVPJqLSGKO/Ga3y0XZTg==
X-CSE-MsgGUID: k9BTsYiQSqaEnBLLFGAhlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450014"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
X-CSE-ConnectionGUID: xaRAHXoyQ8qWr3CTHxUD8g==
X-CSE-MsgGUID: xpEe2hbSTLuJq6pgzZK1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320136"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:45 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/15] tests/intel/xe_oa: Add oa exponent tests
Date: Wed,  3 Jul 2024 18:11:33 -0700
Message-ID: <20240704011142.2618968-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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

Add "invalid-oa-exponent" and "oa-exponents".

v2: Remove ICL specific functionality (Umesh)
v3: Rename xe perf layer as xe observation layer

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 407 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 407 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index fde8694977..96fae6840f 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -409,6 +409,27 @@ static u64 oa_format_fields(u64 name)
 }
 #define __ff oa_format_fields
 
+static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct drm_xe_oa_unit *oau;
+	u8 *poau;
+
+	poau = (u8 *)&qoa->oa_units[0];
+	for (int i = 0; i < qoa->num_oa_units; i++) {
+		oau = (struct drm_xe_oa_unit *)poau;
+
+		if (i == n) {
+			hwe = &oau->eci[random() % oau->num_engines];
+			break;
+		}
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	return hwe;
+}
+
 static void
 __perf_close(int fd)
 {
@@ -603,6 +624,64 @@ max_oa_exponent_for_period_lte(uint64_t period)
 	return -1;
 }
 
+static uint64_t
+oa_exponent_to_ns(int exponent)
+{
+       return 1000000000ULL * (2ULL << exponent) / intel_xe_perf->devinfo.timestamp_frequency;
+}
+
+static bool
+oa_report_ctx_is_valid(uint32_t *report)
+{
+	return report[0] & (1ul << 16);
+}
+
+static uint32_t
+oa_report_get_ctx_id(uint32_t *report)
+{
+	if (!oa_report_ctx_is_valid(report))
+		return 0xffffffff;
+	return report[2];
+}
+
+static void *buf_map(int fd, struct intel_buf *buf, bool write)
+{
+	void *p;
+
+	if (is_xe_device(fd)) {
+		buf->ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+		p = buf->ptr;
+	} else {
+		if (gem_has_llc(fd))
+			p = intel_buf_cpu_map(buf, write);
+		else
+			p = intel_buf_device_map(buf, write);
+	}
+	return p;
+}
+
+static void
+scratch_buf_memset(struct intel_buf *buf, int width, int height, uint32_t color)
+{
+	buf_map(buf_ops_get_fd(buf->bops), buf, true);
+
+	for (int i = 0; i < width * height; i++)
+		buf->ptr[i] = color;
+
+	intel_buf_unmap(buf);
+}
+
+static void
+scratch_buf_init(struct buf_ops *bops,
+		 struct intel_buf *buf,
+		 int width, int height,
+		 uint32_t color)
+{
+	intel_buf_init(bops, buf, width, height, 32, 0,
+		       I915_TILING_NONE, I915_COMPRESSION_NONE);
+	scratch_buf_memset(buf, width, height, color);
+}
+
 static bool
 oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
 {
@@ -1261,6 +1340,296 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 }
 
 
+enum load {
+	LOW,
+	HIGH
+};
+
+#define LOAD_HELPER_PAUSE_USEC 500
+
+static struct load_helper {
+	int devid;
+	struct buf_ops *bops;
+	uint32_t context_id;
+	uint32_t vm;
+	struct intel_bb *ibb;
+	enum load load;
+	bool exit;
+	struct igt_helper_process igt_proc;
+	struct intel_buf src, dst;
+} lh = { 0, };
+
+static void load_helper_signal_handler(int sig)
+{
+	if (sig == SIGUSR2)
+		lh.load = lh.load == LOW ? HIGH : LOW;
+	else
+		lh.exit = true;
+}
+
+static void load_helper_set_load(enum load load)
+{
+	igt_assert(lh.igt_proc.running);
+
+	if (lh.load == load)
+		return;
+
+	lh.load = load;
+	kill(lh.igt_proc.pid, SIGUSR2);
+}
+
+static void load_helper_run(enum load load)
+{
+	if (!render_copy)
+		return;
+
+	/*
+	 * FIXME fork helpers won't get cleaned up when started from within a
+	 * subtest, so handle the case where it sticks around a bit too long.
+	 */
+	if (lh.igt_proc.running) {
+		load_helper_set_load(load);
+		return;
+	}
+
+	lh.load = load;
+
+	igt_fork_helper(&lh.igt_proc) {
+		signal(SIGUSR1, load_helper_signal_handler);
+		signal(SIGUSR2, load_helper_signal_handler);
+
+		while (!lh.exit) {
+			render_copy(lh.ibb,
+				    &lh.src, 0, 0, 1920, 1080,
+				    &lh.dst, 0, 0);
+
+			intel_bb_sync(lh.ibb);
+
+			/* Lower the load by pausing after every submitted
+			 * write. */
+			if (lh.load == LOW)
+				usleep(LOAD_HELPER_PAUSE_USEC);
+		}
+	}
+}
+
+static void load_helper_stop(void)
+{
+	if (!render_copy)
+		return;
+
+	kill(lh.igt_proc.pid, SIGUSR1);
+	igt_assert(igt_wait_helper(&lh.igt_proc) == 0);
+}
+
+static void load_helper_init(void)
+{
+	if (!render_copy) {
+		igt_info("Running test without render_copy\n");
+		return;
+	}
+
+	lh.devid = intel_get_drm_devid(drm_fd);
+	lh.bops = buf_ops_create(drm_fd);
+	lh.vm = xe_vm_create(drm_fd, 0, 0);
+	lh.context_id = xe_exec_queue_create(drm_fd, lh.vm, &xe_engine(drm_fd, 0)->instance, 0);
+	igt_assert_neq(lh.context_id, 0xffffffff);
+
+	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, lh.vm, NULL, BATCH_SZ);
+
+	scratch_buf_init(lh.bops, &lh.dst, 1920, 1080, 0);
+	scratch_buf_init(lh.bops, &lh.src, 1920, 1080, 0);
+}
+
+static void load_helper_fini(void)
+{
+	if (!render_copy)
+		return;
+
+	if (lh.igt_proc.running)
+		load_helper_stop();
+
+	intel_buf_close(lh.bops, &lh.src);
+	intel_buf_close(lh.bops, &lh.dst);
+	intel_bb_destroy(lh.ibb);
+	xe_exec_queue_destroy(drm_fd, lh.context_id);
+	xe_vm_destroy(drm_fd, lh.vm);
+	buf_ops_destroy(lh.bops);
+}
+
+static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta)
+{
+	return delta <= expected_delta;
+}
+
+/**
+ * SUBTEST: oa-exponents
+ * Description: Test that oa exponent values behave as expected
+ */
+static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	/* It's asking a lot to sample with a 160 nanosecond period and the
+	 * test can fail due to buffer overflows if it wasn't possible to
+	 * keep up, so we don't start from an exponent of zero...
+	 */
+	for (int exponent = 5; exponent < 20; exponent++) {
+		uint64_t properties[] = {
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+			/* Include OA reports in samples */
+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
+			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		};
+		struct intel_xe_oa_open_prop param = {
+			.num_properties = ARRAY_SIZE(properties) / 2,
+			.properties_ptr = to_user_pointer(properties),
+		};
+		uint64_t expected_timestamp_delta = 2ULL << exponent;
+		size_t format_size = get_oa_format(fmt).size;
+		int max_reports = MAX_OA_BUF_SIZE / format_size;
+		int buf_size = format_size * max_reports * 1.5;
+		uint8_t *buf = calloc(1, buf_size);
+		int ret, n_timer_reports = 0;
+		uint32_t matches = 0;
+#define NUM_TIMER_REPORTS 30
+		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
+		uint32_t *timer_reports = reports;
+
+		igt_debug("testing OA exponent %d,"
+			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
+			  exponent, expected_timestamp_delta,
+			  oa_exponent_to_ns(exponent),
+			  oa_exponent_to_ns(exponent) / 1000.0,
+			  oa_exponent_to_ns(exponent) / (1000.0 * 1000.0));
+
+		stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+
+		while (n_timer_reports < NUM_TIMER_REPORTS) {
+			u32 oa_status = 0;
+
+			while ((ret = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
+				;
+			if (errno == EIO) {
+				oa_status = get_stream_status(stream_fd);
+				igt_debug("oa_status %#x\n", oa_status);
+				continue;
+			}
+
+			/* igt_debug(" > read %i bytes\n", ret); */
+			/* We should never have no data. */
+			igt_assert(ret > 0);
+
+			for (int offset = 0;
+			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
+			     offset += format_size) {
+				uint32_t *report = (void *)(buf + offset);
+
+				if (oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW) {
+					igt_assert(!"reached");
+					break;
+				}
+
+				if (oa_status & DRM_XE_OASTATUS_REPORT_LOST)
+					igt_debug("report loss\n");
+
+				if (!oa_report_is_periodic(exponent, report))
+					continue;
+
+				memcpy(timer_reports, report, format_size);
+				n_timer_reports++;
+				timer_reports += (format_size / 4);
+			}
+		}
+
+		__perf_close(stream_fd);
+
+		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
+			  oa_timestamp(&reports[0], fmt),
+			  oa_report_get_ctx_id(&reports[0]));
+		for (int i = 1; i < n_timer_reports; i++) {
+			uint64_t delta = oa_timestamp_delta(&reports[i],
+							    &reports[i - 1],
+							    fmt);
+
+			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
+				  oa_timestamp(&reports[i], fmt),
+				  oa_report_get_ctx_id(&reports[i]),
+				  delta, expected_report_timing_delta(delta,
+								      expected_timestamp_delta) ? "" : "******");
+
+			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
+		}
+
+		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
+
+		/*
+		 * Expect half the reports to match the timing
+		 * expectation. The results are quite erratic because
+		 * the condition under which the HW reaches
+		 * expectations depends on memory controller pressure
+		 * etc...
+		 */
+		igt_assert_lte(n_timer_reports / 2, matches);
+
+		free(reports);
+	}
+
+	load_helper_stop();
+	load_helper_fini();
+}
+
+/**
+ * SUBTEST: invalid-oa-exponent
+ * Description: Test that invalid exponent values are rejected
+ */
+/* The OA exponent selects a timestamp counter bit to trigger reports on.
+ *
+ * With a 64bit timestamp and least significant bit approx == 80ns then the MSB
+ * equates to > 40 thousand years and isn't exposed via the xe oa interface.
+ *
+ * The max exponent exposed is expected to be 31, which is still a fairly
+ * ridiculous period (>5min) but is the maximum exponent where it's still
+ * possible to use periodic sampling as a means for tracking the overflow of
+ * 32bit OA report timestamps.
+ */
+static void test_invalid_oa_exponent(void)
+{
+	uint64_t properties[] = {
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, 31, /* maximum exponent expected
+						       to be accepted */
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	__perf_close(stream_fd);
+
+	for (int i = 32; i < 65; i++) {
+		properties[7] = i;
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+	}
+}
+
 static unsigned read_xe_module_ref(void)
 {
 	FILE *fp = fopen("/proc/modules", "r");
@@ -1377,6 +1746,37 @@ test_sysctl_defaults(void)
 	igt_assert_eq(paranoid, 1);
 }
 
+static const char *xe_engine_class_name(uint32_t engine_class)
+{
+	switch (engine_class) {
+		case DRM_XE_ENGINE_CLASS_RENDER:
+			return "rcs";
+		case DRM_XE_ENGINE_CLASS_COPY:
+			return "bcs";
+		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+			return "vcs";
+		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			return "vecs";
+		case DRM_XE_ENGINE_CLASS_COMPUTE:
+			return "ccs";
+		default:
+			igt_warn("Engine class 0x%x unknown\n", engine_class);
+			return "unknown";
+	}
+}
+
+#define __for_one_hwe_in_each_oa_unit(hwe) \
+	for (int m = 0; !m || hwe; m++) \
+		for_each_if(hwe = oa_unit_engine(drm_fd, m)) \
+			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
+				      hwe->engine_instance)
+
+/* Only OAG (not OAM) is currently supported */
+#define __for_one_hwe_in_oag(hwe) \
+	if ((hwe = oa_unit_engine(drm_fd, 0))) \
+		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
+			      hwe->engine_instance)
+
 #define __for_one_render_engine_0(hwe) \
 	xe_for_each_engine(drm_fd, hwe) \
 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
@@ -1450,6 +1850,13 @@ igt_main
 		__for_one_render_engine(hwe)
 			test_oa_formats(hwe);
 
+	igt_subtest("invalid-oa-exponent")
+		test_invalid_oa_exponent();
+
+	igt_subtest_with_dynamic("oa-exponents")
+		__for_one_hwe_in_oag(hwe)
+			test_oa_exponents(hwe);
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

