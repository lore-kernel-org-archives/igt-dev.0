Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC1CCD6E7B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 19:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328A611AAB7;
	Fri,  5 Jun 2026 19:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyZsep4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79E11AAB5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 19:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780686777; x=1812222777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wHYQRWCoVVLWs4x7b7vLRJ1vv+HE5gl2RO/IfSj3iOk=;
 b=ZyZsep4u1SRvgKrDm+7UfREaBzdqa3OS30403aV5Xk5qKs1HLCoS24iu
 WxlwcelWOliP9MKfwR4dBJdDzNWbZWYV4rzai552tdyoCDBzoBP2GuJbz
 jQ7CCiDrD1KHY8vmLf84lHVrlDpZlpzsxPwBVO/2pmYGBDjzU3EBNgTAP
 fVMQHJvUoGMgAEcoKX6etHCkJnUDXji9AY7VNhrnWyPCG8Wv2hTSLMYTf
 y1MkoXbK/M6n0VBr+SSDxJAU0nb+GwbPJXo2/VqcXJyCOJYy2m2C9NkZ4
 /HcLCPrlVQ/hgBbsc36fZlZcuPGD13qAZRlW1Q8M0DvzGmDhttKb4ZIIy g==;
X-CSE-ConnectionGUID: DS9jkBYoQRGui9n7BJRspQ==
X-CSE-MsgGUID: j8zFKd0FQS+uz19k1XVj3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81383702"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81383702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 12:12:56 -0700
X-CSE-ConnectionGUID: mrcIkbCSRC66BNp5AwzF9Q==
X-CSE-MsgGUID: 6RATFgSYT6SbgI4XBs2m4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="246758210"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 12:12:55 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/kms_hdr: Use non-modeset commit for HDR metadata swaps
Date: Sat,  6 Jun 2026 00:51:49 +0530
Message-Id: <20260605192149.2601366-1-swati2.sharma@intel.com>
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

When DSC is forced for the SDR transition, use a full modeset since
forcing DSC changes compression parameters that require a modeset.

v2:
 - Use full modeset when TEST_NEEDS_DSC is set for the SDR transition
   instead of documenting it as a known issue

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_hdr.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index affd38887..d786f7f9c 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -459,32 +459,28 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 
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
+	/* Enter SDR via metadata. When DSC is forced, a full modeset
+	 * is needed due to DSC parameter changes; otherwise only
+	 * infoframe content changes. */
 	igt_hdr_fill_sdr(&hdr);
 	igt_hdr_set_metadata(data->output, &hdr);
-	if (is_amdgpu_device(data->fd))
-		igt_display_commit_atomic(display, 0, NULL);
-	else
+	if (flags & TEST_NEEDS_DSC)
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	else
+		igt_display_commit_atomic(display, 0, NULL);
 	igt_debug_interactive_mode_check("traditional-sdr",
 					 "SDR pattern displayed with traditional SDR metadata");
 
-- 
2.25.1

