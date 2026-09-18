Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2EEC88E75
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CED310E95F;
	Fri, 18 Sep 2026 08:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYoun2n+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8910E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719887; x=1821255887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wM2XN98zF1957gsdCL7JmUJhXyeX9RDfABlIDW/wifs=;
 b=fYoun2n+w3OYGHMPnwSdF/JhJMySDu1KTZi1Ffx875Fda0U8MynWsMcv
 w27Y2jYrKWzhNavYpc4MZCrgnvpRsL2SnUD/YNDrW0NXkKgzijd/RFZcK
 h8O/blvYrh4vf24o1UgRnF2RqBFLMaNqKKOgFwfssSdGqsRPUVWTwpgHR
 zIUB56Mf2TsbEj3wAHyJ8p3NnnYhYlOPBs3SwyUwPp39sDT5UmLLJR6e4
 ShvM4Y+g3a0VNqi9vuLlhtdWw3QvcmLLni+YjSenfTTz1Y4X0LtOpTszP
 zdpvFJ/yeC/VwAXZQOhjWeg2ouGHUWBA3o4ch14oDNZAaQR3pDZwXUGGA A==;
X-CSE-ConnectionGUID: iKi7T9OQSOqPijCQrUgxZQ==
X-CSE-MsgGUID: 8yDUcetGQ3OvJZ8kTQfaNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870703"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:46 -0700
X-CSE-ConnectionGUID: 9qUMu+cITwSR1HLvy68NmQ==
X-CSE-MsgGUID: hcEfuUZ7R7qCRNM71JzD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965406"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:45 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t, v6 1/6] lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX to
 IGT_COLOROP_FIXED_MATRIX_TYPE
Date: Fri, 18 Sep 2026 14:03:45 +0530
Message-Id: <20260918083350.1021184-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c              | 2 +-
 lib/igt_kms.h              | 2 +-
 tests/kms_colorop_helper.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 22418f359..38763980a 100644
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
index 671462ede..72e19056e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -369,7 +369,7 @@ enum igt_atomic_colorop_properties {
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

