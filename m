Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7248D43FEF
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 08:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A651810E459;
	Mon, 18 Nov 2024 08:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsZt3DNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF2610E459
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731919632; x=1763455632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EotISKJKoNLDLoOibFrxZ54nJ+rGtSqdb2tAK28UukA=;
 b=HsZt3DNat914APi5M+4U5WwhI5UIG9IlF3fTg2xyY9kGH0Kemp8lH1IV
 UKWrp2x5ZxrP0QG7sPyV1oFOhdtQlb3GAf7w6T9PahCFH8ATVhtIvj/gL
 tJQ5nUos6AgSqEW8Qhs4qFFcbg4ttbOpZFCzVxFHrFEyYNuSmJwHgysek
 RDMD8PwyPVB0O/771flMrntWQdYtTooLomkB4PNW+kwR+yYPskv6Pz8Y3
 Wi6MeG9O20sdGOiNjMNSTZt2PRJMRRZufAztMfCvXUEfQZc80nx2o44LK
 NykBR9TrYHenK4D7a42rLKa8w9lPUn70urndib/7/fmk8SGX3BYAyCeda Q==;
X-CSE-ConnectionGUID: rJyhOXbjRgyuodmWU4JTKQ==
X-CSE-MsgGUID: gTA9WX+7ST6BiTC1/AfZLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31919681"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31919681"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:47:12 -0800
X-CSE-ConnectionGUID: jPVb6sT5SjmMJEXa4R/T3A==
X-CSE-MsgGUID: lNGGsU/fRTCghHuZ/33hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="93228386"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:47:10 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] tests/intel/kms_frontbuffer_tracking: Fix testplan
 documentation
Date: Mon, 18 Nov 2024 14:06:24 +0530
Message-ID: <20241118083624.1936758-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix the testplan documentaion for i915 specific tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b7e3f7379..f149be3da 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -763,18 +763,22 @@
 /**
  * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  *
  * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  *
  * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
  * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr1
  *
  * arg[1].values:   1, 2
-- 
2.43.0

