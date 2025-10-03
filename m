Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D9CCD182
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F3710E8FF;
	Fri,  3 Oct 2025 12:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po5AgM6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAE110E8FD
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493961; x=1791029961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjCA7LgHvie3TCxLO0pwE5BdmpcWFC2zXZLwjl6qE9s=;
 b=Po5AgM6NPpb1+gmyFd9fRMp5NSv1y8SF0edxLTTvELfBR8hFKO/KAc0c
 iKA28A9xx6uKH1MjbLXaEeJR1pRzt+p3ZkEQR7wbR2lZyQyjbJYdnrY7T
 pZfLuzIb/d/9MQRKcPyx0IVngUeO5QG5THU4ftzUyrShie+ed2S2gMYZu
 dpvfkUKE5KuMCASF03ecxlog3TRnRhEgADNtqnTOVu70y41c1sRfVtkG0
 j5HwLR8C5c6Vg6vvsia9w7LiQpqXt1k3fCEq9A7K/bWaSohQd31gSorn2
 cxKlUKzxe5gEBiR/CDRYXxYgihQW2forQOc9e4U4p5CDbsADxX3WSGpVF g==;
X-CSE-ConnectionGUID: q2Vxbp7CS6WN9jkF8Y0F+A==
X-CSE-MsgGUID: a3n6uo9rSXmLNxTSVX0tIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399236"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:21 -0700
X-CSE-ConnectionGUID: 4/zBlGVHQWCyxktiPsGS0Q==
X-CSE-MsgGUID: rH72n7tySGa50v9/4cnkDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300170"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 9/9] tests/kms_color: Add Intel plane pipeline tests
 with LUT1D and CTM
Date: Fri,  3 Oct 2025 17:55:50 +0530
Message-Id: <20251003122550.729242-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003122550.729242-1-swati2.sharma@intel.com>
References: <20251003122550.729242-1-swati2.sharma@intel.com>
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
 tests/kms_color.c        | 125 ++++++++++++++++++++++++++++++---------
 tests/kms_color_helper.c |  50 +++++++++++++++-
 tests/kms_color_helper.h |  11 ++++
 3 files changed, 157 insertions(+), 29 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 3f38c484e..a854a24a0 100644
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
 
-		if (colorops[i]->type != KMS_COLOROP_MULTSEG_LUT1D)
-			continue;
+			hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
+			segment_info = get_segment_data(data->drm_fd, hwlut_caps);
 
-		hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
-		segment_info = get_segment_data(data->drm_fd, hwlut_caps);
+			igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
 
-		igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
+			colorops[i]->multseg_lut1d_info.lut_size = segment_info->entries_count;
+			colorops[i]->multseg_lut1d_info.lut =
+				malloc(sizeof(struct drm_color_lut32) * colorops[i]->multseg_lut1d_info.lut_size);
+			igt_assert(colorops[i]->multseg_lut1d_info.lut);
 
-		colorops[i]->multseg_lut1d_info.lut_size = segment_info->entries_count;
-		colorops[i]->multseg_lut1d_info.lut =
-			malloc(sizeof(struct drm_color_lut32) * colorops[i]->multseg_lut1d_info.lut_size);
-		igt_assert(colorops[i]->multseg_lut1d_info.lut);
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
+			struct drm_color_lut32 *lut_32;
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
+			lut_32 = coeffs_to_lut_32(data, lut, 32, 0);
+			igt_assert(lut_32);
 
-		clear_segment_data(segment_info);
+			colorops[i]->lut1d = calloc(1, sizeof(struct igt_1dlut));
+			igt_assert(colorops[i]->lut1d);
+
+			memcpy(colorops[i]->lut1d->lut, lut_32, size * sizeof(struct drm_color_lut32));
+			free_lut(lut);
+		}
 	}
 }
 
@@ -1369,6 +1403,16 @@ run_tests_for_pipe(data_t *data)
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
@@ -1410,6 +1454,31 @@ run_tests_for_pipe(data_t *data)
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
index 32925e4bc..d032739ba 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -220,6 +220,53 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut32 *coeffs_to_lut_32(data_t *data,
+				         const gamma_lut_t *gamma,
+				         uint32_t color_depth,
+				         int off)
+{
+	struct drm_color_lut32 *lut;
+	int i, lut_size = gamma->size;
+	uint64_t max_value = (1ULL << 32) - 1;
+	uint32_t mask;
+
+	if (is_intel_device(data->drm_fd))
+		mask = ((1ULL << color_depth) - 1) << (32 - color_depth);
+	else
+		mask = max_value;
+
+	lut = malloc(sizeof(struct drm_color_lut32) * lut_size);
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
@@ -540,7 +587,8 @@ void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-		fill_custom_1dlut(display, colorop);
+		if (!is_intel_device(display->drm_fd))
+			fill_custom_1dlut(display, colorop);
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f4a120894..5cab6d6f1 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -95,6 +95,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut32 *coeffs_to_lut_32(data_t *data,
+				         const gamma_lut_t *gamma,
+				         uint32_t color_depth,
+				         int off);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
@@ -152,6 +156,12 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_lut1d_tf_v2 {
+	KMS_COLOROP_LUT1D_ZERO,
+	KMS_COLOROP_LUT1D_LINEAR,
+	KMS_COLOROP_LUT1D_MAX,
+} kms_colorop_lut1d_tf_v2_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -164,6 +174,7 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_lut1d_tf_v2_t lut_type;
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
-- 
2.25.1

