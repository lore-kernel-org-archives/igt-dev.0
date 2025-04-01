Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C3C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 12:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8334410E580;
	Tue,  1 Apr 2025 12:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6c0nTXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1D110E324
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743510084; x=1775046084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPNI7s60BVzGhFpfifkGScXFxQdMujLu0yQ34Sjxdys=;
 b=J6c0nTXeCl6jNtRPimZYa2qkoH+OxCifpJ7Cl72CrU6EJLPp8EVskeGD
 D4dIO0KHyQOHkd9gaghQpD7rasbGds6ZzzcZe0Xuy6VYfc22am2AasfuE
 PA4RuxbLHz7X2IdaY2N6zqgA65jzvStacdsWYfvy++aCxtZjoB0rNiuG+
 8DWRiZLS7wBGELqpKjcHCyGblRis+Vfsitxnm+7s090sCbkNG2+wZOyTk
 6ynmJpitAUn3P9mLC3kZso0pkCjs2rWfbXc2s/KyvThrOVLIJ8P9Xb4Dp
 JMkrBrlnSgnse9FJ2WC4dBwGXNqAtGgdv26BUW5+/yGG+nbGJNWlE7Pt0 A==;
X-CSE-ConnectionGUID: 30YfbqvNTJmbk9Uu5KT3OQ==
X-CSE-MsgGUID: BoWjMcopR2OTUkUrbjmBjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55025485"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55025485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:21:24 -0700
X-CSE-ConnectionGUID: UEveLeTtRvGl472kyLKphA==
X-CSE-MsgGUID: jy4bgobfRBmHnvE4+3SKYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="127186093"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2025 05:21:22 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH v1 i-g-t 1/1] tests/intel/xe_fault_injection: Inject fault for
 xe_hw_engine_class_to_str
Date: Tue,  1 Apr 2025 12:06:57 +0000
Message-Id: <20250401120657.1829327-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401120657.1829327-1-sobin.thomas@intel.com>
References: <20250401120657.1829327-1-sobin.thomas@intel.com>
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

From: Sobin Thomas <sobin.thomas@intel.com>

Use the fault injection infrastructure to make targeted fault injection in
functions xe_hw_engine_class_to_str and check the error handling in the
xe_hw_engine_class_sysfs_init() so that more code paths involving error
handling is tested.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..94c1bbf38 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -173,6 +173,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_guc_ct_init:		xe_guc_ct_init
  * @xe_guc_log_init:		xe_guc_log_init
  * @xe_guc_relay_init:		xe_guc_relay_init
+ * @xe_hw_engine_class_to_str:	xe_hw_engine_class_to_str
  * @xe_mmio_probe_early:	xe_mmio_probe_early
  * @xe_pcode_probe_early:	xe_pcode_probe_early
  * @xe_pm_init_early:		xe_pm_init_early
@@ -388,6 +389,7 @@ igt_main
 		{ "xe_guc_ct_init" },
 		{ "xe_guc_log_init" },
 		{ "xe_guc_relay_init" },
+		{ "xe_hw_engine_class_to_str" },
 		{ "xe_mmio_probe_early" },
 		{ "xe_pcode_probe_early" },
 		{ "xe_pm_init_early" },
-- 
2.34.1

