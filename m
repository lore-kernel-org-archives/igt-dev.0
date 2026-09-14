Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4641C88E50
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 09:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B9510E0B4;
	Mon, 14 Sep 2026 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NY48Iv9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F9910E1B7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789379070; x=1820915070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sh/e4IAo5Sr2+gJFsfqWhFY30yEONhYmSUtH/agTmyI=;
 b=NY48Iv9ZugB1hRjVHen2Hb99CCKyE8kssmn6FTfo0DSxUhxT5LNSsV06
 UFinn/giCQN/fY3SZvxfAChePNGtVv7dlIvRlhxYfCrMNj0jBElXa7mBM
 PAUqUfgvw3thgqmVPo2vKV5DKi7O+856YRmfAI50A9xPl+a5bPtS837hU
 YpMoPda3ZuRnpEfGDdh5KBp+xsJHiaPE/prPx3s5tt/6qeiz9ivXITknO
 heOp1AnBZZPbpJwiES+h+hCdFSWBy0YXduPaHvuixqZIQjA89StzfVsah
 mOEnVDIyMPLFGkE98QH4O55mzKtCyeG5baM+5L/GUm1BxuODTYBcqjJVf g==;
X-CSE-ConnectionGUID: nqYuChi0RDm0ZNtrOo0eSg==
X-CSE-MsgGUID: Wt6XZ1lkQDebDpcVRcKy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89857822"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="89857822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:29 -0700
X-CSE-ConnectionGUID: Ro0LZVTiTO+szvJiDTdqzQ==
X-CSE-MsgGUID: 0w7yHkjGTjyF7Pa1ea7/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="273111451"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:44:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/kms_color: Add background-color subtest to
 test the BACKGROUND_COLOR property
Date: Mon, 14 Sep 2026 11:44:14 +0200
Message-ID: <20260914094415.10899-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
References: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
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

From: Maarten Lankhorst <dev@lankhorst.se>

The BACKGROUND_COLOR crtc property has recently been added.
Add some intel CRC tests to verify this property.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index dc3432df5..79ad6640a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -46,6 +46,10 @@
  * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
  *              set through GAMMA_LUT property
  *
+ * SUBTEST: background-color
+ * Description: Verify that a 8-bit background color has the same CRC
+ * as a 8-bit primary plane in the same color.
+ *
  * SUBTEST: ctm-%s
  * Description: Check the color transformation %arg[1]
  *
@@ -974,6 +978,61 @@ run_deep_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc)
 	test_cleanup(data);
 }
 
+static void
+run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+{
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	uint64_t black = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
+	uint64_t red  = DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);
+	uint64_t green = DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);
+	uint64_t blue = DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);
+	uint64_t colors[] = { black, red, green, blue };
+
+	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR));
+	test_setup(data, crtc);
+
+	mode = igt_output_get_mode(output);
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+
+	igt_output_set_crtc(output, crtc);
+
+	for (unsigned long i = 0; i < ARRAY_SIZE(colors); i++) {
+		igt_crc_t plane_crc, bg_crc;
+
+		uint64_t color = colors[i];
+		uint32_t xrgb =
+			(DRM_ARGB64_GETA_BPCS(color, 8) << 24) |
+			(DRM_ARGB64_GETR_BPCS(color, 8) << 16) |
+			(DRM_ARGB64_GETG_BPCS(color, 8) << 8) |
+			(DRM_ARGB64_GETB_BPCS(color, 8));
+
+		/*
+		 * Set a different background color and  a fully opaque plane
+		 * with the correct color.
+		 */
+		igt_draw_fill_fb(data->drm_fd, &fb, xrgb);
+		igt_plane_set_fb(data->primary, &fb);
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &plane_crc);
+
+		igt_plane_set_fb(data->primary, NULL);
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, color);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &bg_crc);
+
+		igt_assert_crc_equal(&plane_crc, &bg_crc);
+	}
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_remove_fb(data->drm_fd, &fb);
+	test_cleanup(data);
+}
+
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
@@ -1182,6 +1241,18 @@ run_tests_for_pipe(data_t *data)
 				break;
 		}
 	}
+
+	igt_describe("Verify that the background color is set correctly");
+	igt_subtest_with_dynamic("background-color") {
+		for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+			igt_dynamic_f("pipe-%s-background-color", igt_crtc_name(crtc)) {
+				run_background_color_tests_for_crtc(data, crtc, data->output);
+
+				if (igt_run_in_simulation())
+					break;
+			}
+		}
+	}
 }
 
 int igt_main()
-- 
2.55.0

