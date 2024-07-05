Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91406C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 21:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDDA10EAE3;
	Fri,  5 Jul 2024 21:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtckDODs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547610E0CC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720215809; x=1751751809;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w43vX6wGXdoCV8mIeEujL485q7HvlVGkij6LrQn1JI4=;
 b=NtckDODsuDCg3uDxgJ1GWju9PD0q1fuo3gr/OirEM7Zizkm5AkKuYbLx
 UZoorS3Ze0t95XISuawg26qmxGALbubPiBIf7Eke1dqnFPGXauZbsLVkd
 wLmBZSjMtFsDbtiO/zNLvT9Yncdw7PDHHTgdiR2Po2V4Gwv3brxyExscd
 0nHzBdtX71ATDXcmUZUjIG3D8LAtchEz1HM+4lXTEeylpggifiWAJK/Wm
 lpn9jFI4zNlmHDaZOCIGo+kST32oB5nfYj6Qz9dy2u3poj0bvChZwvAgf
 0hvgRvoLcetlurlTSfsFH4JOZgoVTUNnpwFQLiUz02hY78cL40o6zc8xu g==;
X-CSE-ConnectionGUID: CFKbsaHDSeeO7H7qS9M8nw==
X-CSE-MsgGUID: SvKEwhZHRD6hAWskP6EVwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28907018"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="28907018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 14:43:28 -0700
X-CSE-ConnectionGUID: mFS5D/QrReSQIiCCcjvxsg==
X-CSE-MsgGUID: DuouwywuTXaGoEaTlxpaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="46902539"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 14:43:29 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/15] tests/intel/xe_oa: buffer-fill, non-zero-reason,
 enable-disable
Date: Fri,  5 Jul 2024 14:43:08 -0700
Message-ID: <20240705214316.2695090-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240705214316.2695090-1-ashutosh.dixit@intel.com>
References: <20240705214316.2695090-1-ashutosh.dixit@intel.com>
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

Add the following tests:
	"buffer-fill"
	"non-zero-reason"
	"disabled-read-error"
	"enable-disable"
	"short-reads"

v2: Rename xe perf layer as xe observation layer

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 606 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 606 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f0890d4d14..40bc0902dd 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1630,6 +1630,591 @@ static void test_invalid_oa_exponent(void)
 	}
 }
 
