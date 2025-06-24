Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE04C7EE31
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F810E55D;
	Tue, 24 Jun 2025 09:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUoTfaix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63FC89316
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757085; x=1782293085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0n09bgL4xcVCKddptBkK0iY62ss0sWUKMAW4nHEJYLg=;
 b=mUoTfaixm3RsSiBf6px3M9ThVeiivXzmpeRim7D+u5hs7QbB0TK9DllA
 V4sT4q4aIWBkinSi+Po7S21L8fM6anDscGTRyN3TOrunAY6gFUUfMdZlC
 +fJFcS+6z7cN0TRWFwTHEuz5j9LRzZJKiHKYcaRcfBu6s7SshRTpaT6OP
 XsJYqQ9bz8Eh1vrpwAdH53CtS9HJFcECTnAQAZxdxebfoofKDLdAg9IXp
 AiSmCNlXIO27o6vjUrsMpzKqZMNthWUCKbfhc/fQCCvedcZl9mOSpubyV
 pfpEYQ4EKyYezZa65eeZQ3vFASljA0nFenaD/f7Cl/WOFRm/gNH1jpVoS w==;
X-CSE-ConnectionGUID: K25UqORWSdSYE/M3bQclcw==
X-CSE-MsgGUID: GWmswc90RIizayaThUYYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64418993"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="64418993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:33 -0700
X-CSE-ConnectionGUID: 6y1iz2sZSWmtr4bw22IuxA==
X-CSE-MsgGUID: rCv46suNSMmfhTtbgqQOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="157630918"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:28 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 4/4] tests/kms_async_flips: Add DPMS subtest
Date: Tue, 24 Jun 2025 14:54:20 +0530
Message-ID: <20250624092421.785063-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624092421.785063-1-karthik.b.s@intel.com>
References: <20250624092421.785063-1-karthik.b.s@intel.com>
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

Test functionality of async flips with DPMS.

v2: Update runtime to accomodate for first flip after DPMS (Arun)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5e39ca520..6560fb20d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -89,6 +89,9 @@
  * SUBTEST: async-flip-hang
  * Description: Verify the async flip functionality with hang cycle
  *
+ * SUBTEST: async-flip-dpms
+ * Description: Verify the async flip functionality with dpms cycle
+ *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
  *
@@ -136,6 +139,7 @@ typedef struct {
 	bool alternate_sync_async;
 	bool suspend_resume;
 	bool hang;
+	bool dpms;
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
@@ -375,6 +379,21 @@ static int perform_flip(data_t *data, int frame, int flags)
 	return ret;
 }
 
+static void check_dpms(igt_output_t *output)
+{
+	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+}
+
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -384,7 +403,7 @@ static void test_async_flip(data_t *data)
 	uint64_t ahnd = 0;
 	int mid_time = RUN_TIME / 2;
 	float run_time;
-	bool temp = data->suspend_resume || data->hang;
+	bool temp = data->suspend_resume || data->hang || data->dpms;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -455,10 +474,15 @@ static void test_async_flip(data_t *data)
 			hang = igt_hang_ring_with_ahnd(data->drm_fd, I915_EXEC_DEFAULT, ahnd);
 		}
 
+		if (data->dpms && diff.tv_sec == mid_time && temp) {
+			temp = false;
+			check_dpms(data->output);
+		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
-	if (data->suspend_resume)
+	if (data->suspend_resume || data->dpms)
 		run_time = RUN_TIME - (1.0 / data->refresh_rate);
 	else
 		run_time = RUN_TIME;
@@ -1069,6 +1093,14 @@ igt_main
 		data.hang = false;
 	}
 
+	igt_describe("Verify the async flip functionality after dpms cycle");
+	igt_subtest_with_dynamic("async-flip-dpms") {
+		test_init_ops(&data);
+		data.dpms = true;
+		run_test(&data, test_async_flip);
+		data.dpms = false;
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++) {
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.43.0

