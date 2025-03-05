Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B176FC282DE
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 17:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659CF897AC;
	Wed,  5 Mar 2025 17:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzWXtgEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0D5897AC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741197504; x=1772733504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PUvTNHmhCK2IxX2fesOLjf6mbD/oPAGk2S+yA6dy/+U=;
 b=RzWXtgEr3JfrybTbZedBCPk99RjX6Qb4LrJ5NEjOKJ9ue4XnF3RcAFNV
 bh43sYjhv+ZQeAjw23ZynBPV/NizCW+4wYXFYV+lsJq4BzuVuOT3otGX8
 NpMMKFWh12OgAl6SOC++c41mXUhwWcmCUa5TJ9KIwEV6INPlIgrBRABiQ
 6/9q0mrQ3xPKcf+7ZRgUzoTwBkaF47/UCH+YKMNsDdLXy8Oe9XF3Nr47T
 nus6E8plM1gE9vAENSlFasPUgvt99ne//BhwHMMnR4NiIH17cUKPg1zyV
 wvGXMKzhyTWBffVFXjuwmkNVqx03gOTmwD4VIg9ceAQZYtzCPBXbDaw+i A==;
X-CSE-ConnectionGUID: JGwCn1/ISASyKp45hq5N0Q==
X-CSE-MsgGUID: oxhHtpFvS/OiS3Ylx0aNEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52381688"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52381688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:58:24 -0800
X-CSE-ConnectionGUID: VZY+fvkgR2yzLRIdH3yLOw==
X-CSE-MsgGUID: cZSAB/UcRby7Ub2WViii4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149701108"
Received: from ba_tws-123.gar.corp.intel.com (HELO
 spottumu-desk.iind.intel.com) ([10.190.216.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:58:22 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.teja.pottumuttu@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_oa: Don't limit oa-formats to render
 engine
Date: Wed,  5 Mar 2025 23:25:57 +0530
Message-Id: <20250305175557.2245712-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

oa-formats test need not be limited to render engine only. Extend
it to use any engine using __for_one_hwe_in_oag macro instead.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a72def0fe..81f2a7e0c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4717,7 +4717,7 @@ igt_main
 		test_missing_sample_flags();
 
 	igt_subtest_with_dynamic("oa-formats")
-		__for_one_render_engine(hwe)
+		__for_one_hwe_in_oag(hwe)
 			test_oa_formats(hwe);
 
 	igt_subtest("invalid-oa-exponent")
-- 
2.34.1

