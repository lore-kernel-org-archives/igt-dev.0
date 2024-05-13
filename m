Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B7C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F92510E636;
	Mon, 13 May 2024 10:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVFcxJkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A32F10E636
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597388; x=1747133388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCKjY03bz2Wjja/qSqo0v8Q4P9VDDFPQiE8cddqGeyg=;
 b=MVFcxJkURS+qlXd3lAqu9eBpr4xcpS4Kmhx//k7CPcwgfbLr/RW7yQdy
 aLGBT8dBka/FnA5ImCZWOiGjpNrMQ0yHThza4WkXMumq6yX70Ns7nD4Wf
 Tno+AzL7Oq5AuUp11hxkASSWd+1BADQRyq2Z2ZFLzyIDaMP0hSiKwVRSj
 H3DAn5zJIzkQiF3/rgfBiR3tqB3kgINXLfuZ5jigPvtqZjwo60Hueudh1
 3Jw2i1CUhsHkRTVEHbZQ+kAgadrCQQa3nW0lbJX6swPSjqdIwPWbvHCCv
 9h4sKAEL7VqfMGh5vB5wet86FKGlG75JrpaT8P8IlKIZOGW67+0zQBpUp w==;
X-CSE-ConnectionGUID: bdbIvTpkRxubUg0a90KvCQ==
X-CSE-MsgGUID: F3GDfpxaQQWQ9Y3T41bGGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11390887"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11390887"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:48 -0700
X-CSE-ConnectionGUID: xJUcAOkOQJGiJuU1oLDlTw==
X-CSE-MsgGUID: zjF2N+5ZS623cAkDhbXFUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30138749"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:46 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 05/16] tests/intel: Introduce Compute Mega feature
Date: Mon, 13 May 2024 10:48:35 +0000
Message-Id: <20240513104846.362332-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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
 tests/intel/gem_ctx_persistence.c | 2 +-
 tests/intel/gem_userptr_blits.c   | 5 +++--
 tests/intel/xe_compute.c          | 3 ++-
 tests/intel/xe_compute_preempt.c  | 3 ++-
 tests/intel/xe_noexec_ping_pong.c | 3 ++-
 tests/intel/xe_pm.c               | 2 +-
 7 files changed, 14 insertions(+), 9 deletions(-)

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
index 57dd85b88..6c220fba5 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -47,11 +47,11 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx persistence
- * Feature: context feature
  * Category: Server
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: engines-cleanup
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 66f2a9416..f62e7dbbf 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -70,9 +70,10 @@
 /**
  * TEST: gem userptr blits
  * Category: Server
+ * Mega feature: Compute
+ * Sub-category: Compute tests
+ * Functionality: userptr blits
  * Feature: userptr
- * Functionality: buffer management
- * Sub-category: Compute
  * Test category: GEM_Legacy
  *
  * SUBTEST: access-control
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 735b2fcd0..8cf5e393b 100644
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
index 3817b5a30..306b178df 100644
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
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 2e2a21ac9..ba9268f6d 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -622,7 +622,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
  * Description:
  *     Validate mocs register contents over suspend resume
  *
- * Functionality: mocs
+ * Functionality: mocs registers
  * Run type: FULL
  */
 static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
-- 
2.34.1

