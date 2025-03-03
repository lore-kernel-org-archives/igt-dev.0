Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE684C28B23
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0110E4F7;
	Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hn99dViP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69B10E2EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043709; x=1772579709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O/2lQopaAuRrRSCmUPHoODO9HJ/B0hzviBH0+/Gneuk=;
 b=Hn99dViP/Hk25WxURkyWj0YHYPMUF2d5Nakjrxl8wKsnHfs3AKCUSsWL
 GmYyQaWFNdunqEaQKYGpes1p7JEvUnqyDa/dViFgfz3d00JQVX3Jplrmp
 14i8Eg4QVhTcHwDHWpCLW3iLv+MFuUeURp5zMe9eWOEscy1xuo/Bi5Fot
 GnF+qAb/uuI93BNGp6qgryzygJebut1BurjguW+/znnApWPQ1hFsFfAfT
 VfpfrDd+ttAleY7nwcCZBBilr2bTCF2H7bFUx0EpF8AJ7By6VBfLclvn9
 UVVXoFF3aA/EJd15denK3Ls+ls5h9lNYX8SzNu4w49RPa0RsDvVfHXiUh A==;
X-CSE-ConnectionGUID: 93oNg3iSTcqxdZ3KAwOtNA==
X-CSE-MsgGUID: TldbJqYTQXyoUQ8vXVSChA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793050"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793050"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
X-CSE-ConnectionGUID: qPKo37aoQ964SWhvEdo6KQ==
X-CSE-MsgGUID: WnDYwVFsQ6ezuDq1FKXpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716718"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 11/14] tests/intel/xe_oa: Rewrite enable-disable test
Date: Mon,  3 Mar 2025 15:14:59 -0800
Message-Id: <20250303231502.135720-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

Keep it simple and just check if enable/disable is working correctly
using the read call and existing uapi.

v2: Drop mmio and use the value returned in read (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 140 ++++++++------------------------------------
 1 file changed, 24 insertions(+), 116 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9c10a8fd2..47c4a1fdb 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2524,145 +2524,53 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 static void
 test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 {
-	/* ~5 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(5000);
-	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	uint32_t num_reports = 5;
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
-
-		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
-
-		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, num_reports,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
-	uint8_t *buf = malloc(buf_size);
-	int n_full_oa_reports = default_oa_buffer_size / report_size;
-	uint64_t fill_duration = n_full_oa_reports * oa_period;
-	uint32_t *last_periodic_report = malloc(report_size);
-
-	load_helper_init();
-	load_helper_run(HIGH);
+	size_t format_size = get_oa_format(fmt).size;
+	uint8_t buf[num_reports * format_size];
+	struct pollfd pollfd;
+	int ret;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
-	for (int i = 0; i < 5; i++) {
-		int len;
-		uint32_t n_periodic_reports;
-		uint64_t first_timestamp = 0, last_timestamp = 0;
-		u32 oa_status;
-
-		/* Giving enough time for an overflow might help catch whether
-		 * the OA unit has been enabled even if the driver might at
-		 * least avoid copying reports while disabled.
-		 */
-		nanosleep(&(struct timespec){ .tv_sec = 0,
-					      .tv_nsec = fill_duration * 1.25 },
-			  NULL);
-
-		while ((len = read(stream_fd, buf, buf_size)) == -1 &&
-		       (errno == EINTR || errno == EIO))
-			;
-
-		igt_assert_eq(len, -1);
-		igt_assert_eq(errno, EINVAL);
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-
-		nanosleep(&(struct timespec){ .tv_sec = 0,
-					      .tv_nsec = fill_duration / 2 },
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
-			while ((len = read(stream_fd, buf, buf_size)) == -1 && errno == EINTR)
-				;
-			if (errno == EIO) {
-				oa_status = get_stream_status(stream_fd);
-				igt_debug("oa_status %#x\n", oa_status);
-				igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
-				continue;
-			}
-			igt_assert_neq(len, -1);
-
-			for (int offset = 0; offset < len; offset += report_size) {
-				uint32_t *report = (void *) (buf + offset);
-
-				if (first_timestamp == 0)
-					first_timestamp = oa_timestamp(report, fmt);
-				last_timestamp = oa_timestamp(report, fmt);
-
-				igt_debug(" > report ts=%"PRIx64""
-					  " ts_delta_last_periodic=%s%"PRIu64""
-					  " is_timer=%i ctx_id=0x%8x\n",
-					  oa_timestamp(report, fmt),
-					  oa_report_is_periodic(report) ? " " : "*",
-					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
-					  oa_report_is_periodic(report),
-					  oa_report_get_ctx_id(report));
-
-				if (oa_report_is_periodic(report)) {
-					memcpy(last_periodic_report, report, report_size);
-
-					/* We want to measure only the periodic reports,
-					 * ctx-switch might inflate the content of the
-					 * buffer and skew or measurement.
-					 */
-					n_periodic_reports++;
-				}
-			}
-		}
-
-		do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
-
-		igt_debug("first ts = %"PRIu64", last ts = %"PRIu64"\n", first_timestamp, last_timestamp);
-
-		igt_debug("%f < %zu < %f\n",
-			  report_size * n_full_oa_reports * 0.45,
-			  n_periodic_reports * report_size,
-			  report_size * n_full_oa_reports * 0.55);
-
-		igt_assert((n_periodic_reports * report_size) >
-			   (report_size * n_full_oa_reports * 0.45));
-		igt_assert((n_periodic_reports * report_size) <
-			   report_size * n_full_oa_reports * 0.55);
-
+	errno = 0;
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, EINVAL);
 
-		/* It's considered an error to read a stream while it's disabled
-		 * since it would block indefinitely...
-		 */
-		len = read(stream_fd, buf, buf_size);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-		igt_assert_eq(len, -1);
-		igt_assert_eq(errno, EINVAL);
-	}
+	/*
+	 * Wait for number of reports specified in
+	 * DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS
+	 */
+	pollfd.fd = stream_fd;
+	pollfd.events = POLLIN;
+	poll(&pollfd, 1, -1);
+	igt_assert(pollfd.revents & POLLIN);
 
-	free(last_periodic_report);
-	free(buf);
+	/* Ensure num_reports can be read */
+	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
+		;
+	igt_assert_eq(ret, sizeof(buf));
 
 	__perf_close(stream_fd);
-
-	load_helper_stop();
-	load_helper_fini();
 }
 
 /**
-- 
2.34.1

