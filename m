Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F2EC83F0A
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D5E10E3D1;
	Sun,  6 Jul 2025 19:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZU+tMBJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3691A10E3D0
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831704; x=1783367704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9YBXUCuVW6kwlPyqag5wnBGtB/0HWAbQ0u0ubTZfnU=;
 b=ZU+tMBJFskAnewEKgjG+LMACYxkrLoWvEysN23W41AukDHHAXFxlOD4U
 lLt5NFkx70hIOgHD1/j7dMtQYNPvF8/L+F2F4PsE9dU7jPE64XSygOmON
 yez3d1drxVsmVCu0wqzLrZJixFOfLqZSxJq2JQKNWTZsqFfAP/GWX6RFT
 c+lgpmOppDKfLXGkieqCMResGBwTDxg07Sxrtj0ZOs1eCAAOTmtd1PAGf
 V7ulpTutyL60rS+keiE7DfQL4O/2PWta/z95rHN6gz+EWbnsjGeGBIP8B
 OXmrKD3NaL+vXe0BUgXtxLNAtTHEiJmofIZA2rfSvCLO6kdKKbtS20bEW w==;
X-CSE-ConnectionGUID: 3AehZOEOSheMzzvaf2IwKg==
X-CSE-MsgGUID: oe39W9FcQVi8QbxVeyrH5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983017"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:55:04 -0700
X-CSE-ConnectionGUID: nwDOTY3cREe6YHMPqGvNlw==
X-CSE-MsgGUID: b+MofGF5T4y7fCegbo1Q4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064797"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:55:03 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 9/9] tests/kms_color: Add Intel plane pipeline tests
 with LUT1D and CTM
Date: Mon,  7 Jul 2025 01:31:25 +0530
Message-Id: <20250706200125.35741-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
References: <20250706200125.35741-1-swati2.sharma@intel.com>
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

For now, Intel plane color pipeline contains 3 colorops:
Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)

Create subtests to cover different combinations of available
colorops:
  igt@kms_color@plane-lut1d
  igt@kms_color@plane-lut1d-ctm3x4
  igt@kms_color@plane-ctm3x4-lut1d
  igt@kms_color@plane-lut1d-lut1d
  igt@kms_color@plane-lut1d-ctm3x4-lut1d

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c        | 131 ++++++++++++++++++++++++++++++---------
 tests/kms_color_helper.c |  55 +++++++++++++++-
 tests/kms_color_helper.h |  11 ++++
 3 files changed, 164 insertions(+), 33 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 1c61fac71..02c43901e 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -90,6 +90,11 @@
  * @ctm3x4-lut1d-multseg:		3X4 CTM --> 1D LUT MULTSEG
  * @lut1d-multseg-lut1d-multseg:	1D LUT MULTSEG --> 1D LUT MULTSEG
  * @lut1d-multseg-ctm3x4-lut1d-multseg: 1D LUT MULTSEG --> 3X4 CTM --> 1D LUT MULTSEG
+ * @lut1d:				1D LUT
+ * @lut1d-ctm3x4:			1D LUT --> 3X4 CTM
+ * @ctm3x4-lut1d:			3X4 CTM --> 1D LUT
+ * @lut1d-lut1d:			1D LUT --> 1D LUT
+ * @lut1d-ctm3x4-lut1d: 		1D LUT --> 3X4 CTM --> 1D LUT
  */
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
@@ -745,11 +750,13 @@ static void clear_lut_data(kms_colorop_t *colorops[])
 	int i;
 
 	for (i = 0; colorops[i]; i++) {
-		if (colorops[i]->type != KMS_COLOROP_MULTSEG_LUT1D)
-			continue;
-
-		if (colorops[i]->multseg_lut1d_info.lut)
-			free(colorops[i]->multseg_lut1d_info.lut);
+		if (colorops[i]->type == KMS_COLOROP_MULTSEG_LUT1D) {
+			if (colorops[i]->multseg_lut1d_info.lut)
+				free(colorops[i]->multseg_lut1d_info.lut);
+		} else if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D) {
+			if (colorops[i]->lut1d->lut)
+				free(colorops[i]->lut1d->lut);
+		}
 	}
 }
 
