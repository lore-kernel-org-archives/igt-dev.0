Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D839EC982D0
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 19:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808B010F08A;
	Thu, 17 Sep 2026 19:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0RusP3R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEFE10F091
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789672174; x=1821208174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j9ZraWSNSFqpc/gPkeVFABDTsypOsT345Y2U4a2WqEg=;
 b=R0RusP3ROMx6R4gA9Nh17cUX01nWA89E5SlKLCyRu1JSS3EtUS74fytG
 ngfB8Ra+D+cEKY00K78IO9OtlJPthQsiKA39OjemBd5laOj7UhDwyZ4HH
 4AmBCi1wmM97aUYK8IcA3klps0ykEilsz8de2Q9Ryko76ov4EpThZfZZs
 9B6EBEGiLIH4Edmfw6+3OPKxxKMQGEflXmOEUPwchqModrguh+Y+38ZUu
 jrBzNaO1RzvvcYSFm1Q3ytlpOzMMdod4Pf7i+hA6OcAxBj3YpU4zWw8QW
 RUB1yiyJrAJIF9gSSMFL6Yvmq8OpqAGdDgBoZWwUHhQkzCjHT7ZexQLDS A==;
X-CSE-ConnectionGUID: 0JoEZCYQQLeA1/sKrylUhA==
X-CSE-MsgGUID: 7w7lWDcITa+KDYt6Xnv+TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639296"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:09:34 -0700
X-CSE-ConnectionGUID: WGlm34oCRoCF9cNwE3sdMA==
X-CSE-MsgGUID: UU3su+fGTsmaJ8sOnYunvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270271237"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:09:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t,
 v5 2/3] tests/kms_color: Add background-color subtest to test the
 BACKGROUND_COLOR property
Date: Fri, 18 Sep 2026 00:48:34 +0530
Message-Id: <20260917191835.977425-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
References: <20260917191835.977425-1-swati2.sharma@intel.com>
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
2.25.1

