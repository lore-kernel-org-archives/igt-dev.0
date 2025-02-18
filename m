Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF3C021B5
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CE610E76A;
	Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBG4m4bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FEB10E762
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EqKwRBm/oDzlIy+7OXXPiPlx0iqC8+DsxwM3zkTG6HQ=;
 b=mBG4m4bgXsRjBinhHUuty2Gtud4SqXjoFWB1uxH2RjX51Bm1bxH7YChO
 FhyBt7ykFzYX+qRQDk391WVOZGKfkMT5N3OuoCmiYgQ8n7vfJcMbljxeG
 oKDvSvJ4a9q5gSU13zckRJ1Dcwgw9k0CACCtsnBbFO/XCZdFUB1FiR/8P
 ceGrhhHlNJUKcujrx5tpTHCeVEYMthxAF1L5jxqtwL2hrJLVEGeqceTHf
 fK0YPt8QpI5/67/GqtL6ZEMlVnh5oa1N0jVzcEh4Cjhi0QkwyoM29wo0z
 ParabzjmK3mUcX17/XW6FxALasjQ4yK/PbCD4/QdovyYtkzIzI+NP8pup A==;
X-CSE-ConnectionGUID: KJaHdMULSmCRcTyFf30W5g==
X-CSE-MsgGUID: OWZ04uzQS1aSTBgwLvhtUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545839"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: ruKYChDZRL2Q3Q6TZ+l1PA==
X-CSE-MsgGUID: T8/4NCehTOil/IA/k2NGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367454"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 07/14] tests/intel/xe_oa: Simplify the
 buffer-fill test
Date: Tue, 18 Feb 2025 12:28:05 -0800
Message-Id: <20250218202812.1679653-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

We only want to test that the BUFFER OVERFLOW status is set when we do
not read the OA stream data in time. To do so, keeping reading zero
bytes of data until you hit a buffer overflow.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 135 +++++++++-----------------------------------
 1 file changed, 26 insertions(+), 109 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 5792ffec2..fc03b74af 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -304,6 +304,7 @@ static size_t default_oa_buffer_size;
 static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 static uint32_t rc_width, rc_height;
+static uint32_t buffer_fill_size;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -1092,6 +1093,7 @@ init_sys_info(void)
 
 	rc_width = 1920;
 	rc_height = 1080;
+	buffer_fill_size = SZ_16M;
 	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
@@ -2370,11 +2372,7 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 static void
 test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 {
-	/* ~5 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(5000);
-	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
-	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
@@ -2383,126 +2381,45 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_fill_size,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
-	uint8_t *buf = malloc(buf_size);
-	int len;
-	int n_full_oa_reports = default_oa_buffer_size / report_size;
-	uint64_t fill_duration = n_full_oa_reports * oa_period;
-	uint32_t *last_periodic_report = malloc(report_size);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent_default);
+	char *buf = malloc(1024);
+	bool overflow_seen;
 	u32 oa_status;
+	int len;
 
-	igt_assert(fill_duration < 1000000000);
-
+	igt_debug("oa_period %s\n", pretty_print_oa_period(oa_period));
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
-	for (int i = 0; i < 5; i++) {
-		bool overflow_seen;
-		uint32_t n_periodic_reports;
-		uint32_t first_timestamp = 0, last_timestamp = 0;
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-
-		nanosleep(&(struct timespec){ .tv_sec = 0,
-					      .tv_nsec = fill_duration * 1.25 },
-			  NULL);
-again:
-		oa_status = 0;
-		while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
-			;
-
-		if (errno == EIO) {
-			oa_status = get_stream_status(stream_fd);
-			igt_debug("oa_status %#x\n", oa_status);
-			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
-			igt_assert_eq(overflow_seen, true);
-			goto again;
-		}
-		igt_assert_neq(len, -1);
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
-
-		igt_debug("fill_duration = %"PRIu64"ns, oa_exponent = %u\n",
-			  fill_duration, oa_exponent);
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-
-		nanosleep(&(struct timespec){ .tv_sec = 0,
-					.tv_nsec = fill_duration / 2 },
-			NULL);
-
-		n_periodic_reports = 0;
-
-		/* Because of the race condition between notification of new
-		 * reports and reports landing in memory, we need to rely on
-		 * timestamps to figure whether we've read enough of them.
-		 */
-		while (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2)) {
-
-			igt_debug("dts=%u elapsed=%"PRIu64" duration=%"PRIu64"\n",
-				  last_timestamp - first_timestamp,
-				  (last_timestamp - first_timestamp) * oa_period,
-				  fill_duration / 2);
-again_1:
-			oa_status = 0;
-			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
-				;
-			if (errno == EIO) {
-				oa_status = get_stream_status(stream_fd);
-				igt_debug("oa_status %#x\n", oa_status);
-				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
-				goto again_1;
-			}
-			igt_assert_neq(len, -1);
-
-			for (int offset = 0; offset < len; offset += report_size) {
-				uint32_t *report = (void *) (buf + offset);
-
-				igt_debug(" > report ts=%"PRIu64""
-					  " ts_delta_last_periodic=%"PRIu64" is_timer=%i ctx_id=%8x nb_periodic=%u\n",
-					  oa_timestamp(report, fmt),
-					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
-					  oa_report_is_periodic(report),
-					  oa_report_get_ctx_id(report),
-					  n_periodic_reports);
-
-				if (first_timestamp == 0)
-					first_timestamp = oa_timestamp(report, fmt);
-				last_timestamp = oa_timestamp(report, fmt);
-
-				if (oa_report_is_periodic(report)) {
-					memcpy(last_periodic_report, report, report_size);
-					n_periodic_reports++;
-				}
-			}
-		}
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
-
-		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
+	/* OA buffer is disable, we do not expect any error status */
+	oa_status = get_stream_status(stream_fd);
+	overflow_seen = !!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW);
+	igt_assert_eq(overflow_seen, 0);
 
-		igt_debug("%f < %zu < %f\n",
-			  report_size * n_full_oa_reports * 0.45,
-			  n_periodic_reports * report_size,
-			  report_size * n_full_oa_reports * 0.55);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-		igt_assert(n_periodic_reports * report_size >
-			   report_size * n_full_oa_reports * 0.45);
-		igt_assert(n_periodic_reports * report_size <
-			   report_size * n_full_oa_reports * 0.55);
+	errno = 0;
+	/* Read 0 bytes repeatedly until you see an EIO */
+	while ((len = read(stream_fd, buf, 0)) == -1 && (errno == EINTR || errno == ENOSPC)) {
+		usleep(100);
 	}
+	igt_assert_eq(len, -1);
+	igt_assert_eq(errno, EIO);
 
-	free(last_periodic_report);
-	free(buf);
+	/* Ensure buffer overflowed */
+	oa_status = get_stream_status(stream_fd);
+	overflow_seen = !!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW);
+	igt_assert(overflow_seen);
 
 	__perf_close(stream_fd);
 }
-- 
2.34.1

