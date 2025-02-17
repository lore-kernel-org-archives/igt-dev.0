Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA29C021AA
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6886C10E5EB;
	Mon, 17 Feb 2025 21:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlHtfILz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CBA10E5E7
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827823; x=1771363823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tOhJMGcVvDZpYrZvc9zcI4IT+hqBYtBHUGPAJDq+AsU=;
 b=KlHtfILz5FadDxf4IKzn5JIPIhZEPxPxhFaEAOJDBXvAvPvFoQROgfw3
 c1CeUN9My3VdLG6OfcrMHiJgITLRcGlAvVK34uzOPRUtKSmPzrRlab12c
 7dDEVIEJBYl/X4L9cQn+qfhYrWRL4fi1tvrTX+stfJcS5snvLtdWsVEVI
 WnNCMeJkUNDzha8OqCUvkiRtR2tvJ63BzhIafgAEg6jQKYPWmiY1zVRME
 b5UuEFVCyzl7GwwJ2gakZVUrV/eUwaWBODui2r79z5wRZYfigRvLupP7/
 grrH+ARbO9wej95BO9/to4HIbeka0cK/qIC5g4TeALHBLDO81YVwjN1tE Q==;
X-CSE-ConnectionGUID: IexP4aevT6i169q5gXt2dw==
X-CSE-MsgGUID: nLM3O/ocT3GxL6QHGhyLOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750694"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:22 -0800
X-CSE-ConnectionGUID: TwaX8wZjTjKs70Prp/+ypQ==
X-CSE-MsgGUID: fHP20cHOQLeVU+8ZSYVLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411220"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:21 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/kms_cdclk: Introduce set_mode()
Date: Tue, 18 Feb 2025 03:05:30 +0530
Message-Id: <20250217213531.402162-5-swati2.sharma@intel.com>
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

Encapsulate the mode-setting functionality in the set_mode
function to reduce redundancy.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_cdclk.c | 69 +++++++++++++----------------------------
 1 file changed, 22 insertions(+), 47 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index a4355baf2..b84ec5cae 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -235,20 +235,35 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
+		     igt_output_t **valid_outputs, struct igt_fb fb)
+{
+	igt_display_t *display = &data->display;
+	igt_pipe_t *pipe;
+	igt_plane_t *plane;
+
+	for (int i = 0; i < count; i++) {
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_output_override_mode(valid_outputs[i], &mode[i]);
+
+		igt_plane_set_fb(plane, &fb);
+		igt_fb_set_size(&fb, plane, mode[i].hdisplay, mode[i].vdisplay);
+		igt_plane_set_size(plane, mode[i].hdisplay, mode[i].vdisplay);
+	}
+}
+
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	drmModeModeInfo *mode, mode_hi, mode_lo;
-	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
+	drmModeModeInfo *mode, mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
 	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
 	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-	int i = 0, j = 0;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
@@ -288,51 +303,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
-	i = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_lo = *get_lowres_mode(output);
-
-		igt_output_override_mode(output, &mode_lo);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
-		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
-		i++;
-	}
 
+	set_mode(data, count, mode_lowres, valid_outputs, fb);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
 
-	j = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[j];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, j);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
-			      igt_output_name(output));
-
-		igt_output_override_mode(output, &mode_hi);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
-		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
-		j++;
-	}
-
+	set_mode(data, count, mode_highres, valid_outputs, fb);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = igt_get_current_cdclk(data->drm_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
@@ -340,7 +316,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	/* cdclk should bump */
 	igt_assert_lt(cdclk_ref, cdclk_new);
 
-	igt_plane_set_fb(plane, NULL);
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.25.1

