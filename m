Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDDBCD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5280410E414;
	Tue, 26 Mar 2024 09:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fdxv+T/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7094910E414
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445379; x=1742981379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l395t95k8mTqCAaVj1BMig6e4ISKbnVNsbnXjXBNuQE=;
 b=Fdxv+T/yMDtrzwA1d59IO8p3QXISzCPIT+tswMJcjHbx+5AFHPgFpaHB
 MKMHNCUzt7aLOQbhE5M2ZDWut9tL22WcxJ9G3BxKoo2SnQTKf1zkf4mzj
 4mVH2FYgjx2pQQhqYX7HAYuUdXY4fIpITE8NHOmba1NSeVI4nRvLWB1it
 ju2fsranCIVFy52FEiqOVEObbL3GDCGkhKHcnqHAa8AAoV0KcaTjDmTvj
 5VjH2+WcxKtF+N+4Yls2+nJWP97/8aPl/vG5d1YI+HcRYEuBgvtDBox3P
 gs2CV6QW5ANGT++YCQrQCIvPCvDoTJLQlnwE0DAT1PM4JpJUlW3FnpODp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378529"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15964877"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:32 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 02/13] tests/intel: Introduce CMD submission
 Sub-category for XE
Date: Tue, 26 Mar 2024 09:28:56 +0000
Message-Id: <20240326092907.1979345-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

Let's introduce 'CMD submission' subcategory in Xe. So far 'execbuf'
subcategory was used.
Also let's move xe_exec_store to CMD submission subcategory

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_balancer.c     | 2 +-
 tests/intel/xe_exec_basic.c        | 2 +-
 tests/intel/xe_exec_compute_mode.c | 2 +-
 tests/intel/xe_exec_fault_mode.c   | 2 +-
 tests/intel/xe_exec_reset.c        | 2 +-
 tests/intel/xe_exec_store.c        | 2 +-
 tests/intel/xe_exec_threads.c      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 02edd389d..6e467e34a 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: virtual and parallel exec_queues
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index f0230a9ca..5210e6730 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: exec_queues
  */
 
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 2ba94d2c6..c1f703c43 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf compute machine functionality
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: compute machine
  */
 
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 20a7cf8fe..72a7bd4fd 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: fault mode
  * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
  */
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a39e5860e..22735688a 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: reset
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 55354e688..c57bcb852 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -15,7 +15,7 @@
 /**
  * TEST: Tests to verify store dword functionality.
  * Category: Software building block
- * Sub-category: HW
+ * Sub-category: CMD submission
  * Functionality: intel-bb
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 977e8c600..05ea1d35a 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality
  * Category: Hardware building block
- * Sub-category: execbuf
+ * Sub-category: CMD submission
  * Functionality: multi-threads
  * Test category: functionality test
  */
-- 
2.34.1

