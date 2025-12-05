Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29084D37490
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33F710EBA4;
	Fri,  5 Dec 2025 19:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGRqkKlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7CD10EBA4
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963995; x=1796499995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=weZc7E0h1vw59NdiChC9ANBeh1iyXoUZzJw4fx6uMwA=;
 b=lGRqkKlRVLJgtNyPP6cMr48T4LqmTZG0E3tqkDVm1W/T9WUxP+PLg+XQ
 Lv5MCpPDRyyMUjlsyfr8pY8om1ww3Y3hTlz+Z4BsFvyz7VSeISY5N+f51
 07jUfplXCYhvCTKDVg5vOw78m4ZtrqgUtDvfEaT58sMUx9dU5dPZvsGfj
 nQLBwSF2C9PGASfXJRSLm5wrBPCa9Jqc42nxoRXAAyeUcOEya85x8pI1w
 wTot5j0wfayLJ+Bhg9ZhRAZwlbHAHpnSRcRJFp5opzzoZesnWGHdjtu9D
 qYBaNiWHUnept3+RE+S4+KtoCRYp3+ph2npBK2xkMRP1nFxbB1CfTaAG3 g==;
X-CSE-ConnectionGUID: 4gwnQYSLQ/KCkpYDDxDlSw==
X-CSE-MsgGUID: pNB5+iFGTjWYL/74FY9j5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606673"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:35 -0800
X-CSE-ConnectionGUID: Bu03m/VQR5mu2w1flyKxFQ==
X-CSE-MsgGUID: ypvDIEQySBmbtizgALCFEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624906"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:33 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 11/13] tests/kms_colorop_helper: Skip custom 1D LUT fill on Intel
 devices
Date: Sat,  6 Dec 2025 01:23:10 +0530
Message-Id: <20251205195312.1234330-12-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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

Avoid calling fill_custom_1dlut() for Intel devices, as the LUT setup is
handled differently in the Intel color pipeline.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index b5951cfc1..f62f8e5d7 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -345,7 +345,8 @@ void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-		fill_custom_1dlut(display, colorop);
+		if (!is_intel_device(display->drm_fd))
+			fill_custom_1dlut(display, colorop);
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
-- 
2.25.1

