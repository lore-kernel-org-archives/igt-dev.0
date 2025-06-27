Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B97AC7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 20:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C160310E033;
	Fri, 27 Jun 2025 20:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+Kd564L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586710E033
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751057458; x=1782593458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BALw1XuUzabWAtNGC2SNhlE19lcmBeicF6aenVZT+8U=;
 b=i+Kd564LAJrfaMrpaa8XnegZ9vyoo74oaPzHFf3jlb4wWl0HQ0/C94jx
 8qi41HWmC15iWl1RMSuQ6jJHEPJdnD5FLFhgPbfiOZvt34NYZ87+fxQXK
 nnZcXhyeo/dD2PtfmfXfN0TjbJFLEFB1J285iVOX6NF+F9l/PjlHgk+qA
 dPyZZr7dgGJ0af7orT6enDh0ZG8HbeEVNBorJIQCDEdmBF9Rx0I4/o5r5
 3tyeF+JSa/9t+lvV6R9/vgTjOfYW+ffk1ebRGryRbYFVQKBdYiY1Mz3U2
 Gmz0PZoceXOj+PmNPkkonlEmbhaGrQu6Y5r6Muu/M0mFKZioLW3Eb0zaR g==;
X-CSE-ConnectionGUID: gft+K0ekRe60uNARL9iWKA==
X-CSE-MsgGUID: 4VIQflRJSUSzLD5Bbwza0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63977787"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="63977787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:50:56 -0700
X-CSE-ConnectionGUID: o9UlCKmJQLy6hLBtS3KCwA==
X-CSE-MsgGUID: clp5jGUfSkS6XA6ohK6ulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="158627888"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:50:55 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eu_stall: Use default sampling rate
 from the query IOCTL data
Date: Fri, 27 Jun 2025 13:50:50 -0700
Message-ID: <766c5f4f8604f752be1894aa9d17f9c16b84d4df.1751057370.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

EU stall query IOCTL returns the supported sampling rates. If the user
doesn't pass a sampling rate, use a mid sampling rate from those
returned from the query IOCTL.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index c496e654b..88202488c 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -54,7 +54,6 @@
 #define MAX_XECORES		64
 #define NUM_ITERS_GPGPU_FILL	100
 #define DEFAULT_NUM_REPORTS	1
-#define DEFAULT_SAMPLE_RATE	(251 * 4)
 #define DEFAULT_USER_BUF_SIZE	(64 * 512 * 1024)
 
 #define WIDTH		64
@@ -346,17 +345,17 @@ static void test_invalid_arguments(int drm_fd, uint8_t gt_id, uint32_t rate, uin
 
 static void test_invalid_gt_id(int fd)
 {
-	test_invalid_arguments(fd, 255, DEFAULT_SAMPLE_RATE, DEFAULT_NUM_REPORTS);
+	test_invalid_arguments(fd, 255, p_rate, DEFAULT_NUM_REPORTS);
 }
 
 static void test_invalid_sampling_rate(int fd)
 {
-	test_invalid_arguments(fd, 0, 251 * 10, DEFAULT_NUM_REPORTS);
+	test_invalid_arguments(fd, 0, p_rate * 10, DEFAULT_NUM_REPORTS);
 }
 
 static void test_invalid_event_report_count(int fd)
 {
-	test_invalid_arguments(fd, 0, DEFAULT_SAMPLE_RATE,
+	test_invalid_arguments(fd, 0, p_rate,
 			       NUM_DATA_ROWS(512 * 1024) * MAX_XECORES + 1);
 }
 
@@ -387,7 +386,7 @@ static void test_non_privileged_access(int drm_fd)
 	igt_fork(child, 1) {
 		uint64_t properties[] = {
 			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
-			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, DEFAULT_SAMPLE_RATE,
+			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
 			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
 		};
 
@@ -409,7 +408,7 @@ static void test_non_privileged_access(int drm_fd)
 	igt_fork(child, 1) {
 		uint64_t properties[] = {
 			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
-			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, DEFAULT_SAMPLE_RATE,
+			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
 			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
 		};
 
@@ -647,7 +646,7 @@ static struct option long_options[] = {
 igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	bool blocking_read = true;
-	int drm_fd, ret;
+	int drm_fd, ret, idx;
 	uint32_t devid;
 	struct stat sb;
 	struct drm_xe_device_query query = {
@@ -679,8 +678,11 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
 		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
-		if (p_rate == 0)
-			p_rate = query_eu_stall_data->sampling_rates[0];
+		/* If the user doesn't pass a sampling rate, use a mid sampling rate */
+		if (p_rate == 0) {
+			idx = query_eu_stall_data->num_sampling_rates / 2;
+			p_rate = query_eu_stall_data->sampling_rates[idx];
+		}
 
 		if (output_file) {
 			output = fopen(output_file, "w");
-- 
2.48.1

