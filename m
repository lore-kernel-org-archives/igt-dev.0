Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A60C61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 19:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBE810E33F;
	Mon, 31 Aug 2026 19:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxp6s1mM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529810E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788204040; x=1819740040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XCVGVRlX0a+FqS2HqkAQtDme8DzoChPTLIY2nn29yNs=;
 b=Uxp6s1mM3zhylVZMpeblDaa02UjThTnzyG/RKgEuj0m5Ih34jcHTxjKb
 w7nEDMvGjz58H3zcBRnu8vAxd0kDM8eaqcXVL+A2mzNY+pA/sCrIa27n+
 RxZA/Fcd/mwZhhaf7fLOm+/CV+2j7nRhkJNlbcU0pOSKQ0I1lAU4iFdTp
 eyim05od6I4KXR/Vm+Fz/7eUuLRPbn2s5DjEF5Y5V4Nkg4wBssYc0sVa6
 /JJcjzTLqb9l9MKY3NWALIUt+/qSBZooEEvcI1yexNpAfqu+xJJ38yGnZ
 Nbul7KPatTZEqQn+QirQT6fefh3zZLLD0Xg3Dn33e03HIAT+A6yMjMIWu w==;
X-CSE-ConnectionGUID: BMhnHKY8SOGx616s24LPVg==
X-CSE-MsgGUID: IqPSNsInQQmZVf/+w1/tvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88549114"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88549114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:20:40 -0700
X-CSE-ConnectionGUID: 6o+XNxQpQWe5zug0EaUE7A==
X-CSE-MsgGUID: ywjY3qpNSFOalJJhHA6pig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272392357"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:20:39 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 5/7] tests/kms_color_pipeline: Remove unused color_depth and
 drm_format
Date: Tue,  1 Sep 2026 00:59:33 +0530
Message-Id: <20260831192935.463134-6-swati2.sharma@intel.com>
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

Remove the data->color_depth and data->drm_format assignments from
run_tests_for_plane() as they are not used anywhere in the color
pipeline test path.

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index c8ee68992..f983bb0be 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -343,9 +343,6 @@ run_tests_for_plane(data_t *data)
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