+/**
+ * SUBTEST: buffer-fill
+ * Description: Test filling, wraparound and overflow of OA buffer
+ */
+static void
+test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
+{
+	/* ~5 micro second period */
+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t report_size = get_oa_format(fmt).size;
+	int buf_size = 65536 * report_size;
+	uint8_t *buf = malloc(buf_size);
+	int len;
+	size_t oa_buf_size = MAX_OA_BUF_SIZE;
+	int n_full_oa_reports = oa_buf_size / report_size;
+	uint64_t fill_duration = n_full_oa_reports * oa_period;
+	uint32_t *last_periodic_report = malloc(report_size);
+	u32 oa_status;
+
+	igt_assert(fill_duration < 1000000000);
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	for (int i = 0; i < 5; i++) {
+		bool overflow_seen;
+		uint32_t n_periodic_reports;
+		uint32_t first_timestamp = 0, last_timestamp = 0;
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+		nanosleep(&(struct timespec){ .tv_sec = 0,
+					      .tv_nsec = fill_duration * 1.25 },
+			  NULL);
+again:
+		oa_status = 0;
+		while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
+			;
+
+		if (errno == EIO) {
+			oa_status = get_stream_status(stream_fd);
+			igt_debug("oa_status %#x\n", oa_status);
+			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
+			igt_assert_eq(overflow_seen, true);
+			goto again;
+		}
+		igt_assert_neq(len, -1);
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+		igt_debug("fill_duration = %"PRIu64"ns, oa_exponent = %u\n",
+			  fill_duration, oa_exponent);
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+		nanosleep(&(struct timespec){ .tv_sec = 0,
+					.tv_nsec = fill_duration / 2 },
+			NULL);
+
+		n_periodic_reports = 0;
+
+		/* Because of the race condition between notification of new
+		 * reports and reports landing in memory, we need to rely on
+		 * timestamps to figure whether we've read enough of them.
+		 */
+		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
+
+			igt_debug("dts=%u elapsed=%"PRIu64" duration=%"PRIu64"\n",
+				  last_timestamp - first_timestamp,
+				  (last_timestamp - first_timestamp) * oa_period,
+				  fill_duration / 2);
+again_1:
+			oa_status = 0;
+			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
+				;
+			if (errno == EIO) {
+				oa_status = get_stream_status(stream_fd);
+				igt_debug("oa_status %#x\n", oa_status);
+				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
+				goto again_1;
+			}
+			igt_assert_neq(len, -1);
+
+			for (int offset = 0; offset < len; offset += report_size) {
+				uint32_t *report = (void *) (buf + offset);
+
+				igt_debug(" > report ts=%"PRIu64""
+					  " ts_delta_last_periodic=%"PRIu64" is_timer=%i ctx_id=%8x nb_periodic=%u\n",
+					  oa_timestamp(report, fmt),
+					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
+					  oa_report_is_periodic(oa_exponent, report),
+					  oa_report_get_ctx_id(report),
+					  n_periodic_reports);
+
+				if (first_timestamp == 0)
+					first_timestamp = oa_timestamp(report, fmt);
+				last_timestamp = oa_timestamp(report, fmt);
+
+				if (oa_report_is_periodic(oa_exponent, report)) {
+					memcpy(last_periodic_report, report, report_size);
+					n_periodic_reports++;
+				}
+			}
+		}
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
+
+		igt_debug("%f < %zu < %f\n",
+			  report_size * n_full_oa_reports * 0.45,
+			  n_periodic_reports * report_size,
+			  report_size * n_full_oa_reports * 0.55);
+
+		igt_assert(n_periodic_reports * report_size >
+			   report_size * n_full_oa_reports * 0.45);
+		igt_assert(n_periodic_reports * report_size <
+			   report_size * n_full_oa_reports * 0.55);
+	}
+
+	free(last_periodic_report);
+	free(buf);
+
+	__perf_close(stream_fd);
+}
+
+/**
+ * SUBTEST: non-zero-reason
+ * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
+ */
+static void
+test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
+{
+	/* ~20 micro second period */
+	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	size_t report_size = get_oa_format(fmt).size;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t buf_size = 3 * 65536 * report_size;
+	uint8_t *buf = malloc(buf_size);
+	uint32_t total_len = 0;
+	const uint32_t *last_report;
+	int len;
+	u32 oa_status;
+
+	igt_assert(buf);
+
+	igt_debug("Ready to read about %u bytes\n", buf_size);
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	while (total_len < buf_size &&
+	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
+		(len == -1 && (errno == EINTR || errno == EIO)))) {
+		if (errno == EIO) {
+			oa_status = get_stream_status(stream_fd);
+			igt_debug("oa_status %#x\n", oa_status);
+			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
+		}
+		if (len > 0)
+			total_len += len;
+	}
+
+	__perf_close(stream_fd);
+
+	load_helper_stop();
+	load_helper_fini();
+
+	igt_debug("Got %u bytes\n", total_len);
+
+	last_report = NULL;
+	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
+		const uint32_t *report = (void *) (buf + offset);
+		uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
+
+		igt_assert_neq(reason, 0);
+
+		if (last_report)
+			sanity_check_reports(last_report, report, fmt);
+
+		last_report = report;
+	}
+
+	free(buf);
+}
+
+/**
+ * SUBTEST: enable-disable
+ * Description: Test that OA stream enable/disable works as expected
+ */
+static void
+test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
+{
+	/* ~5 micro second period */
+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t report_size = get_oa_format(fmt).size;
+	int buf_size = 65536 * report_size;
+	uint8_t *buf = malloc(buf_size);
+	size_t oa_buf_size = MAX_OA_BUF_SIZE;
+	int n_full_oa_reports = oa_buf_size / report_size;
+	uint64_t fill_duration = n_full_oa_reports * oa_period;
+	uint32_t *last_periodic_report = malloc(report_size);
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	for (int i = 0; i < 5; i++) {
+		int len;
+		uint32_t n_periodic_reports;
+		uint64_t first_timestamp = 0, last_timestamp = 0;
+		u32 oa_status;
+
+		/* Giving enough time for an overflow might help catch whether
+		 * the OA unit has been enabled even if the driver might at
+		 * least avoid copying reports while disabled.
+		 */
+		nanosleep(&(struct timespec){ .tv_sec = 0,
+					      .tv_nsec = fill_duration * 1.25 },
+			  NULL);
+
+		while ((len = read(stream_fd, buf, buf_size)) == -1 &&
+		       (errno == EINTR || errno == EIO))
+			;
+
+		igt_assert_eq(len, -1);
+		igt_assert_eq(errno, EINVAL);
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+		nanosleep(&(struct timespec){ .tv_sec = 0,
+					      .tv_nsec = fill_duration / 2 },
+			NULL);
+
+		n_periodic_reports = 0;
+
+		/* Because of the race condition between notification of new
+		 * reports and reports landing in memory, we need to rely on
+		 * timestamps to figure whether we've read enough of them.
+		 */
+		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
+
+			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
+				;
+			if (errno == EIO) {
+				oa_status = get_stream_status(stream_fd);
+				igt_debug("oa_status %#x\n", oa_status);
+				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
+				continue;
+			}
+			igt_assert_neq(len, -1);
+
+			for (int offset = 0; offset < len; offset += report_size) {
+				uint32_t *report = (void *) (buf + offset);
+
+				if (first_timestamp == 0)
+					first_timestamp = oa_timestamp(report, fmt);
+				last_timestamp = oa_timestamp(report, fmt);
+
+				igt_debug(" > report ts=%"PRIx64""
+					  " ts_delta_last_periodic=%s%"PRIu64""
+					  " is_timer=%i ctx_id=0x%8x\n",
+					  oa_timestamp(report, fmt),
+					  oa_report_is_periodic(oa_exponent, report) ? " " : "*",
+					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
+					  oa_report_is_periodic(oa_exponent, report),
+					  oa_report_get_ctx_id(report));
+
+				if (oa_report_is_periodic(oa_exponent, report)) {
+					memcpy(last_periodic_report, report, report_size);
+
+					/* We want to measure only the periodic reports,
+					 * ctx-switch might inflate the content of the
+					 * buffer and skew or measurement.
+					 */
+					n_periodic_reports++;
+				}
+			}
+		}
+
+		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+		igt_debug("first ts = %lu, last ts = %lu\n", first_timestamp, last_timestamp);
+
+		igt_debug("%f < %zu < %f\n",
+			  report_size * n_full_oa_reports * 0.45,
+			  n_periodic_reports * report_size,
+			  report_size * n_full_oa_reports * 0.55);
+
+		igt_assert((n_periodic_reports * report_size) >
+			   (report_size * n_full_oa_reports * 0.45));
+		igt_assert((n_periodic_reports * report_size) <
+			   report_size * n_full_oa_reports * 0.55);
+
+
+		/* It's considered an error to read a stream while it's disabled
+		 * since it would block indefinitely...
+		 */
+		len = read(stream_fd, buf, buf_size);
+
+		igt_assert_eq(len, -1);
+		igt_assert_eq(errno, EINVAL);
+	}
+
+	free(last_periodic_report);
+	free(buf);
+
+	__perf_close(stream_fd);
+
+	load_helper_stop();
+	load_helper_fini();
+}
+
+/**
+ * SUBTEST: short-reads
+ * Description: Test behavior for short reads
+ */
+static void
+test_short_reads(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(5000);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t record_size = get_oa_format(default_test_set->perf_oa_format).size;
+	size_t page_size = sysconf(_SC_PAGE_SIZE);
+	int zero_fd = open("/dev/zero", O_RDWR|O_CLOEXEC);
+	uint8_t *pages = mmap(NULL, page_size * 2,
+			      PROT_READ|PROT_WRITE, MAP_PRIVATE, zero_fd, 0);
+	u8 *header;
+	int ret, errnum;
+	u32 oa_status;
+
+	igt_assert_neq(zero_fd, -1);
+	close(zero_fd);
+	zero_fd = -1;
+
+	igt_assert(pages);
+
+	ret = mprotect(pages + page_size, page_size, PROT_NONE);
+	igt_assert_eq(ret, 0);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	nanosleep(&(struct timespec){ .tv_sec = 0, .tv_nsec = 5000000 }, NULL);
+
+	/* At this point there should be lots of pending reports to read */
+
+	/* A read that can return at least one record should result in a short
+	 * read not an EFAULT if the buffer is smaller than the requested read
+	 * size...
+	 *
+	 * Expect to see a sample record here, but at least skip over any
+	 * _RECORD_LOST notifications.
+	 */
+	do {
+		header = (void *)(pages + page_size - record_size);
+		oa_status = 0;
+		ret = read(stream_fd, header, page_size);
+		if (ret < 0 && errno == EIO)
+			oa_status = get_stream_status(stream_fd);
+
+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
+
+	igt_assert_eq(ret, record_size);
+
+	/* A read that can't return a single record because it would result
+	 * in a fault on buffer overrun should result in an EFAULT error...
+	 *
+	 * Make sure to weed out all report lost errors before verifying EFAULT.
+	 */
+	header = (void *)(pages + page_size - 16);
+	do {
+		oa_status = 0;
+		ret = read(stream_fd, header, page_size);
+		errnum = errno;
+		if (ret < 0 && errno == EIO)
+			oa_status = get_stream_status(stream_fd);
+		errno = errnum;
+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
+
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EFAULT);
+
+	/* A read that can't return a single record because the buffer is too
+	 * small should result in an ENOSPC error..
+	 *
+	 * Again, skip over _RECORD_LOST records (smaller than record_size/2)
+	 */
+	do {
+		header = (void *)(pages + page_size - record_size / 2);
+		oa_status = 0;
+		ret = read(stream_fd, header, record_size / 2);
+		errnum = errno;
+		if (ret < 0 && errno == EIO)
+			oa_status = get_stream_status(stream_fd);
+		errno = errnum;
+	} while (oa_status & DRM_XE_OASTATUS_REPORT_LOST);
+
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, ENOSPC);
+
+	__perf_close(stream_fd);
+
+	munmap(pages, page_size * 2);
+}
+
+/**
+ * SUBTEST: non-sampling-read-error
+ * Description: Test that a stream without periodic sampling (no exponent) cannot be read
+ */
+static void
+test_non_sampling_read_error(void)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* XXX: even without periodic sampling we have to
+		 * specify at least one sample layout property...
+		 */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+
+		/* XXX: no sampling exponent */
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	int ret;
+	uint8_t buf[1024];
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EINVAL);
+
+	__perf_close(stream_fd);
+}
+
+/**
+ * SUBTEST: disabled-read-error
+ * Description: Test that attempts to read from a stream while it is disable
+ *		will return EINVAL instead of blocking indefinitely
+ */
+static void
+test_disabled_read_error(void)
+{
+	int oa_exponent = 5; /* 5 micro seconds */
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* XXX: even without periodic sampling we have to
+		 * specify at least one sample layout property...
+		 */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t oa_report0[64];
+	uint32_t oa_report1[64];
+	uint32_t buf[128] = { 0 };
+	int ret;
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EINVAL);
+
+	__perf_close(stream_fd);
+
+	properties[ARRAY_SIZE(properties) - 1] = false; /* Set DISABLED to false */
+	stream_fd = __perf_open(drm_fd, &param, false);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	read_2_oa_reports(default_test_set->perf_oa_format,
+			  oa_exponent,
+			  oa_report0,
+			  oa_report1,
+			  false); /* not just timer reports */
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EINVAL);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+	read_2_oa_reports(default_test_set->perf_oa_format,
+			  oa_exponent,
+			  oa_report0,
+			  oa_report1,
+			  false); /* not just timer reports */
+
+	__perf_close(stream_fd);
+}
+
 static unsigned read_xe_module_ref(void)
 {
 	FILE *fp = fopen("/proc/modules", "r");
@@ -1860,6 +2445,27 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_oa_exponents(hwe);
 
+	igt_subtest_with_dynamic("buffer-fill")
+		__for_one_hwe_in_oag(hwe)
+			test_buffer_fill(hwe);
+
+	igt_subtest_with_dynamic("non-zero-reason") {
+		__for_one_hwe_in_oag(hwe)
+			test_non_zero_reason(hwe);
+	}
+
+	igt_subtest("disabled-read-error")
+		test_disabled_read_error();
+	igt_subtest("non-sampling-read-error")
+		test_non_sampling_read_error();
+
+	igt_subtest_with_dynamic("enable-disable")
+		__for_one_hwe_in_oag(hwe)
+			test_enable_disable(hwe);
+
+	igt_subtest("short-reads")
+		test_short_reads();
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

