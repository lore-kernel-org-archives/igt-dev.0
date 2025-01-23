Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4252C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 05:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928E10E333;
	Thu, 23 Jan 2025 05:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrOJ9zQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8080E10E333
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 05:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737609516; x=1769145516;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IR871ttrG/9wXHxbYb+Nkwg3YNqJWQsBM+pCHLDqmQE=;
 b=QrOJ9zQEeqPmkB0hBI4RzOi6V1PMs8V39FvSnB+avvrhtiKXbcqZifA3
 DvYTNgsCNeTKWG1sGfKdMB0T/UQdwFoA7Ej+2dMe3Y8m3Dda95cRtPqO0
 KQ6U6r5AnLMo3hkNJglcLp+/lw7i6q+qx3puIlSKVQuum+EeJ+v+iEx8z
 vz7BgdPl5CbdxQ6CjoohR62gnAlFLqiSFFHbbB3AGGzJe9yFK3PbSuGRa
 Hwbx6P/eRhmeroL6W/kLAyIg8TdWEnbtGa33ZF+xfZC6yyKocTTTPxEWG
 UheJt1kaG/p8NwLVvpN2Lo4JgakzAZ1gU1YL7Hp659q19QmPG2W0CtWCm A==;
X-CSE-ConnectionGUID: IgK1zBrtSXuQ/6lHXaPUbg==
X-CSE-MsgGUID: JcnE/d/dT7e9fsGGD9jaDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37354042"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37354042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 21:18:35 -0800
X-CSE-ConnectionGUID: f1dJBDTRTqKc4gI3O/rk1w==
X-CSE-MsgGUID: 8hJ5IZMaSIyQ8nHZK0M3eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108227371"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.145.169.50])
 by orviesa008.jf.intel.com with ESMTP; 22 Jan 2025 21:18:33 -0800
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 jari.tahvanainen@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_compute: Add test documentation to
 reflect proper category
Date: Thu, 23 Jan 2025 10:48:31 +0530
Message-Id: <20250123051831.19096-1-aditya.chauhan@intel.com>
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

Signed-off-by: Chauhan, Aditya <aditya.chauhan@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel/xe_compute.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index ebaa5e750..089993d57 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -163,6 +163,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 /**
  * SUBTEST: compute-square
+ * Sub-category: Compute square tests
  * GPU requirement: TGL, PVC, LNL
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
-- 
2.34.1

