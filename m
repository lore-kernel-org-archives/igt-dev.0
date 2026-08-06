Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC90C55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76210EA23;
	Thu,  6 Aug 2026 11:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM/H83no";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522D10F1AA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017301; x=1817553301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V/mzwSrbTI2PghL/i9jurTULwm+3gq2tGqwam3z2Mno=;
 b=HM/H83noOwtGyTaqzzYHM1zCaxwKLpXjxae7y4w0d9AVnc7v3qzfeSG9
 MkpVnSGBJOG+oMbFws7HBNS9G8NsssIv3URWdKLBBk6L5Gtok/KTSxGae
 K/16aeoxjkAFMcTi22z0QT1uq+RG0ongViyVQitIg2gWvul2iIG1JXKoM
 3pvAGgnL3X8XUd3mMGV/HQrwPpfya4TD1aXOcguVwqJV2o3wXPwqDUBs9
 szUGnsNL74Cr1S2t5vlZlHAuloFlfB4gwNlLZVMJbTrEGEAIrW918t7Cl
 iR8uypc8wTbzMl44LpKWysTQDnxk8CoCGQLKMXV9uIapLpYE2ei0e5v6+ w==;
X-CSE-ConnectionGUID: 5FEGlPKkSC+nGItKxnefiQ==
X-CSE-MsgGUID: bmbDOudnShe2y+KOqeT6vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204784"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:55:01 -0700
X-CSE-ConnectionGUID: J9HN+AUHSMmnGPC4TVxjXQ==
X-CSE-MsgGUID: mHkqGVbDRJG7zYu/ZgxllA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552856"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:55:00 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_color_pipeline: Remove unused color_depth
 and drm_format
Date: Thu,  6 Aug 2026 17:33:44 +0530
Message-Id: <20260806120345.19406-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806120345.19406-1-swati2.sharma@intel.com>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
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

Remove the data->color_depth and data->drm_format assignments from
run_tests_for_plane() as they are not used anywhere in the color
pipeline test path.

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 3e821f8de..071b9ebfa 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -336,9 +336,6 @@ run_tests_for_plane(data_t *data)
 				test_setup(data,
 					   crtc);
 
-				data->color_depth = 8;
-				data->drm_format = DRM_FORMAT_XRGB8888;
-
 				test_plane_colorops(data, crtc,
 						    plane_colorops_tests[i].fb_colors,
 						    plane_colorops_tests[i].exp_colors,
-- 
2.25.1

