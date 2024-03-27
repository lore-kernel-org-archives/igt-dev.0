Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD2CD11DD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1510F10FCCC;
	Wed, 27 Mar 2024 12:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Br44Ols8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF66310FCCC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542508; x=1743078508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hFpJmMdOiMT/Z9x82S7U4Yjv7V6Q85tCEDURllNRCk8=;
 b=Br44Ols8GNQ7LWPE29AgmYV5WXNxsqaYF8eDijMf2se3zUF796GjCc6y
 KVEnhJphp09wSmMLDaWucHyniMjh7FZwjOs4DbyzhIFMgKfuIjaSD35AR
 sckw8C2Wd8nuY9v4osNi3XVwyU+FPHhFVOT/XcVVR4aelb/ffEZYmjH3t
 TBV905bBYc1/UVpMAb16JU03EAZciQUas73myXzYUH8WFNyIseWNT7bJ0
 8oFq6pTB6YaF0qq/ww6r3o/P2wMRJrsq6boGHyJWPwlsO+bPeSCCNK2xI
 Xarrc6oCNJGBR5yRvwivl/KikHv3nYH9mz0yY2koHz4+d2d4aU/4bb3mg w==;
X-CSE-ConnectionGUID: KKm4bqIaQBydWXw5DFPnsg==
X-CSE-MsgGUID: OYtRYPPBQL6UU0vOMIfM9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6771253"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6771253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16118397"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:25 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 05/16] tests/intel: Introduce Compute mega feature
Date: Wed, 27 Mar 2024 12:27:20 +0000
Message-Id: <20240327122731.2104614-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Compute tests.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_compute.c         | 5 +++--
 tests/intel/gem_ctx_persistence.c | 5 +++--
 tests/intel/gem_userptr_blits.c   | 5 +++--
 tests/intel/gem_vm_create.c       | 3 ++-
 tests/intel/xe_compute.c          | 3 ++-
 tests/intel/xe_compute_preempt.c  | 3 ++-
 tests/intel/xe_noexec_ping_pong.c | 3 ++-
 7 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index ffab45d61..bc640fa11 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: Compute
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Test category: functionality test
  */
 
@@ -21,7 +22,7 @@
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
- * Functionality: compute openCL kernel
+ * Functionality: OpenCL kernel
  */
 static void
 test_compute_square(int fd)
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 80ece13a7..1d4a14900 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -47,10 +47,11 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx persistence
- * Feature: context feature
  * Category: Server
+ * Sub-category: Compute tests
+ * Mega feature: Compute
  * Functionality: context
- * Sub-category: Compute
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: engines-cleanup
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 51948db0c..6f33a6546 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -70,9 +70,10 @@
 /**
  * TEST: gem userptr blits
  * Category: Server
- * Feature: userptr
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Functionality: buffer management
- * Sub-category: Compute
+ * Feature: userptr
  * Test category: GEM_Legacy
  *
  * SUBTEST: access-control
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 2788e1745..8e9d1c193 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,8 +30,9 @@
 /**
  * TEST: gem vm create
  * Category: Server
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Functionality: context
- * Sub-category: Compute
  * Feature: mapping
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index e773e798a..f806dfb31 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: Compute
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index b8448ef91..ccab069c6 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Check compute-related preemption functionality
  * Category: Hardware building block
- * Sub-category: Compute
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Functionality: OpenCL kernel
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index f88f2af9d..9024623d9 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -18,7 +18,8 @@
 /**
  * TEST: Expose compute VM's unnecessary rebinds
  * Category: Hardware building block
- * Sub-category: Compute
+ * Mega feature: Compute
+ * Sub-category: Compute tests
  * Functionality: VM rebind
  * Test category: functionality test
  *
-- 
2.34.1