@@ -758,35 +765,62 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 	int i;
 
 	for (i = 0; colorops[i]; i++) {
-		uint64_t hwlut_caps = 0;
-		segment_data_t *segment_info;
+		if (colorops[i]->type == KMS_COLOROP_MULTSEG_LUT1D) {
+			uint64_t hwlut_caps = 0;
+			segment_data_t *segment_info;
+
+			hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
+			segment_info = get_segment_data(data->drm_fd, hwlut_caps);
+
+			igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
+
+			colorops[i]->multseg_lut1d_info.lut_size = segment_info->entries_count;
+			colorops[i]->multseg_lut1d_info.lut =
+				malloc(sizeof(struct drm_color_lut_32) * colorops[i]->multseg_lut1d_info.lut_size);
+			igt_assert(colorops[i]->multseg_lut1d_info.lut);
+
+			switch (colorops[i]->multseg_lut1d_info.lut_type) {
+				case KMS_COLOROP_MULTSEG_LUT1D_ZERO:
+					create_zero_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+					break;
+				case KMS_COLOROP_MULTSEG_LUT1D_LINEAR:
+					create_unity_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+					break;
+				case KMS_COLOROP_MULTSEG_LUT1D_MAX:
+				default:
+					create_max_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+			}
+			clear_segment_data(segment_info);
+		} else if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D) {
+			unsigned int size;
+			gamma_lut_t *lut;
+			struct drm_color_lut_32 *lut_32;
+
+			size = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_SIZE);
+			igt_assert_f(size <= MAX_COLOR_LUT_ENTRIES,
+					"LUT size %u exceeds max %u\n", size, MAX_COLOR_LUT_ENTRIES);
+
+			switch (colorops[i]->lut_type) {
+				case KMS_COLOROP_LUT1D_ZERO:
+					lut = generate_table(size, 0.0);
+					break;
+				case KMS_COLOROP_LUT1D_LINEAR:
+					lut = generate_table(size, 1.0);
+					break;
+				case KMS_COLOROP_LUT1D_MAX:
+				default:
+					lut = generate_table_max(size);
+			}
 
-		if (colorops[i]->type != KMS_COLOROP_MULTSEG_LUT1D)
-			continue;
+			lut_32 = coeffs_to_lut_32(data, lut, 32, 0);
+			igt_assert(lut_32);
 
-		hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
-		segment_info = get_segment_data(data->drm_fd, hwlut_caps);
-
-		igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
-
-		colorops[i]->multseg_lut1d_info.lut_size = segment_info->entries_count;
-		colorops[i]->multseg_lut1d_info.lut =
-			malloc(sizeof(struct drm_color_lut_32) * colorops[i]->multseg_lut1d_info.lut_size);
-		igt_assert(colorops[i]->multseg_lut1d_info.lut);
-
-		switch (colorops[i]->multseg_lut1d_info.lut_type) {
-			case KMS_COLOROP_MULTSEG_LUT1D_ZERO:
-				create_zero_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
-				break;
-			case KMS_COLOROP_MULTSEG_LUT1D_LINEAR:
-				create_unity_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
-				break;
-			case KMS_COLOROP_MULTSEG_LUT1D_MAX:
-			default:
-				create_max_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
-		}
+			colorops[i]->lut1d = calloc(1, sizeof(struct igt_1dlut));
+			igt_assert(colorops[i]->lut1d);
 
-		clear_segment_data(segment_info);
+			memcpy(colorops[i]->lut1d->lut, lut_32, size * sizeof(struct drm_color_lut_32));
+			free_lut(lut);
+		}
 	}
 }
 
@@ -1367,6 +1401,16 @@ run_tests_for_pipe(data_t *data)
 				.lut_type = KMS_COLOROP_MULTSEG_LUT1D_MAX,
 			},
 		};
