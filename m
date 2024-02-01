Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFC5C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553910EE11;
	Thu,  1 Feb 2024 14:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb+n5yAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BBB10EE11
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796637; x=1738332637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DbcKelA92leERUpwvPMVKWs5rR72bZ/kFWa9yST22YY=;
 b=Pb+n5yAHtTnWLVwv7HgBj4b6gsPsgRoXJdNinG2C9+ynlX1GL7HYYs5S
 ihKp3wnEY7SIpqsERoWeoa9zMM49zw/uygt2mSTjRtM9fpxbZtgD8zQ/M
 A3fND556Bgn7Yk3EnYZq3aPkGLekjvMyZSVQRXvcKfFJzC1xxB34q36sY
 Fqjy1yLd1fgDDdlXkmPdGSupyJ+tpzeGeW2qNMIh6OzDPu8N1V1AGhJFN
 qc1nEU/SJkQzFBoOR4LmWCQ4javOIviZD+7xX9c614+fAWtS4MeJUJjeQ
 bJA+qUBhJwcKDBnGB/WhEA4CsxRDZe3tDlnSdtUMJ9aVYvJtXAFIOB7l+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="119656"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="119656"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="78777"
Received: from abojovix-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel/xe_pat: assert flat CSS support for
 xe2
Date: Thu,  1 Feb 2024 14:03:15 +0000
Message-ID: <20240201140315.334388-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201140315.334388-1-matthew.auld@intel.com>
References: <20240201140315.334388-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Xe2+ should support flat CCS compression, and here we are using
compressed PAT index modes. Assert the platform indeed has flat CCS
here, otherwise something is likely wrong.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_pat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 40256bada..3d7d7400c 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1049,6 +1049,7 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 
 	igt_subtest_with_dynamic("pat-index-xe2") {
 		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
+		igt_assert(HAS_FLATCCS(dev_id));
 		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
 						     ARRAY_SIZE(xe2_pat_index_modes));
 	}
-- 
2.43.0

