Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD18C4829F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCAD10E606;
	Wed, 14 Feb 2024 06:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3DvfdoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9B10E606
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893167; x=1739429167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xf5q1jnDFk/Ra9t98MvL4mFH4Uz+PKuDOlPP6kQsLJI=;
 b=R3DvfdoL5dNdN1zyGzSuzmJIugobM7DVxGbdhXPuIXdoIQPa3IZCfwfh
 RJF45jyXNAkt1rKYzINQuBz7VxP3x76MiDRL3kZjLRz9/jPDj4iCmyLjI
 lh0v4ZYjkeb7VXxbf969qHXCWjApsgquNwbwQ50S2dvQmTOTp2MUZkemx
 v+nZQQZakIt85OhDh7u6oN+kVUtkHheVEL8HFvilK1ZUgwnIwhBXX0fTK
 qVTm7QQn+S/wk1ifwBWIJkOKECTlkarN2ZU9UL8zOPH04bVoqEWE8f7TX
 ZTW2XvTcZIAk3GMLHMoSsu3uSdbeOX15+KoMP3UXgJJF4ixjcN4U5psbP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645506"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427676"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:06 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 18/22] lib/igt_color: Add support for 3x3 matrices
Date: Wed, 14 Feb 2024 12:09:49 +0530
Message-ID: <20240214063953.1285495-19-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

Add helpers to support 3x3 matrices.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_color.h          | 10 ++++++++++
 tests/kms_color_helper.c | 30 ++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  5 +++++
 3 files changed, 45 insertions(+)

diff --git a/lib/igt_color.h b/lib/igt_color.h
index 46c399cd5..4137abeff 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -25,6 +25,16 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
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
index 02e5b975a..786f49141 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -394,6 +394,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X3:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X3);
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
@@ -484,6 +486,9 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 		break;
+	case KMS_COLOROP_CTM_3X3:
+		igt_colorop_set_ctm_3x3(display, colorop->colorop, colorop->matrix_3x3);
+		break;
 	case KMS_COLOROP_CTM_3X4:
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
@@ -523,6 +528,31 @@ void set_color_pipeline(igt_display_t *display,
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
index 566615ad9..e172b0318 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -126,6 +126,7 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM_3X3,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
@@ -146,6 +147,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const struct drm_color_ctm *matrix_3x3;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
@@ -164,6 +166,9 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
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
2.43.0

