Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B87FC61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 19:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA810E33F;
	Mon, 31 Aug 2026 19:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7gkyEmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E605810E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788204034; x=1819740034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pEijAbnmLLipm9g8/fQbZVyQbb7x0BA8dLGE0l2b2p8=;
 b=h7gkyEmGeeeKfgAsvoRVaMFi8pQTmqIJuSE+Q7cJC5XOF5jY+MvITKNa
 a3pAGffmEVNVObYEqpk4l6gljuzaHZyavYYOXKm7eAGvgXTPujlAgLZLN
 6H/IKk80QUlzZCscaZfWWvN5un+1PyawienQpueNj2txykYHvwoVxp4E8
 CXITY9oKOx/slpaoLmCol76rUYa1ilaT0GF9BypQOi9S6qu+FlINDa4KX
 aCIxgxEXE2DzEyIgo4x0grDIbrF+eoAIBHwYVhCgyWraLnkcG4plo+vB1
 Zm1NZ5yvWoCJOVjo3jE7negomgeDB6EmTOqWQglMydYr6hg9mhYnKWCYK A==;
X-CSE-ConnectionGUID: +u3x4M+HSDe+OopTPITgCQ==
X-CSE-MsgGUID: EOBryWTtRkOwqya3DPzRQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88549100"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88549100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:20:34 -0700
X-CSE-ConnectionGUID: gR0vdgF6R5KFcmsMXJFweA==
X-CSE-MsgGUID: ts5PtW7TSBi5opz4f8Rkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272392297"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:20:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v5 1/7] lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX to
 IGT_COLOROP_FIXED_MATRIX_TYPE
Date: Tue,  1 Sep 2026 00:59:29 +0530
Message-Id: <20260831192935.463134-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831192935.463134-1-swati2.sharma@intel.com>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
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

Rename the enum/prop name to match the actual DRM colorop property
name "FIXED_MATRIX_TYPE" and update its users accordingly.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Assisted-by: GitHub Copilot
---
 lib/igt_kms.c              | 2 +-
 lib/igt_kms.h              | 2 +-
 tests/kms_colorop_helper.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d78e3bee..1e27a25f6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -725,7 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
-	[IGT_COLOROP_FIXED_MATRIX] = "FIXED_MATRIX_TYPE",
+	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 695f666ba..c8fa11b47 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -363,7 +363,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
-	IGT_COLOROP_FIXED_MATRIX,
+	IGT_COLOROP_FIXED_MATRIX_TYPE,
 	IGT_NUM_COLOROP_PROPS
 };
 
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 3243d01d3..f58f629f5 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -263,7 +263,7 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
 	case KMS_COLOROP_FIXED_MATRIX:
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
-		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE, desired->fixed_matrix_info.fixed_matrix_type_name))
 			return true;
 		return false;
 	default:
@@ -411,7 +411,7 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		configure_3dlut(display, colorop, lut_size);
 		break;
 	case KMS_COLOROP_FIXED_MATRIX:
-		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
 					  colorop->fixed_matrix_info.fixed_matrix_type_name);
 		break;
 	default:
-- 
2.25.1

