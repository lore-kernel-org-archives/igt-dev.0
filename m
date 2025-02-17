Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443DAC021A7
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE41F10E39B;
	Mon, 17 Feb 2025 08:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EspG8N7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCCC10E39A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780341; x=1771316341;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=liQaaDr8/Hk4fmYPGPNUqY/RBMHL9Oe/v9qRukN1VXI=;
 b=EspG8N7fqJolPNrd3Ooto4xOr947mWKtFloo7R11j/9yOeRfxT0NFUlJ
 nr7TI57aVK5CvSfeo++OgujUBHzLri+ozy/vBFG5XDMh4mMSmppGhmRT1
 TAlFIYELhpHwXC4nKXdU430aTZjFNxAphMzZi5WwFQvA/Sb1JaOwlcvZh
 vrE4Vlma5p2udOf5MLhplbW2L/RQaoPj7POXjSOyVbNfxzK8R80x1PeLQ
 6y6mg38xOqUpicOC+cMFI7vPed79uxpakdktIa9/iPtIEVbRbpn7o68+y
 xUAXyEUeBMPUzPtrlz7smiSWjGWqbKytiJUfBH69+TNiCGjWa8n2Z6lDX w==;
X-CSE-ConnectionGUID: BtyfkNjbQ8O/dvMtj6m05w==
X-CSE-MsgGUID: Ivav+2n6THuZ8Zpfhhf1Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40157772"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40157772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:19:01 -0800
X-CSE-ConnectionGUID: NH8TizAYQaORaSdd7sC4+w==
X-CSE-MsgGUID: KbLMBgOISXGeBe0ezqGLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144978437"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 00:18:59 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/5] tests/xe_compute: Update documentation
Date: Mon, 17 Feb 2025 08:18:52 +0000
Message-Id: <20250217081854.3219791-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

PTL support is added for compute and compute_preempt tests. Update the GPU
requirement field.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute.c         | 2 +-
 tests/intel/xe_compute_preempt.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 62beb24dc..558b46eba 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -164,7 +164,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 /**
  * SUBTEST: compute-square
  * Sub-category: Compute square tests
- * GPU requirement: TGL, PVC, LNL
+ * GPU requirement: TGL, PVC, LNL, PTL
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 7ce5c595a..5319dee7b 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -20,17 +20,17 @@
 
 /**
  * SUBTEST: compute-preempt
- * GPU requirement: LNL
+ * GPU requirement: LNL, PTL
  * Description:
  *      Exercise compute walker mid thread preemption scenario
  *
  * SUBTEST: compute-preempt-many
- * GPU requirement: LNL
+ * GPU requirement: LNL, PTL
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
  *
  * SUBTEST: compute-threadgroup-preempt
- * GPU requirement: LNL
+ * GPU requirement: LNL, PTL
  * Description:
  *      Exercise compute walker threadgroup preemption scenario
  */
-- 
2.34.1

