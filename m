Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC73CE8D60
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C6C10EAD9;
	Fri, 14 Nov 2025 17:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FekBcn4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41B310EAEA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140960; x=1794676960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5vVjEl9H0uCM8i8DFiSu+L1Jiu00zR3a7unr77Albk=;
 b=FekBcn4KPgH+39rWfqDn0uLqcCnjNaJgV6y7LUYWgqAav4L/XmqApQIW
 pUPwwTqWHmjZcj1Wo6KaaH9fVBtiSsbyO2wax4RBqi3ojbwvbCTCsqs0S
 ZaXSGKYk0E7slxbCI2aFoFwF4qPB5bVB+DG8Tyy+tGZKbZdG1VRmoyoRg
 MsSQ5to02w3VcaxxoGc9C0UjHoaJnpXH0pYOJAHkrTXXXFzueXndw4Q1d
 jtYFS+1G5pUypcU3RjkYVNOqzpwQ8jkD3qCBrVdVEV9E8NJTik4/F5PjX
 8AqMIHgdZA4dNXo+42aNpAzFw6qVGR/Y+HXnpW522W7TXvdGxQCh1byOS g==;
X-CSE-ConnectionGUID: Jv1NKlS4QlGD3a4juYWScg==
X-CSE-MsgGUID: 9/Ur0F1dQ9WwlcoIhi5O3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871446"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871446"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:40 -0800
X-CSE-ConnectionGUID: Go1WiL8RSiGdF/7fzECedA==
X-CSE-MsgGUID: a0+PJY4uSWKgtPZ6M7OWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981448"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:39 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 09/23] tests/kms_color: Add test_plane_colorops() helper to
 validate plane color operations
Date: Fri, 14 Nov 2025 22:58:54 +0530
Message-Id: <20251114172908.1027816-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

It uses prepare_lut_data(), ctm_colorop_only(), and
clear_lut_data() for LUT setup, CTM-only handling, and cleanup.
__maybe_unused avoids compilation warnings when unused.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 7c113de85..576fd5329 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -784,6 +784,78 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
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
+	igt_crc_t crc_gamma, crc_fullcolors;
+	struct igt_fb fb;
+	bool ret;
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb));
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	set_color_pipeline_bypass(plane);
+	paint_rectangles(data, mode, exp_colors, &fb);
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(data->drm_fd,
+		display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw gradient colors with LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	prepare_lut_data(data, colorops);
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	if (ctm_colorop_only(colorops))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_gamma);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	ret = igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
+
+	clear_lut_data(colorops);
+	clear_color_pipeline(display, plane, colorops, color_pipeline);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
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

