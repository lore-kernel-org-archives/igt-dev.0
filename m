Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D5BC0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 13:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E312510E179;
	Thu, 23 Jan 2025 13:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkSY7F/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5114610E179
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737638682; x=1769174682;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RGOiAWZcEvGCrUU4vkmYu9SD48TYKj4Ny2dbocfwqLw=;
 b=HkSY7F/Yvr5zbjL7EFgZ2qZUuQ/GVYsDj4aAcsyYclDuDs+sYRRsRvDT
 Hwi3AmpAOi4h9EhjshS4msS3CgLdXNuXa7h6MgSIa2zFLnz78raI9rn4Z
 Ilm17yBAHK5sYYVmsUnZTyBsTGLpZlui10kE/OW8VJjHWeKV20MeQezKx
 5Cvz5lzsPq386IPioVQQw9difzYnSOxQesv8mVZPgkL4xScKJHyhHuCUN
 XYYGABSh3EplwggZODljIhnfvvhHIcMGypu8B1m9C2cqrbS+/hrKKd6C7
 OAjBKh8kfh0NYDV1ArGH/YyqWyMpXdeLMHktUcnfPI5rM/jg2JyVtscQX A==;
X-CSE-ConnectionGUID: dOmU/5VLRleVaaBaf2erEA==
X-CSE-MsgGUID: yanGnMjrT2u3z5X1k9aw2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48800594"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48800594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 05:24:42 -0800
X-CSE-ConnectionGUID: V5YrG7afTIajk7S7C6i3qA==
X-CSE-MsgGUID: P529Fi78RNuuWPhkmoiJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107458143"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.145.169.50])
 by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 05:24:40 -0800
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 jari.tahvanainen@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] tests/intel/xe_compute: Add test documentation to
 reflect proper category
Date: Thu, 23 Jan 2025 18:54:38 +0530
Message-Id: <20250123132438.37754-1-aditya.chauhan@intel.com>
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

From: "Chauhan, Aditya" <aditya.chauhan@intel.com>

Add subcategory to the test description so that
the tests fall under the right category/feature

v1: Add Mega-feature for the subtests (Kasia)

Signed-off-by: Chauhan, Aditya <aditya.chauhan@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel/xe_compute.c         | 2 ++
 tests/intel/xe_compute_preempt.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index ebaa5e750..62beb24dc 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -163,10 +163,12 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 /**
  * SUBTEST: compute-square
+ * Sub-category: Compute square tests
  * GPU requirement: TGL, PVC, LNL
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
+ * Mega feature: WMTP
  * Functionality: OpenCL kernel
  */
 static void
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 9c76141f4..7ce5c595a 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related preemption functionality
  * Category: Core
- * Mega feature: Compute
+ * Mega feature: WMTP
  * Sub-category: Compute tests
  * Functionality: OpenCL kernel
  * Test category: functionality test
-- 
2.34.1

