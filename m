Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E10CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE0810E961;
	Wed, 27 May 2026 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILpK2vAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DE10E95F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779909736; x=1811445736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vp5tR0O5jrPttUIJgpEPYdkAvID0uzWvb6ySv43YgNo=;
 b=ILpK2vAu4//zufkchwmX3x89Eva3RJNDXmqLJc+dq7Ngw08WLUP9S4QJ
 4n/fTWbrtHjubJFouSbu7xAyJTqA89uyc7psTlY5MfIVy86j6opPTwnsX
 k4NOegS5uXglNApy4i90dQcNjkpjnJ2M4fGYa+If7MOIKQvSS+FOyL1Mf
 oHRHjErGBbIWeDsKqOD5lH9pLYcaaiLlDEBzE/vHAbNKMLOfC4Qa0sA6y
 mt3i0hg5kqBOfdta4ImmsHJtEFH0TVtBHMLhYqPcC/vvLmdM1wdwXO1d9
 yE6ic016wN0uQkj0NYQSM1kkK+yocYMax8/5WJSo8BDr+fjAJWat6+Yrn w==;
X-CSE-ConnectionGUID: qIBijK9+RiCcyrBAsnhlGQ==
X-CSE-MsgGUID: AI90XgFZR6yZM7BweeuTow==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91057306"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91057306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:22:16 -0700
X-CSE-ConnectionGUID: 56yuPlZdQgGDBMwi4rzsGA==
X-CSE-MsgGUID: xCrIYUQqTauh2/i/rvlX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="247280901"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 12:22:13 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Use non-modeset commit for HDR metadata
 swaps
Date: Thu, 28 May 2026 01:01:04 +0530
Message-Id: <20260527193104.2533212-1-swati2.sharma@intel.com>
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

HDR metadata transitions (mastering info change within HDR, and
HDR-to-SDR via metadata) should only update infoframe content and
not require a full modeset. Remove the is_amdgpu_device() conditional
and use flags=0 (no DRM_MODE_ATOMIC_ALLOW_MODESET) for both drivers.

Known issue: static-swap subtest with TEST_NEEDS_DSC may fail on
Intel when DSC is forced for the SDR transition. The forced DSC path
computes a different compressed BPP compared to the natural DSC
fallback path, causing DSC parameter mismatches that trigger
'fastset requirement not met' in the kernel. This may require a KMD
fix to ensure consistent DSC BPP computation between forced and
natural DSC selection paths.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index affd38887..3a38ae8e2 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -459,32 +459,24 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
-	/* Change the mastering information, no modeset allowed
-	 * for amd driver, whereas a modeset is required for intel
-	 * driver. */
+	/* Change the mastering information, no modeset required
+	 * as only infoframe content changes. */
 	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
 	hdr.hdmi_metadata_type1.max_fall = 200;
 	hdr.hdmi_metadata_type1.max_cll = 100;
 
 	igt_hdr_set_metadata(data->output, &hdr);
-	if (is_amdgpu_device(data->fd))
-		igt_display_commit_atomic(display, 0, NULL);
-	else
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(display, 0, NULL);
 
 	if (flags & TEST_NEEDS_DSC) {
 		igt_force_dsc_enable(data->fd, data->output->name);
 		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
-	/* Enter SDR via metadata, no modeset allowed for
-	 * amd driver, whereas a modeset is required for
-	 * intel driver. */
+	/* Enter SDR via metadata, no modeset required as only
+	 * infoframe content changes. */
 	igt_hdr_fill_sdr(&hdr);
 	igt_hdr_set_metadata(data->output, &hdr);
-	if (is_amdgpu_device(data->fd))
-		igt_display_commit_atomic(display, 0, NULL);
-	else
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(display, 0, NULL);
 	igt_debug_interactive_mode_check("traditional-sdr",
 					 "SDR pattern displayed with traditional SDR metadata");
 
-- 
2.25.1

