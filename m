Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADA4CE7AB6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 06:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EBC10E182;
	Fri,  6 Sep 2024 06:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwjcDafP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2450510E182
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725604507; x=1757140507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QI3Cuo6H41gB5hhbI4Am1HlPiM66tXJpV45mqO65rc8=;
 b=GwjcDafPobYgwLVh62mJjWHAE3lC6fW7hOcxmHjTOwNGML3ZbUcavn8V
 P1WsFn56bE6rX9gVbeI6kCf+KCD75CLD0Bchk40AHI+txLZhSLTd3JoDa
 nsHmPiQnyzGMyFkZVzbsSHfQRFFOrgLAW+SFWRrDxFM+SNjvmY0ZEApg3
 kmakZPC61vr3mAiB2eyUc2rtUJrton3+xNHfXPEapoFNY8o2cdzEKc9eW
 mAlKgA++AxWep3VC/swWX/Gogou3pZyvJOCNf4c/wSZTth8cqgEbeABCt
 WKKEGcrPCTwzuNdfbjt+taMeuSU55CdJk4igXgzYfuG6WD786cHZKwviC Q==;
X-CSE-ConnectionGUID: PRMWKSGzQIOn6BZG0BPDOg==
X-CSE-MsgGUID: QoM4a61+TN64bt1JNowdhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24226353"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24226353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:35:06 -0700
X-CSE-ConnectionGUID: mwDF88WKSDK9prM6+Bj10g==
X-CSE-MsgGUID: +eexblS9SUqqbn/Rej9JdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65908081"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:35:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: introduce new subtest to
Date: Fri,  6 Sep 2024 12:01:10 +0530
Message-Id: <20240906063110.509066-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

validate async flips with suspend resume
---
 tests/kms_async_flips.c | 53 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..fd851397e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -66,6 +66,9 @@
  *
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
+ *
+ * SUBTEST: async-flip-suspend-resume
+ * Description: Verify the async flip functionality with suspend and resume cycle
  */
 
 #define CURSOR_POS 128
@@ -672,6 +675,51 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	}
 }
 
+static void test_async_flip_suspend_resume(data_t *data)
+{
+	int ret, frame;
+	long long int fps;
+	struct timeval start, end, diff;
+	int suspend_time = 1;
+	int resume_time = 1;
+
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	gettimeofday(&start, NULL);
+	frame = 1;
+	do {
+		int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+				      data->bufs[frame % NUM_FBS].fb_id,
+				      flags, data);
+		igt_assert_eq(ret, 0);
+
+		wait_flip_event(data);
+
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+
+		if (diff.tv_sec == suspend_time) {
+			igt_info("system suspending\n");
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+			suspend_time = 0;
+		}
+
+		if (diff.tv_sec == resume_time) {
+			igt_info("system resuming\n");
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+			resume_time = 0;
+		}
+
+		frame++;
+	} while (diff.tv_sec < RUN_TIME);
+
+	fps = frame * 1000 / RUN_TIME;
+	igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		     "FPS should be significantly higher than the refresh rate\n");
+}
+
 static data_t data;
 
 igt_main
@@ -750,6 +798,11 @@ igt_main
 		run_test(&data, test_crc);
 	}
 
+	igt_describe("Verify the async flip functionality after suspend and resume cycle");
+	igt_subtest_with_dynamic("async-flip-suspend-resume") {
+		run_test(&data, test_async_flip_suspend_resume);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.25.1

