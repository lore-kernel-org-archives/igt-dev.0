Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060B6D767CB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E9310EF21;
	Fri, 19 Dec 2025 11:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPRRN4Zg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1410310EF20
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143148; x=1797679148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w7dZuiyGkBIpIUp6b1RIUOjPxieCpiPX7vOjcIKu9+o=;
 b=mPRRN4ZgRd0xSzDgl+q1BCyuOp4LV52ZE6Md8qSC3pGsZ+PKW/cBoAyH
 sxppK+bSWHF+ImzYeydH2vUlfnqEssu0vfVyeru7I06Csjz7BnSl5JqM3
 8BoWfO0Gowb6BaRQ4+M17utGkJmqmGQVOmESjjIQffpGCza/AGnIkSnQp
 XHA8tiUDFRSncgG8w9N3x04Xr1kJR6zq/GVBQh4HFJnG0qsDZcV6ByB+e
 2yMXHkJhkmScOc7R8aREtc10wpFZ5ndy+vl1kc55B/Cw7Y4C0scWrWpSO
 98SNn2DBOJAcw/fLo1NVvAeqsU63Y9YqfNq5KE/b67Du9MrzOVsEOcGcN A==;
X-CSE-ConnectionGUID: RsWcfSS6T56piCkQA7yQLQ==
X-CSE-MsgGUID: xRhtoV8BT7Ge62beiFJY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816168"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:08 -0800
X-CSE-ConnectionGUID: kf5Rmg21S86b+GmiV3g/CA==
X-CSE-MsgGUID: 9tYGg+uQSRWV8KxqirvDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235491"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:07 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 4/8] tests/kms_color: Add test_plane_colorops() helper to validate
 plane color operations
Date: Fri, 19 Dec 2025 16:56:02 +0530
Message-Id: <20251219112606.1330425-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

Add test_plane_colorops() as a __maybe_unused static helper to
validate color operations applied on a plane. The helper sets up a
framebuffer, disables pipe color properties, applies the provided
color pipeline, and compares CRCs between expected and transformed
frames to verify correctness.

v2: -rename crc var (Chaitanya)
    -add skip if colorop not supported (Chaitanya)
    -remove prepare_lut_data (Chaitanya)
v3: -rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index edc31026b..c3c064d53 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -720,6 +720,67 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
+__maybe_unused
+static bool test_plane_colorops(data_t *data,
+				const color_t *fb_colors,
+				const color_t *exp_colors,
+				kms_colorop_t *colorops[])
+{
+	igt_plane_t *plane = data->primary;
+	igt_output_t *output = data->output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_colorop_t *color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_crc_t crc_software, crc_hardware;
+	struct igt_fb fb;
+	bool ret;
+
+	igt_skip_on(!color_pipeline);
+
+	igt_output_set_crtc(output, plane->pipe);
+	mode = igt_output_get_mode(output);
+
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fb));
+	igt_plane_set_fb(plane, &fb);
+
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	set_color_pipeline_bypass(plane);
+	paint_rectangles(data, mode, exp_colors, &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(plane->pipe);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
+
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	if (ctm_colorop_only(colorops))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(plane->pipe);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
+
+	ret = igt_check_crc_equal(&crc_hardware, &crc_software);
+
+	clear_colorops(display, plane, colorops);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_crtc(output, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
-- 
2.25.1

