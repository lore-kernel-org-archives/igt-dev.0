Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29349C021AB
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E393B10E5E8;
	Mon, 17 Feb 2025 21:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgkypffJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA43710E5E7
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827821; x=1771363821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ldI42CkqxM8UpglImrRCjKx3nmEwMdsOMka1qWuqxSg=;
 b=lgkypffJqm7rfUEYaEBJcP+wh8B7RlZoVsjW5ajcZaCxDNHXXKnPgRmW
 Wu+o6P9yU4lzNwMBRRL0jR2cg8XdNfU8JK3sHtOBPPINtIObMA8q+8/wi
 ULa7e+oCHYWDGmZTTsr6dfBEd+5lMQSuh4C9fdso5G15SGzH+vbWOTEcK
 ven5w7SVGyb6G29vDsTXgNA7y2Z2zGcCAoettWhbVN9yO3dG63DgsZOVb
 sT6fGB4JUgZg2bvzcXSbWf7YKtoQSwd5PaAPH2b/bzzMhUvBMn7ezdMtQ
 BULixwt2FoQKpqMVmQQ3Ey2HxszXpHfBEZRzA44e+b6RwWb3p8FPGsYsp Q==;
X-CSE-ConnectionGUID: EZCFEtmVR02ujsWLBYlCrA==
X-CSE-MsgGUID: af8OjLZkRYWacuHDNSZD+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750693"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:21 -0800
X-CSE-ConnectionGUID: G+giXCaaQhmPapKkPotd5Q==
X-CSE-MsgGUID: bH+WNVrxTf20M+7TOMCGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411217"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/kms_cdclk: Add conditions to filter
 valid outputs
Date: Tue, 18 Feb 2025 03:05:29 +0530
Message-Id: <20250217213531.402162-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217213531.402162-1-swati2.sharma@intel.com>
References: <20250217213531.402162-1-swati2.sharma@intel.com>
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
v3:-use i iterator (Ankit)
   -use func() for skip

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_cdclk.c | 51 ++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 64c95043a..a4355baf2 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -87,6 +87,13 @@ static bool is_4k(drmModeModeInfo mode)
 	        mode.vrefresh >= VREFRESH);
 }
 
+static bool is_equal(drmModeModeInfo mode_hi, drmModeModeInfo mode_lo)
+{
+	return (mode_hi.hdisplay == mode_lo.hdisplay &&
+		mode_hi.vdisplay == mode_lo.vdisplay &&
+		mode_hi.vrefresh == mode_lo.vrefresh);
+}
+
 static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
 {
 	drmModeModeInfo *lowest_mode = NULL;
@@ -196,8 +203,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
 	              igt_output_name(output));
 
-	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
-		      "Highest and lowest mode resolutions are same; no transition\n");
+	igt_skip_on_f(is_equal(mode_hi, mode_lo), "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -233,8 +239,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode, mode_hi, mode_lo;
+	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
+	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
@@ -245,27 +253,38 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
-	i = 0;
 	for_each_connected_output(display, output) {
-		mode = igt_output_get_mode(output);
+		mode_highres[count] = *igt_output_get_highres_mode(output);
+		igt_require_f(is_4k(mode_highres[count]), "Mode >= 4K not found on output %s.\n",
+			      igt_output_name(output));
+
+		mode_lowres[count] = *get_lowres_mode(output);
+
+		if (is_equal(mode_highres[count], mode_lowres[count])) {
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
+	for (int i = 0; i < count; i++) {
+		mode = igt_output_get_mode(valid_outputs[i]);
 		igt_assert(mode);
 
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
-			      igt_output_name(output));
-
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, &mode_hi);
-		i++;
+		igt_output_set_pipe(valid_outputs[i], i);
+		igt_output_override_mode(valid_outputs[i], &mode_highres[i]);
 	}
+
 	igt_require(intel_pipe_output_combo_valid(display));
-	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
-- 
2.25.1

