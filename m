Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5FBE77188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 06:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9F10E8B1;
	Thu, 16 Jan 2025 06:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrCNv4n7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDEE10E8B1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737007333; x=1768543333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CiFnnXQRMKf3oT2bwV5CLPFXp/kmuDF9LWvtJcyQujs=;
 b=MrCNv4n7Ch7qa7tkgGfHt4NPWH5YBbKV3Lr3NMiehbNv8VvhIOBdLqOQ
 xUY9uXe1bmfVVzrdG+gEi3bIsXtI/fhg5J+fS9DeKhRaKfiYri8HyDcip
 cl8KnOOZHA4PE5mNg1KEnWZNBbC9GEfNvKrTTMMPwdhacw0CUctdybnpS
 VQzb4rIAgBi9zi1eKgPd1UX8oypCTjlmf6WWq/PDrh9xqkhEkxBuEvwQ5
 Zy8bJ0jQ30Xs9bkVGqyx82oZGhYEIBIViGLXtejzvGf2SCuFL+zuT7H41
 tX1oY8HZJDKzEuMZNi4gGuOpxFLdkm2ngMuv4/BKtMvlv+3xv2RR+JOwB w==;
X-CSE-ConnectionGUID: sSbcq7/7RpuDJ9R19rifvA==
X-CSE-MsgGUID: IR3REbyxRhGHpuZ7TDKgHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37257445"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37257445"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 22:02:13 -0800
X-CSE-ConnectionGUID: JowDHYqNTfSMYgvqtY++HQ==
X-CSE-MsgGUID: I4zmbknxRBqJhRJHLRAVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109411054"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 22:02:11 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: fit modes in mst bw
Date: Thu, 16 Jan 2025 11:47:49 +0530
Message-Id: <20250116061749.2082287-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Instead of checking only currrent modes,
find combination of modes in mst topology
that can be accomodated in current link bw.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2633
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_display_modes.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e41c60cc0..a582ba1a9 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -60,6 +60,22 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
+static bool fit_modes_in_bw(data_t *data)
+{
+        bool found;
+        int ret;
+
+        ret = igt_display_try_commit_atomic(&data->display,
+                                            DRM_MODE_ATOMIC_TEST_ONLY |
+                                            DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+        if (ret != 0) {
+                found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
+                igt_require_f(found,
+                              "No valid mode combo found for modeset\n");
+        }
+        return true;
+}
+
 /* Get higher mode supported by panel. */
 static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 {
@@ -279,7 +295,6 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 	struct igt_fb fbs[2];
 	igt_display_t *display = &data->display;
 	igt_plane_t *plane[2];
-	int ret;
 
 	igt_display_reset(display);
 
@@ -306,8 +321,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 	igt_output_override_mode(data->mst_output[1], &data->mode_mst[1]);
 
 	igt_require(intel_pipe_output_combo_valid(display));
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_assert(ret != 0 && errno == ENOSPC);
+	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
 }
 
 igt_main
-- 
2.25.1

