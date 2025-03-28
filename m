Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3356BC36013
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 01:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65CA10E95D;
	Fri, 28 Mar 2025 01:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwKu4As7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90810E95D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 01:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743125004; x=1774661004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r7C7ZaU4fok3wg+V/yWXAf9p7RzP1vwBs2HQxfkSv2s=;
 b=bwKu4As7gWRDwIMofb3luHe7yAbpPqdzmxizq5p75KfOcM7ctQeJN55f
 XcRpW5Y2NVhn760YDKvhJS21yr21a5hM2g3FX+gYgqI9L61eE08s8GMqj
 zxtsDiwddcK3tWv1nKNzA+qQUfthTYFreHhYjiJLxAKCpWXX0qlE81LKI
 ScHjPA6ohHL8xHlbPG3FGMvUwrm5eYKnZrlK2byKWyiDT4pMOGaW26e7O
 QoKeE6Uw1GOtk84JRauhjfTFWrxgSpXI9pQWf1XMnRQRcN5W/UfG8nzV4
 DZH/y7bnGbmmPOhGc0QFsLD0Ul/v9a1pwtVk4yiiksDmzAYpiw9xqhqoP w==;
X-CSE-ConnectionGUID: r2LWH0E3QgGdN8vbKBcdEw==
X-CSE-MsgGUID: ZhVLcPcrRNaDZ1ZOHQS99A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="62010852"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="62010852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 18:23:23 -0700
X-CSE-ConnectionGUID: q0O637YtQ4GCWTUQqXZ75w==
X-CSE-MsgGUID: e1IhjgcJSVOhfJohaxQYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125283948"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 18:23:23 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_eu_stall: Add invalid input tests
 for EU stall sampling
Date: Thu, 27 Mar 2025 18:23:19 -0700
Message-ID: <f5fe98bd2c3ed3a954e8a5c0c8a11b58174d6a7b.1743124940.git.harish.chegondi@intel.com>
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

Add tests to verify that invalid inputs fail the tests

v2: Fix alignment, change SUBSLICES to XECORES, remove unnecessary brackets

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 964bb7c91..da9bd7843 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -19,6 +19,15 @@
  *
  * SUBTEST: unprivileged-access
  * Description: Verify unprivileged open of a EU stall data stream fd
+ *
+ * SUBTEST: invalid-gt-id
+ * Description: Verify that invalid input GT ID fails the test
+ *
+ * SUBTEST: invalid-sampling-rate
+ * Description: Verify that invalid input sampling rate fails the test
+ *
+ * SUBTEST: invalid-event-report-count
+ * Description: Verify that invalid input event report count fails the test
  */
 
 #include <fcntl.h>
@@ -33,6 +42,9 @@
 
 #define OBSERVATION_PARANOID	"/proc/sys/dev/xe/observation_paranoid"
 
+#define NUM_DATA_ROWS(size)	((size) >> 6)
+
+#define MAX_XECORES		64
 #define NUM_ITERS_GPGPU_FILL	100
 #define DEFAULT_NUM_REPORTS	1
 #define DEFAULT_SAMPLE_RATE	(251 * 4)
@@ -283,6 +295,41 @@ static void set_fd_flags(int fd, int flags)
 	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
 }
 
+/*
+ * Verify that tests with invalid arguments fail.
+ */
+static void test_invalid_arguments(int drm_fd, uint8_t gt_id, uint32_t rate, uint32_t num_reports)
+{
+	uint64_t properties[] = {
+		DRM_XE_EU_STALL_PROP_GT_ID, gt_id,
+		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, rate,
+		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, num_reports,
+	};
+
+	struct xe_eu_stall_open_prop props = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	xe_eu_stall_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props, EINVAL);
+}
+
+static void test_invalid_gt_id(int fd)
+{
+	test_invalid_arguments(fd, 255, DEFAULT_SAMPLE_RATE, DEFAULT_NUM_REPORTS);
+}
+
+static void test_invalid_sampling_rate(int fd)
+{
+	test_invalid_arguments(fd, 0, 251 * 10, DEFAULT_NUM_REPORTS);
+}
+
+static void test_invalid_event_report_count(int fd)
+{
+	test_invalid_arguments(fd, 0, DEFAULT_SAMPLE_RATE,
+			       NUM_DATA_ROWS(512 * 1024) * MAX_XECORES + 1);
+}
+
 static inline void enable_paranoid(void)
 {
 	write_u64_file(OBSERVATION_PARANOID, 1);
@@ -615,6 +662,18 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 	igt_subtest("unprivileged-access")
 		test_non_privileged_access(drm_fd);
 
+	igt_describe("Verify that invalid input GT ID fails the test");
+	igt_subtest("invalid-gt-id")
+		test_invalid_gt_id(drm_fd);
+
+	igt_describe("Verify that invalid input sampling rate fails the test");
+	igt_subtest("invalid-sampling-rate")
+		test_invalid_sampling_rate(drm_fd);
+
+	igt_describe("Verify that invalid input event report count fails the test");
+	igt_subtest("invalid-event-report-count")
+		test_invalid_event_report_count(drm_fd);
+
 	igt_fixture {
 		if (output)
 			fclose(output);
-- 
2.48.1

