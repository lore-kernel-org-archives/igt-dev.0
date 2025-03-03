Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C587FC282D9
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71D010E4EB;
	Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Su0sNyWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1A10E2EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043708; x=1772579708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Mp3wiXYRcN92M6Zk/7c++Zvm/j9i/Maf1ySZ5UeH/rw=;
 b=Su0sNyWBf9QyLDlN0t4JLOGTigXmEh0/cNOj/CUzaeoHznDYnoeRphIs
 hj3Db69C/GTPuebdSvqGSyMu21OyLdirX8L/Az7rblc6hEKzm6R4qJ1Sb
 lCLe89iEq1FaB36u8abmb7fQtSmPDzLeql1N7bC6FITYP01TgTxIbqCke
 ybXqwwx1qDSYOPFi9DZ+DL6XpiEjPMU9yYF+5S/7cDn6kgg/5MsUT3STp
 Y9o+Ijt7UyPWWMU45mPYY4AIt+PBDdWiGwYp0NStPXsnS8y6AQGdiq80D
 qPlm7qFyCXCtH15hlnX0g8RlAvS2Lfx81kwH93h28JN/MQGpntY0HeKku g==;
X-CSE-ConnectionGUID: PjeGkH+NRxCElANIOeOIDw==
X-CSE-MsgGUID: Q7Hx4ijiRZ2uzTo0HnXneg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793045"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
X-CSE-ConnectionGUID: 2qCHFgHsRROFB3kXZqd7QQ==
X-CSE-MsgGUID: B+BYliz/TxyPnxoc9KMiWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716701"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 07/14] tests/intel/xe_oa: Rewrite the polling small
 buf test
Date: Mon,  3 Mar 2025 15:14:55 -0800
Message-Id: <20250303231502.135720-8-umesh.nerlige.ramappa@intel.com>
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

The polling-small-buf test is specifically testing that POLLIN is still
set after an ENOSPC error. In the buggy code, POLLIN was cleared on
the ENOSPC error even though there was data to be read. The test was
putting an upper bound on the number of bytes read in a fixed duration
of time. While this worked, we had occassional failures that were due to
scheduling and other dependencies outside the scope of this test.

In an attempt to make the test more robust,
- use a more definitive method to wait for few reports
- force an ENOSPC error using a small buffer
- Ensure POLLIN is still set in the subsequent poll() call

v2:
- Add "why" in commit message (Ashutosh)
- Use uapi to wait for N reports

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 53 ++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 08406ca5c..dd16b39a9 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2216,7 +2216,6 @@ static void test_polling(uint64_t requested_oa_period,
  */
 static void test_polling_small_buf(void)
 {
-	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
@@ -2226,50 +2225,44 @@ static void test_polling_small_buf(void)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
+		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, 5,
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
+	struct pollfd pollfd;
+	uint8_t buf[10];
+	int ret;
 
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-	while (igt_nsec_elapsed(&ts) < test_duration) {
-		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
-
-		ppoll(&pollfd, 1, NULL, NULL);
-		if (pollfd.revents & POLLIN) {
-			uint8_t buf[1024];
-			int ret;
+	/* Kickstart the capture */
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-			ret = read(stream_fd, buf, sizeof(buf));
-			if (ret >= 0)
-				n_bytes_read += ret;
-		}
+	/*
+	 * Wait for number of reports specified in
+	 * DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS
+	 */
+	pollfd.fd = stream_fd;
+	pollfd.events = POLLIN;
+	poll(&pollfd, 1, -1);
+	igt_assert(pollfd.revents & POLLIN);
 
-		n_polls++;
-	}
+	/* Just read one report and expect ENOSPC */
+	errno = 0;
+	ret = read(stream_fd, buf, sizeof(buf));
+	igt_assert_eq(ret, -1);
+	igt_assert_eq(errno, ENOSPC);
 
-	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
-		 n_bytes_read, n_expect_read_bytes,
-		 n_bytes_read * 100.0f / n_expect_read_bytes,
-		 n_polls);
+	/* Poll with 0 timeout and expect POLLIN flag to be set */
+	poll(&pollfd, 1, 0);
+	igt_assert(pollfd.revents & POLLIN);
 
 	__perf_close(stream_fd);
-
-	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
-		   0.20 * n_expect_read_bytes);
 }
 
 static int
-- 
2.34.1

