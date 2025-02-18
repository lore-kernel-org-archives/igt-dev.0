Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAD4C021B1
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8A10E766;
	Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LijQDY0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0CC10E761
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WOmK/JpDk1D9sCv8EVvY/QrI5zBCLFs9eUexzS3htpI=;
 b=LijQDY0OagaVFfkpO3mW+QGLKHdo/vdOS1mhdgaGKHu/sk8KgGC8Uip0
 Dz0n4J9GGpWnkbGpLPFMBrMb1x49TqCREy0Ylb7WK1bGnkRHMoycsl1tn
 iLlL2r1MK2ylOdcBvSHPZZofaH0ADrqLB77IZgfqKh4z1SeVRd76GQzGD
 BfL2iTulNhfuEX56Kl5MN7LNMY+lzU7CcwqON2bNtFcKgq/dYJcnwe+EQ
 SZ5nlONhCBL0L0k+fZoj9MPrOhzjCufRYUtqBiTqBIbr9IDAguQkXQrSj
 ij86CubNUqekXZ/TczY0jBh5Aa9ib9IGXqYSnWFGqfSAvnI5lhqx7lfKb A==;
X-CSE-ConnectionGUID: GetVS9lPSJq3hH+enRWC0A==
X-CSE-MsgGUID: WkuJFcjOSw+YJrbK9JPV+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545838"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: JKTHSzHVRZ+Ka9a9+ojRdA==
X-CSE-MsgGUID: 4DJuNPMuTOiL9kek+1OYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367450"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 06/14] tests/intel/xe_oa: Rewrite the polling
 small buf test
Date: Tue, 18 Feb 2025 12:28:04 -0800
Message-Id: <20250218202812.1679653-7-umesh.nerlige.ramappa@intel.com>
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

Use mmio reads as a side-channel to determine if reports are available
and ensure that poll will return with POLLIN set. Then provide a small
buffer to force ENOSPC error. Then poll with a timeout of 0 to check if
POLLIN is still set.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 64 +++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index aaf92308a..5792ffec2 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2216,7 +2216,6 @@ static void test_polling(uint64_t requested_oa_period,
  */
 static void test_polling_small_buf(void)
 {
-	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
@@ -2226,50 +2225,57 @@ static void test_polling_small_buf(void)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	uint32_t test_duration = 80 * 1000 * 1000;
-	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
-	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
-	int n_expect_read_bytes = n_expected_reports * sample_size;
-	struct timespec ts = {};
-	int n_bytes_read = 0;
-	uint32_t n_polls = 0;
+	int report_size = get_oa_format(default_test_set->perf_oa_format).size;
+	u32 oa_tail, prev_tail;
+	struct pollfd pollfd;
+	uint8_t buf[10];
+	int ret, i = 0;
+
+	intel_register_access_init(&mmio_data,
+				   igt_device_get_pci_device(drm_fd), 0);
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-
-	while (igt_nsec_elapsed(&ts) < test_duration) {
-		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
 
-		ppoll(&pollfd, 1, NULL, NULL);
-		if (pollfd.revents & POLLIN) {
-			uint8_t buf[1024];
-			int ret;
+#define OAG_OATAILPTR	(0xdb04)
+	/* Save the current tail */
+	prev_tail = oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
 
-			ret = read(stream_fd, buf, sizeof(buf));
-			if (ret >= 0)
-				n_bytes_read += ret;
-		}
+	/* Kickstart the capture */
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-		n_polls++;
+	/* Wait for 5 reports */
+	while ((oa_tail - prev_tail) < (5 * report_size)) {
+		usleep(1000);
+		oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
+		if (i++ > 10)
+			break;
 	}
 
-	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
-		 n_bytes_read, n_expect_read_bytes,
-		 n_bytes_read * 100.0f / n_expect_read_bytes,
-		 n_polls);
+	intel_register_access_fini(&mmio_data);
 
-	__perf_close(stream_fd);
+	/* Just read one report and expect ENOSPC */
+	pollfd.fd = stream_fd;
+	pollfd.events = POLLIN;
+	poll(&pollfd, 1, 1000);
+	igt_assert(pollfd.revents & POLLIN);
+	errno = 0;
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, ENOSPC);
 
-	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
-		   0.20 * n_expect_read_bytes);
+	/* Poll with 0 timeout and expect POLLIN flag to be set */
+	poll(&pollfd, 1, 0);
+	igt_assert(pollfd.revents & POLLIN);
+
+	__perf_close(stream_fd);
 }
 
 static int
-- 
2.34.1

