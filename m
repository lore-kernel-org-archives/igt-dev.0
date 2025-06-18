Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CEBC7115D
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F4B10E820;
	Wed, 18 Jun 2025 12:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPZq360G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2BC10E820
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250609; x=1781786609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqm0AM4EyhOAQhFuQmab6QAnhvrwWqoYHwyg+tXXdfc=;
 b=WPZq360GLgsvbQrYxNyv4W8PX+hWT9Kii2kQSYWNdg5Znuvd0st+z22M
 GR55Un2y8+GcQFkE115tpqix8paHPAYfbO9XcZSPeVmFtJsU7yB7ZDUVx
 eFJtB5X2osZ0zXIxEUzvuXPtETmSW2q3Z1dpkobA2ICTSZgT+GEiMoCbi
 bXfTPVYn/rg9TzUAB5LlphWTMNGZ+U1k3483Qrga8OCKYZaTjzgULiyqR
 mdEC6Vfpi2/eeeAoZVy4/ioK6cHhc/rQn2t32pGhKnH3aLlFZ8JJyew+L
 tl5vL42E992pqfHyiwOcP3A+x6QAsNRKPlJQDW6nBR7Xn/6LJ6yGxlqSm g==;
X-CSE-ConnectionGUID: N9FM3Bg8QniqviwbZ/EwNg==
X-CSE-MsgGUID: /dsJ1sc9QMuebT9rvPucIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690542"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:29 -0700
X-CSE-ConnectionGUID: 74Vp6HsZSL+d66e8mTq3/A==
X-CSE-MsgGUID: /aUaR4vSRzmOMDUAVUmCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150266123"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 6/9] lib/igt_color: Add support for 3x3 matrices
Date: Wed, 18 Jun 2025 18:18:46 +0530
Message-Id: <20250618124849.1587767-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618124849.1587767-1-swati2.sharma@intel.com>
References: <20250618124849.1587767-1-swati2.sharma@intel.com>
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add helpers to support 3x3 matrices.

v2:
 - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_color.h          | 10 ++++++++++
 tests/kms_color_helper.c | 30 ++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  5 +++++
 3 files changed, 45 insertions(+)

diff --git a/lib/igt_color.h b/lib/igt_color.h
index ca2d27ddc..5dca7e0a0 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -50,6 +50,16 @@ typedef struct igt_1dlut {
 	struct drm_color_lut_32 lut[MAX_COLOR_LUT_ENTRIES];
 } igt_1dlut_t;
 
+typedef struct igt_matrix_3x3 {
+	/*
+	 * out   matrix       in
+	 * |R|   |0  1  2 |   | R |
+	 * |G| = |3  4  5 | x | G |
+	 * |B|   |6  7  8 |   | B |
+	 */
+	double m[9];
+} igt_matrix_3x3_t;
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ded61ccad..5ca663d3d 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -397,6 +397,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
 			return true;
 		return false;
+	case KMS_COLOROP_CTM_3X3:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X3);
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
@@ -506,6 +508,9 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 	case KMS_COLOROP_ENUMERATED_LUT1D:
 		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
 		break;
+	case KMS_COLOROP_CTM_3X3:
+		igt_colorop_set_ctm_3x3(display, colorop->colorop, colorop->matrix_3x3);
+		break;
 	case KMS_COLOROP_CTM_3X4:
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
@@ -553,6 +558,31 @@ void set_color_pipeline(igt_display_t *display,
 	}
 }
 
+void igt_colorop_set_ctm_3x3(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const struct drm_color_ctm *matrix)
+{
+	struct drm_color_ctm ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (matrix->matrix[i] < 0) {
+			ctm.matrix[i] =
+				(int64_t) (-matrix->matrix[i] *
+				((int64_t) 1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else {
+			ctm.matrix[i] =
+				(int64_t) (matrix->matrix[i] *
+				((int64_t) 1L << 32));
+		}
+		igt_debug("CTM[%d]: %llx\n", i, ctm.matrix[i]);
+	}
+
+	/* set blob property */
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
+}
+
 void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix)
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 11abe7e46..fbfe58eb1 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -126,6 +126,7 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM_3X3,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
@@ -147,6 +148,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		igt_3dlut_t *lut3d;
+		const struct drm_color_ctm *matrix_3x3;
 		const igt_matrix_3x4_t *matrix_3x4;
 		double multiplier;
 	};
@@ -168,6 +170,9 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
 void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void igt_colorop_set_ctm_3x3(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const struct drm_color_ctm *matrix);
 void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
-- 
2.25.1