+		kms_colorop_t lut1d_linear = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (linear LUT)",
+			.lut_type = KMS_COLOROP_LUT1D_LINEAR,
+		};
+		kms_colorop_t lut1d_max = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (max LUT)",
+			.lut_type = KMS_COLOROP_LUT1D_MAX,
+		};
 		kms_colorop_t ctm_3x4 = {
 			.type = KMS_COLOROP_CTM_3X4,
 			.name = "CTM 3X4 (red to blue)",
@@ -1408,6 +1452,31 @@ run_tests_for_pipe(data_t *data)
 			  .exp_colors = colors_red_to_blue,
 			  .colorops = { &lut1d_multseg_linear, &ctm_3x4, &lut1d_multseg_max, NULL },
 			},
+			{ .name = "lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-ctm3x4",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_max, &ctm_3x4, NULL },
+			},
+			{ .name = "ctm3x4-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x4, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-ctm3x4-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
+			},
 		};
 
 		igt_fixture {
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ba6890c86..e170202c2 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -220,6 +220,53 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut_32 *coeffs_to_lut_32(data_t *data,
+				          const gamma_lut_t *gamma,
+				          uint32_t color_depth,
+				          int off)
+{
+	struct drm_color_lut_32 *lut;
+	int i, lut_size = gamma->size;
+	uint64_t max_value = (1ULL << 32) - 1;
+	uint32_t mask;
+
+	if (is_intel_device(data->drm_fd))
+		mask = ((1ULL << color_depth) - 1) << (32 - color_depth);
+	else
+		mask = max_value;
+
+	lut = malloc(sizeof(struct drm_color_lut_32) * lut_size);
+
+	if (IS_CHERRYVIEW(data->devid))
+		lut_size -= 1;
+	for (i = 0; i < lut_size; i++) {
+		uint32_t r = gamma->coeffs[i].r * max_value;
+		uint32_t g = gamma->coeffs[i].g * max_value;
+		uint32_t b = gamma->coeffs[i].b * max_value;
+
+		/*
+		 * Hardware might encode colors on a different number of bits
+		 * than what is in our framebuffer (10 or 12bits for example).
+		 * Mask the lower bits not provided by the framebuffer so we
+		 * can do CRC comparisons.
+		 */
+		r &= mask;
+		g &= mask;
+		b &= mask;
+
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
+	}
+
+	if (IS_CHERRYVIEW(data->devid))
+		lut[lut_size].red =
+			lut[lut_size].green =
+			lut[lut_size].blue = lut[lut_size - 1].red;
+
+	return lut;
+}
+
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma)
@@ -537,9 +584,13 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-		fill_custom_1dlut(display, colorop);
+		if (!is_intel_device(display->drm_fd))
+			fill_custom_1dlut(display, colorop);
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
-		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
+		if (is_intel_device(display->drm_fd))
+			igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut_32));
+		else
+			igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
 		break;
 	case KMS_COLOROP_MULTSEG_LUT1D:
 		igt_colorop_set_multseg_1dlut(display, colorop->colorop, colorop->multseg_lut1d_info);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index c384de8a2..86f0a0e11 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -96,6 +96,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut_32 *coeffs_to_lut_32(data_t *data,
+				          const gamma_lut_t *gamma,
+				          uint32_t color_depth,
+				          int off);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
@@ -159,6 +163,12 @@ typedef enum kms_colorop_multseg_lut1d_tf {
        KMS_COLOROP_MULTSEG_LUT1D_MAX,
 } kms_colorop_multseg_lut1d_tf_t;
 
+typedef enum kms_colorop_lut1d_tf_v2 {
+       KMS_COLOROP_LUT1D_ZERO,
+       KMS_COLOROP_LUT1D_LINEAR,
+       KMS_COLOROP_LUT1D_MAX,
+} kms_colorop_lut1d_tf_v2_t;
+
 typedef struct kms_colorop_multseg_lut1d_info {
 	uint32_t lut_size;
 	kms_colorop_multseg_lut1d_tf_t lut_type;
@@ -177,6 +187,7 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_lut1d_tf_v2_t lut_type;
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
-- 
2.25.1

