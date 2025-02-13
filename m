Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D994C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0498010EA5A;
	Thu, 13 Feb 2025 11:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzS8Xboi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68510EA5A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444633; x=1770980633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7+ih9kp3dc3VSII8RpqO9SubcEQNBP7XkKHxZvxwAY=;
 b=TzS8XboiXPrSlMA5spivtzKRAGfCAra/KvtPU4KFHoVrz8gLq0vNFYfi
 1AFjUs6SMTdoqbIs9b3iM2zY3g17yAXAgWDNYeGRY6zaOK3imre+yVt/a
 aahDpqPEDqKyMKNeB+VDJ0OKms0qizUX5wCr/5Z7eLIZfoAvUoonwist6
 gZPVNCN6RAeXdjfEcuR09oVhAfMoj30a1ykGnsimK56aiIU4ZjIYRZVU1
 c0akqtjA141WN5G2NPWvP5XoNuiYRNdBNLg0+iZd3+jDMHuKokUmjSfl0
 POwlvE171dD29j/tbkEjESHZ3JKMnFcA8GH0ekajXtwuAwG4hT1zYWEwD w==;
X-CSE-ConnectionGUID: eNegEoqnTzW3p/wS5jWCHQ==
X-CSE-MsgGUID: tSkTS1O9Sr+LXyOMdiqGXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609481"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:52 -0800
X-CSE-ConnectionGUID: +n3M45T7SKSAQ/C4Y3znHA==
X-CSE-MsgGUID: D7SSal4bQe2CuUBFeYXaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094052"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:50 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel/kms_cdclk: Add conditions to filter
 valid outputs
Date: Thu, 13 Feb 2025 16:38:11 +0530
Message-Id: <20250213110814.351186-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213110814.351186-1-swati2.sharma@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Add vrefresh as an additional parameter to check if highest and
lowest refresh rates are identical.
Skip the test, if highres and lowres are the same, as no cdclk
transition will occur.
Store highres and lowres of valid outputs in an array for reuse later.

v2:-fixed description (Ankit)
   -highres lowres stored in previous loop (Ankit)
   -removed comments (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 50 ++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index e78d22e1d..75542e21b 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -223,7 +223,9 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
 		      igt_output_name(output));
 
-	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
+	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay &&
+		      mode_hi.vdisplay == mode_lo.vdisplay &&
+		      mode_hi.vrefresh == mode_lo.vrefresh,
 		      "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -261,8 +263,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
 	drmModeModeInfo *mode, mode_hi, mode_lo;
+	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
+	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
@@ -273,31 +277,45 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
-	i = 0;
 	for_each_connected_output(display, output) {
-		mode = igt_output_get_mode(output);
+		mode_highres[count] = *igt_output_get_highres_mode(output);
+		igt_require_f(mode_highres[count].hdisplay >= HDISPLAY_4K && mode_highres[count].vdisplay >= VDISPLAY_4K &&
+			      mode_highres[count].vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
+			      igt_output_name(output));
+
+		mode_lowres[count] = *get_lowres_mode(output);
+
+		if (mode_highres[count].hdisplay == mode_lowres[count].hdisplay &&
+		    mode_highres[count].vdisplay == mode_lowres[count].vdisplay &&
+		    mode_highres[count].vrefresh == mode_lowres[count].vrefresh) {
+			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
+				  igt_output_name(output));
+			continue;
+		}
+
+		valid_outputs[count] = output;
+		count++;
+	}
+
+	igt_skip_on_f(count < 2,
+		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
+
+	for (int k = 0; k < count; k++) {
+		mode = igt_output_get_mode(valid_outputs[k]);
 		igt_assert(mode);
 
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
-			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
-			      igt_output_name(output));
-
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, &mode_hi);
-		i++;
+		igt_output_set_pipe(valid_outputs[k], k);
+		igt_output_override_mode(valid_outputs[k], &mode_highres[k]);
 	}
+
 	igt_require(intel_pipe_output_combo_valid(display));
-	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
+
 	i = 0;
 	for_each_connected_output(display, output) {
 		pipe = &display->pipes[i];
-- 
2.25.1

