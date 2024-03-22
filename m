Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AA4C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEEF10F08D;
	Fri, 22 Mar 2024 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeANIVsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F0310F27A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111304; x=1742647304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4AJFcDMR2tc3J7cHxm/U+DDtJmFVf1xoDmRlWMcCJ8o=;
 b=GeANIVsg0cdsHwgKD0a5d029SEMpSqaybOnFvypBSnBallkE37OUUaQI
 B7loeHn6nlg2qfmM/vf/w91MOp28btGzKjKiShJnSpJK2TeJUstDdA28i
 nAsRN9HwgjnYr5XE9SEyNpDkAtRDbTRlwkk5Y4Ti0qmIRnExWasySG+2A
 ZRYyH4bPwX+jHuXpsn1kgfXvccvf6agNMZf+nEPHhJeZfXmG8xSTnX/hj
 vkGgf3Fwf8jtdAqft5nH/NDfR5I/GvOvGuxH8r2yDJKMa96DTm5WRV+J4
 bqqZMLtR+pshYXwWYV9uN4GHvsxudWec8D5qo5aiRm3aTgmv7tygy/V6O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6762456"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6762456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="52330388"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:42 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 02/12] tests/intel: Introduce CMD submission
 Sub-category for XE
Date: Fri, 22 Mar 2024 12:40:57 +0000
Message-Id: <20240322124108.1825345-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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
index e6f8db5b0..06be502d6 100644
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

