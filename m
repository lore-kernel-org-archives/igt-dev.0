Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5802ECE7AB9
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 07:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D11910E025;
	Fri,  6 Sep 2024 07:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8n8sdnH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C610E025
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725606356; x=1757142356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PtxWuK9G4A8TFCVxhazelmP0KDSsEOdKIJZITlT7nsk=;
 b=g8n8sdnH++gMr6AWh6RX+rCq4LSHdRKsq9Col5nGodfyG93JFaWvKR9P
 1SuBNSO5Kyc0sCwfDec8+bzYZtu5SrpaxjObwi0I6VJKgkOdOPDKerBZJ
 fFbzWF+mXKO/1k5rjDLhweucq4HVFFyaj8lXXL6TeAM3mpqjqeXWm6OEe
 85v302YoxYZz6zZd/jsoTpOy4QBaeZISFLRnZ09MrJ1Er6eTkhKTZaarv
 pd+tDWQq18sH2LqQ5aD2sgS/tC25jtiTCYu0i7QiFZdFhGnAsAW1YVZHI
 6JrGPSoK4TouVIF8a8wFpsOCoODPOYS1KgXx+8RXXxPTyjCl6QqJdlxwv g==;
X-CSE-ConnectionGUID: FZ1cfxXVRy+/M/hErLoR5g==
X-CSE-MsgGUID: BuVR664eTZOfs9XXdCsTgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46885108"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="46885108"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:05:56 -0700
X-CSE-ConnectionGUID: ZrvIl6ZcRaePa7zrFsJZ4g==
X-CSE-MsgGUID: aODVhTh6TleLyv6fg4Keeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96653324"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 00:05:54 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: add async flips suspend resume
 tests
Date: Fri,  6 Sep 2024 12:31:59 +0530
Message-Id: <20240906070159.509343-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906063110.509066-1-santhosh.reddy.guddati@intel.com>
References: <20240906063110.509066-1-santhosh.reddy.guddati@intel.com>
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
2.34.1

