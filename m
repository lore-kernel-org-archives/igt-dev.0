Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94124C7115A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 11:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EFA10E9FC;
	Thu, 19 Jun 2025 11:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsmInKGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1F910E9F6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 11:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750332228; x=1781868228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/yeDxlKxuSKVfWhbN/1dk3P+vP6hKWoYLpRyVJOnDak=;
 b=dsmInKGEl92pCPkdGsc3XS5kGkVRplYZrmJXEW2UdpYPwfAe6aRgBGkD
 RclmX7r4pD8r/Dl5Gkx3xAcfXmZIoMNCp9qEwOG12ekA1hlaMqiQT93Si
 KLaj8beOKmuR+fvkxUJKkzHYSWDTcb49VdQU/F35+XfEnuA6v94+qlJ2M
 MPg39/ewBfl70zLwDD1NjRGp89mw4xqpUh4Ycethik4XDxXQ2EEbEQJB9
 RE6VR4tHSBAwiZBwROjKi0Z3HikyDZPf95cBuGT8f8cDQckbdPVuUcta4
 /YhXDytwc6GT5lFiJIwlCxCkW0HpF0JHHoeAB9x4qCyOpFnZaPQ0/tQcy A==;
X-CSE-ConnectionGUID: p3AoSoaESxKWIEhtOfj7Og==
X-CSE-MsgGUID: XUMDDy6nQUaR5Of2+sNJUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52664814"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52664814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:47 -0700
X-CSE-ConnectionGUID: dHh9NALDR62TNZs3SAEkEw==
X-CSE-MsgGUID: 5/2cSwC0S0qa4vqfZumpwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="187829675"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:46 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
Date: Thu, 19 Jun 2025 16:53:34 +0530
Message-ID: <20250619112334.744213-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619112334.744213-1-karthik.b.s@intel.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8587e4675..b0f96ad95 100644
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
@@ -383,7 +402,7 @@ static void test_async_flip(data_t *data)
 	igt_hang_t hang;
 	uint64_t ahnd = 0;
 	int mid_time = RUN_TIME / 2;
-	bool temp = data->suspend_resume || data->hang;
+	bool temp = data->suspend_resume || data->hang || data->dpms;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -454,6 +473,11 @@ static void test_async_flip(data_t *data)
 			hang = igt_hang_ring_with_ahnd(data->drm_fd, I915_EXEC_DEFAULT, ahnd);
 		}
 
+		if (data->dpms && diff.tv_sec == mid_time && temp) {
+			temp = false;
+			check_dpms(data->output);
+		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
@@ -1063,6 +1087,14 @@ igt_main
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

