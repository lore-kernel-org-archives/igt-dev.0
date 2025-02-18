Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA2C021B8
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601D110E76F;
	Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyiN6hYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA00010E765
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iHRywJvrxArB3g0uLkTuGHax6ZWAzxlsxO/oXOhuyuc=;
 b=CyiN6hYjiCxWkI/KQXEHdQi42LjiDtdrEjDaBFsOa3E7yqFvdstY1hA6
 kf6ul6ZXeJZxdZCNUtwwKK8iVOCbKuzluUtx7IMbDLiX0cP2/MJJah2tN
 aw2rUFdBj+xgv2lq0Ix3/UFOSlLRoNesMBOcfMqymc70duuOsjhDCS9Ds
 5dQzx4djQWAoVXbKGVW9OOnJpjXqMvAAihMZqBVSox7MR9uPiff/leH7c
 6aM0sCWMkJIZ7wFIGr0l9rFmDbi0wkp4gNNo3Tlh32CJW1mYRNXL/ago5
 3sfVkNg+Sea3tGAzBTOyxIY0hyM8Hhi3Xpr5g5Ut4OiWj3n8X2UhNGU/x w==;
X-CSE-ConnectionGUID: mO1crEfbQnKQ1dwfqpJlrg==
X-CSE-MsgGUID: LO6TvlHFSW+v8MPRuLwNZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545842"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: bFtX/LhMSSWcM9b0U1bxNQ==
X-CSE-MsgGUID: /GgMOKE/R9G6DI7MaOgz/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367462"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 10/14] tests/intel/xe_oa: Rewrite enable-disable
 test
Date: Tue, 18 Feb 2025 12:28:08 -0800
Message-Id: <20250218202812.1679653-11-umesh.nerlige.ramappa@intel.com>
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

Keep it simple and just check if enable/disable is working correctly
using mmio.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 129 +++++---------------------------------------
 1 file changed, 13 insertions(+), 116 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ee87b7338..c6c1c2358 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2534,21 +2534,13 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 static void
 test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 {
-	/* ~5 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(5000);
-	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
-	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
-
-		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
-
-		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
@@ -2556,123 +2548,28 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
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
+	u32 oacontrol;
 
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
+#define OAG_OACONTROL	(0xdaf4)
+#define  OAG_OACONTROL_OA_COUNTER_ENABLE	(1 << 0)
 
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
+	intel_register_access_init(&mmio_data,
+				   igt_device_get_pci_device(drm_fd), 0);
 
+	oacontrol = intel_register_read(&mmio_data, OAG_OACONTROL);
+	igt_assert_eq(oacontrol & OAG_OACONTROL_OA_COUNTER_ENABLE, 0);
 
-		/* It's considered an error to read a stream while it's disabled
-		 * since it would block indefinitely...
-		 */
-		len = read(stream_fd, buf, buf_size);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-		igt_assert_eq(len, -1);
-		igt_assert_eq(errno, EINVAL);
-	}
+	oacontrol = intel_register_read(&mmio_data, OAG_OACONTROL);
 
-	free(last_periodic_report);
-	free(buf);
+	igt_assert_eq(oacontrol & OAG_OACONTROL_OA_COUNTER_ENABLE, 1);
 
+	intel_register_access_fini(&mmio_data);
 	__perf_close(stream_fd);
-
-	load_helper_stop();
-	load_helper_fini();
 }
 
 /**
-- 
2.34.1

