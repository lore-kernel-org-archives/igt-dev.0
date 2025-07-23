Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63DBC83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 05:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1EA10E74B;
	Wed, 23 Jul 2025 05:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcTzsm9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6D10E74A
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753250040; x=1784786040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hTHUOj7azK9BzckEhXoKSWRze/rNR25Id+pnb0sQcIw=;
 b=LcTzsm9f24XuZwxSouZvatO2mfAHLhxNapNlWH1iVIQQODh2fAuEVMbj
 uI4biq9nCZnBdlI6Xv6kUl+wBIOwRsK+/CYJ9o1TFDCAZ8zRHOooHXGXc
 PbT8w0tlmf2c2EuXUkG3928DnJSWxuqNfYBlCNOADweiEhMUbRQRMgC51
 g3dA0anh775pSzqt5eXR0acVkEgJg0YYvEVrQlBotYHFrN26ILj/LVCJI
 oclPsYsbS38mrT/N91A5ZUrbuUSV5i4dIw2MtwaruoWYRglXUG/XozjXX
 sQOGIY18q+qrXFUpg9TX5R7UpUFmntbxwe7BJJIWECCALqQizYZDsfrrS A==;
X-CSE-ConnectionGUID: sH+9Ng/2Q5C5GNn4AaA/4w==
X-CSE-MsgGUID: o3MUJHfPQBeFe1uJROBw0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66950141"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66950141"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:54:00 -0700
X-CSE-ConnectionGUID: MsCmHRkTQHC1Qeo1UVOQpQ==
X-CSE-MsgGUID: 7Y19mT2VQSSKurM3zy1Xng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164794421"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:58 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 5/5] tests/kms_async_flips: Add DPMS subtest
Date: Wed, 23 Jul 2025 11:23:53 +0530
Message-ID: <20250723055353.1137242-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
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

v3: Rebase.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1d8ee10a9..8a943fe01 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -90,6 +90,9 @@
  * SUBTEST: async-flip-hang
  * Description: Verify the async flip functionality with hang cycle
  *
+ * SUBTEST: async-flip-dpms
+ * Description: Verify the async flip functionality with dpms cycle
+ *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
  *
@@ -141,6 +144,7 @@ typedef struct {
 	bool alternate_sync_async;
 	bool suspend_resume;
 	bool hang;
+	bool dpms;
 	struct buf_ops *bops;
 	bool atomic_path;
 	bool overlay_path;
@@ -386,6 +390,21 @@ static int perform_flip(data_t *data, int frame, int flags)
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
@@ -395,7 +414,7 @@ static void test_async_flip(data_t *data)
 	uint64_t ahnd = 0;
 	int mid_time = RUN_TIME / 2;
 	float run_time;
-	bool temp = data->suspend_resume || data->hang;
+	bool temp = data->suspend_resume || data->hang || data->dpms;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -488,10 +507,15 @@ static void test_async_flip(data_t *data)
 			break;
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
@@ -1206,6 +1230,14 @@ igt_main
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

