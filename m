Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084F108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187A810EAB0;
	Fri, 20 Mar 2026 11:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPubvaKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2610EAC3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005931; x=1805541931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xeZsrYCQYh9bM9KM2sybULanV7oAVQW2dGFOy527f1A=;
 b=ZPubvaKhvAY4MXgoxnRDnOeSsFtrLwuAxQCBXmXylxhWuWoygVSn5fJc
 e2lzbxix+ofoc5ieFWhtnlpaOn6MCq972xPvCLp/wIr+0WM6N77mUebg/
 kQ/9Vi//A38XBWTg+epj4xTnctwhfpM+JKrAQakw52pwIzdMl/TMIkCVY
 Esc7tQmO/HCzAbqU/nMclWoldkze2PclpBDmZeOMvuP0DI/f9fI+MfqO1
 cMSjC0daV0Qev2++ot9q7+Af99mlYgW+vmlwjpC0+uYPeiyv4VCIovvxl
 t6C5VbhFR87UcNreqNVDKYpl8Rk/hDwQK2m2f277F3YIjLmJLRISwo7HI w==;
X-CSE-ConnectionGUID: yR002DmESdWXjBKCQKYs6Q==
X-CSE-MsgGUID: ZtdjnheSRym32G3sw1Ceww==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86451014"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="86451014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:30 -0700
X-CSE-ConnectionGUID: gf0scPxoSAmoplvi6eYW3Q==
X-CSE-MsgGUID: C+3xvY4fTLS8gFqtaKjH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223286899"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 4/7] tests/amdgpu/amd_hotplug:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:54 +0200
Message-ID: <496438e69c6218b997713813d57b489b3287fd6c.1774005763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

For amdpgu, crtc->crtc_index == crtc->pipe always. Use the generic and
GPU agnostic crtc->crtc_index instead of the vendor specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>

Review tip: apply and use this to ignore the whitespace changes:

git show --color-words --word-diff-regex="\w+"
---
 tests/amdgpu/amd_hotplug.c | 52 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 15092cc9fdec..5049eca88439 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -54,17 +54,15 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		data->crtc[crtc->pipe] = crtc;
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
-									  DRM_PLANE_TYPE_OVERLAY,
-									  0);
-		data->cursor[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								   DRM_PLANE_TYPE_CURSOR);
-		data->pipe_crc[crtc->pipe] =
-			igt_crtc_crc_new(crtc,
-					 IGT_PIPE_CRC_SOURCE_AUTO);
+		data->crtc[crtc->crtc_index] = crtc;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->overlay[crtc->crtc_index] =
+			igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, 0);
+		data->cursor[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_CURSOR);
+		data->pipe_crc[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
@@ -95,7 +93,7 @@ static void test_fini(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
+		igt_pipe_crc_free(data->pipe_crc[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
@@ -154,29 +152,29 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 
 	/* Setup all outputs */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
+		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
-		igt_create_pattern_fb(data->fd, data->w[crtc->pipe],
-				      data->h[crtc->pipe],
+		igt_create_pattern_fb(data->fd, data->w[crtc->crtc_index],
+				      data->h[crtc->crtc_index],
 				      DRM_FORMAT_XRGB8888, 0,
-				      &ref_fb[crtc->pipe]);
+				      &ref_fb[crtc->crtc_index]);
 		igt_output_set_crtc(output,
 				    crtc);
-		igt_plane_set_fb(data->primary[crtc->pipe],
-				 &ref_fb[crtc->pipe]);
+		igt_plane_set_fb(data->primary[crtc->crtc_index],
+				 &ref_fb[crtc->crtc_index]);
 	}
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Collect reference CRCs */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
+		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
-					 &ref_crc[crtc->pipe]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->crtc_index],
+					 &ref_crc[crtc->crtc_index]);
 	}
 
 	if (suspend) {
@@ -191,17 +189,17 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 
 	/* Trigger hotplug and confirm reference image is the same. */
 	for_each_crtc(&data->display, crtc) {
-		output = data->output[crtc->pipe];
+		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
 		igt_amd_trigger_hotplug(data->fd, output->name);
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
-					 &new_crc[crtc->pipe]);
-		igt_assert_crc_equal(&ref_crc[crtc->pipe],
-				     &new_crc[crtc->pipe]);
-		igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->crtc_index],
+					 &new_crc[crtc->crtc_index]);
+		igt_assert_crc_equal(&ref_crc[crtc->crtc_index],
+				     &new_crc[crtc->crtc_index]);
+		igt_remove_fb(data->fd, &ref_fb[crtc->crtc_index]);
 	}
 
 	test_fini(data);
-- 
2.47.3

