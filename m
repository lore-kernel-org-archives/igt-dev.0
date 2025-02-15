Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2ECC021A9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550D210ED52;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5v3ULW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3851610E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581590; x=1771117590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WOmK/JpDk1D9sCv8EVvY/QrI5zBCLFs9eUexzS3htpI=;
 b=N5v3ULW2yKRyBfK0H3cy4pqszzajyMv6oIfH5J2F6Z+Xc9ddt5ur3py9
 NWT32uoxQVhkPjI5xUX/YendiObbC/+VKmW6UWxBJ0J4h9QQMDzST9maO
 ibeAC6bdWGxchinJ3ekLCZSyUYAwYi2O6WHIhhMcK6HSOHxBGomvx5cV8
 GOyXVO7jkdGcTOSZDk5z7KNS3+OkG7gZcsIZVrdeEo4konMP4lPcLd20g
 rqhyGW3BTdq3tWHHTkUN8SdgTYTX4TbekVXvryqc2c8fsU5HK8LHSYJeb
 l088pwrSRLlrHj2kJzu+ToXyIqFQxnt1sBADpmjjsGk8KpLBoQIxLupWR Q==;
X-CSE-ConnectionGUID: wl5yQY+gSUOsFTiI4tX6Qg==
X-CSE-MsgGUID: 3O8dVJS5R0i9b7HOfGGvQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555113"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:29 -0800
X-CSE-ConnectionGUID: AcJP416IRa2qDUNTStagpw==
X-CSE-MsgGUID: vHatQSZPThKBJMgBEzNdzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711251"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 06/13] tests/intel/xe_oa: Rewrite the polling small buf test
Date: Fri, 14 Feb 2025 17:06:21 -0800
Message-Id: <20250215010628.1639986-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

