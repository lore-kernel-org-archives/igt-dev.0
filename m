Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DEBC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 09:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28AE10E032;
	Thu, 27 Mar 2025 09:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C391fRUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7110E032
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743068115; x=1774604115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DwyBWMSiQ2UdgQHH+wQyzNdkiYwAhBTZv0Y8SRNMm0s=;
 b=C391fRUBT5JnnMk2iSBzZLwONrT33nf9xIDWJtm7JSIVSDuHBevEadX+
 RLMZWHmlbtFr7EICwb4zVlWjj0Osla6r3Pc0qHAcgL3N9w1cNplEnTlqb
 J5zTqS5xkMMyfN7saVltZfHsZ1i1XzjXoWZD9S0ySDthM3wkTBibzKWnr
 EhdwGmHY5ZLDJIdggE1B/bPzbzwwhj4YRQ6Oie1ZHEh0w9kMvGAUTnhFl
 9TOS/J243ni6dbA53HVC8oMVSEAdMLvyhJS9av/efUF2GxXQOooUq2jVi
 QTHJUzmWRC+EhWn/KcrVFXWeCxX4lXpn1FeSIU1kamBGmVrOn9Q5T6r3G w==;
X-CSE-ConnectionGUID: ufIZnJKAQ1yacMjvbnj+bA==
X-CSE-MsgGUID: sZPBCM3gTVa+8oFgwtGp9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61918597"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="61918597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:35:15 -0700
X-CSE-ConnectionGUID: IU46fX0eSAqv+WuKjv/ekg==
X-CSE-MsgGUID: ba9gtGjlQ4qffghsXIecGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124847630"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:35:15 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] tests/intel/xe_eu_stall: Add invalid input tests for EU
 stall sampling
Date: Thu, 27 Mar 2025 02:35:10 -0700
Message-ID: <b11a8dcb7191270ac55a6ac4ddab89ed03a31f90.1743067979.git.harish.chegondi@intel.com>
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

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 964bb7c91..8f892a9ae 100644
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
 
+#define NUM_DATA_ROWS(SIZE)	((SIZE) >> 6)
+
+#define MAX_SUBSLICES		64
 #define NUM_ITERS_GPGPU_FILL	100
 #define DEFAULT_NUM_REPORTS	1
 #define DEFAULT_SAMPLE_RATE	(251 * 4)
@@ -283,6 +295,46 @@ static void set_fd_flags(int fd, int flags)
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
+	test_invalid_arguments(fd, 255,
+				   DEFAULT_SAMPLE_RATE,
+				   DEFAULT_NUM_REPORTS);
+}
+
+static void test_invalid_sampling_rate(int fd)
+{
+	test_invalid_arguments(fd, p_gt_id,
+				   (251 * 10),
+				   DEFAULT_NUM_REPORTS);
+}
+
+static void test_invalid_event_report_count(int fd)
+{
+	test_invalid_arguments(fd, p_gt_id,
+				   DEFAULT_SAMPLE_RATE,
+				   (NUM_DATA_ROWS(512 * 1024) * MAX_SUBSLICES) + 1);
+}
+
 static inline void enable_paranoid(void)
 {
 	write_u64_file(OBSERVATION_PARANOID, 1);
@@ -615,6 +667,18 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
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

