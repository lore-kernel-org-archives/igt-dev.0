Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CFF103A9AA
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 11:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F3D10E6C9;
	Wed, 25 Mar 2026 11:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSruqVi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4E310E6C9
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774437156; x=1805973156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3yPidTY1tN6oU0EREe8rsV7IKz9/e6ZSMYjptwY3xMk=;
 b=nSruqVi0YkVo7jEa6wzP1xqzdqoQK9vbtix+hY7ip6lm6Q/B6BAGkho5
 PoFI9hH2bc4noUyv+uh5Ysemkvh7HkLaOfDJ7HoYuSyOakzQe78Jm70ln
 92WGmOsY7JmwIUPoF9lpSftf4ZZtgrCk8cT9D0JEZLwc+WdgW0v+71O2g
 0f499A+kkhqRu3Jf226QF7FdtTJNydLp3zOIgRrxqpk89v+bP+js5PnB3
 D4TwxdaKYjrBtJIaJBlfmsLN0voAV81tuhA70oFjUAO5t+WGndLAd+OPp
 cCDtZ/z9WxFqIPw/p7j6sFLBJi4Gs9zh0qfxCeeR0Q7SqO1aLUF0GmifA w==;
X-CSE-ConnectionGUID: +P51cmkiQ0+b5PQuVg7Lag==
X-CSE-MsgGUID: 9Li3u963SH2PVCpvjdjbAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100916824"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="100916824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:12:36 -0700
X-CSE-ConnectionGUID: f6aHKMbdSjCQlFYNvO6MHw==
X-CSE-MsgGUID: ADsOSDVfTre/AL8+QwMoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223858580"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa010.jf.intel.com with ESMTP; 25 Mar 2026 04:12:34 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
Date: Wed, 25 Mar 2026 16:53:20 +0530
Message-Id: <20260325112320.2879230-1-pranay.samala@intel.com>
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

Set the output on CRTC before getting mode and override it on output,
so the selected mode is used consistently during validation.

Also handle the joiner bypass case where no non-joiner mode is available.

This avoids failures when CASF is run on joiner-capable outputs and
keeps execution on a valid non-joiner configuration.

v2:
- Get mode after setting output on CRTC (Karthik)

Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass joiner modes")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96fb139ae..c9fc191fd 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -438,7 +438,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			data->output = output;
 			data->crtc = crtc;
-			data->mode = igt_output_get_mode(data->output);
+
+			igt_output_set_crtc(data->output, data->crtc);
 
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
@@ -447,7 +448,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			 */
 			if (is_joiner_mode(data->drm_fd, data->output)) {
 				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
-				igt_info("Executing on mode %dx%d@%d\n",
+				if (!data->mode) {
+					igt_info("No non-joiner mode found on output %s\n",
+						 igt_output_name(data->output));
+					continue;
+				}
+
+				igt_info("Executing on non-joiner mode %dx%d@%d\n",
 					 data->mode->hdisplay,
 					 data->mode->vdisplay,
 					 data->mode->vrefresh);
@@ -455,15 +462,14 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				data->mode = igt_output_get_mode(data->output);
 			}
 
+			igt_output_override_mode(data->output, data->mode);
+
 			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				igt_crtc_name(data->crtc));
 				continue;
 			}
 
-			igt_output_set_crtc(data->output,
-					    data->crtc);
-
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data->output, NULL);
 				continue;
-- 
2.34.1

