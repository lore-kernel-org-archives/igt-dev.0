Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A053E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B896710EF97;
	Fri, 13 Dec 2024 10:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6ZekJvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B88210EF93
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734085044; x=1765621044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pOsoXuxOIZTzWBD3xYV1+Piyu6ig5ipO+5smuBSXFaw=;
 b=R6ZekJvT+QfDTHdemgTQC0ZNZf67P8oPvX+qwxLD1BPucQAiA3nZLovg
 m8ydKLewomibZhQ6DsOeHYvH2SQPxrARB1puleaAYzNBAXo+UzIa//jHD
 ozy/4bO8nn1PM/AIZP53pKa39jPfbER89s2yu2QbwQBwQpWru1M7VnYhR
 +c9h9PBWk1nCLnrq1IT3Ioy5+MXuE2vSsW49L7/ZopM67HmmdNbjBtE8C
 sMiwC/ml7roSl/xX5PHcIcsMD75U32vp406dnCcM31EtV+/tmmoeDlHMH
 Ka/zL6aHAGonoROOiMEfODIUH8StJqEIFq91A6nJzut6WdFOP6ciayPMX Q==;
X-CSE-ConnectionGUID: eft+5FztRvazCXwCK/HbIg==
X-CSE-MsgGUID: Y4xymnm0RIGu8m/hYjtLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34669077"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34669077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:17:24 -0800
X-CSE-ConnectionGUID: KddtCXxSQIyfTuYC/0YFQw==
X-CSE-MsgGUID: h+M1j+wBQe2/8deLR5PWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96268570"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:17:22 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add mappable GTT check in
 cursor test
Date: Fri, 13 Dec 2024 16:02:28 +0530
Message-Id: <20241213103228.1920627-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add gem_require_mappable_ggtt() check to ensure the test is executed
only on hardware supporting mappable GTT.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..16df9bbb8 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1189,6 +1189,7 @@ static void cursor_subtest(bool dpms)
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
 
+	igt_require(gem_has_mappable_ggtt(drm_fd));
 	disable_all_screens_and_wait(&ms_data);
 
 	igt_require(default_mode_params);
-- 
2.25.1

