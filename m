Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495B0CD043B
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 06:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F258010E254;
	Tue,  6 Jan 2026 06:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIfxawV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CB110E254
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767679728; x=1799215728;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uP+n0sK/l84itbQ9cYTa8nGD+aAf558a/zZnXGyA3WE=;
 b=CIfxawV2RRiUPs544VsymAa95DClZT8ZxSFpleOhqNx9sbAeHMJwVQjD
 gIPvAzrSpoeCurWhIwQNuJqtoXdZHdT2RZ9m3fyXQX5k5dwznPywXCkvC
 +WBXYAKmczzNQK1tEpYJXRPvHyan260r71Fe4hqHfbuawyCssXTp6T+rS
 tbgv57lOOSIkdGhrEYS0UFNSzZZPUkg7TQOfmlulNfUR4NZzS1suUN6ek
 KJkwgsEHZkAAYJ0oCkELQoiIHPDTK8rYZb8RZ/5gIrKHm8/UXbfEn5x/x
 Z3/5bdejtaVn2MzXHqMvTVovhvP3gSBCRP9CKL+GKWxUl9ZfIRkD58wi3 A==;
X-CSE-ConnectionGUID: ae4iN3bGRriQqEmGo65wNQ==
X-CSE-MsgGUID: GD46nfdwR7CFCfLQR8j4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69087259"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69087259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 22:08:47 -0800
X-CSE-ConnectionGUID: 4wW/nc9NS6KgYJab57kqwA==
X-CSE-MsgGUID: qpv8bZqMRYS7xHzONTN76w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202587719"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa007.jf.intel.com with ESMTP; 05 Jan 2026 22:08:47 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_multigpu_svm: Add test documentation for
 Mega MultiGPU feature
Date: Tue,  6 Jan 2026 06:08:46 +0000
Message-ID: <20260106060846.353980-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This commit updates the test documentation for the xe_multigpu_svm test to
clarify its requirements and ensure proper tracking under the Mega MultiGPU
feature. The documentation fix helps users and automated systems correctly
associate test results with the MultiGPU feature, improving test coverage
visibility and reporting accuracy.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multigpu_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index fee738035..4766ad7fb 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -27,7 +27,7 @@
  *		including cross-GPU access, atomic operations, coherency
  *
  * Category: Multi-GPU
- * Mega feature: SVM, GPU virtualization
+ * Mega feature: MultiGPU
  * Sub-category: SVM, memory management, performance
  * Functionality: Multi-GPU SVM, migration, coherency, atomic ops
  * Test category: functional, performance, stress
-- 
2.48.1

