Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A93C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FEF10EE22;
	Tue, 26 Mar 2024 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2hsBwEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9910EE25
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445467; x=1742981467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XDZEkLdIuZ7sdwTGqs85MqtwF7bTmFSTsLolNGwMqNM=;
 b=S2hsBwEfkA05uL63BTSQwbSiGZnXux3/iPGC61Wse4DRz1XAP20qdUIV
 G0fzJovPcePMJJm2RdZ0KSkntCWnZ3TQdXKY33Le4EC70u4cwg/uecwSS
 L78NiAlZY01uf9A5qDDmyATOIXDfwKJTOl4EqmK5ApWa1n0w5o74SzH3b
 +LzeXsu0MKp7CLBRn+CpHxOU67vlEW+5pQS4XS8jMC4is1fmJdMakLhas
 M7vFR/30zelTlVvQFb10/wN8eJu1BDkPVfA2vi2Yyo1fmnkxDihmPCHwQ
 1+Gz7NlCwYnAU3cdcnAFWleGGuTid/iSug4JqmHihFr3nhWIeFMQSTkjm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6351263"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6351263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15875733"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:31:05 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 12/13] tests/intel: Unify functionality for compute
 tests
Date: Tue, 26 Mar 2024 09:29:06 +0000
Message-Id: <20240326092907.1979345-13-katarzyna.piecielska@intel.com>
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

Let's clean up functionality for Xe compute tests:

	s/compute machine/compute/ for xe_exec_compute_mode.c
	s/compute VM bind/VM bind/ for igt@xe_noexec_ping_pong.c
	s/compute openCL kernel/openCL kernel/ for xe_compute*.c
	s/ccs_mode user interface/ccs mode/ for xe_compute@ccs-mode-*

v2:  s/compute openCL kernel/OpenCL kernel/ for xe_compute*.c (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_compute.c           | 6 +++---
 tests/intel/xe_compute_preempt.c   | 6 +++---
 tests/intel/xe_exec_compute_mode.c | 2 +-
 tests/intel/xe_noexec_ping_pong.c  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 9cf359383..e773e798a 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -44,7 +44,7 @@ static bool get_num_cslices(u32 gt, u32 *num_slices)
  * SUBTEST: ccs-mode-basic
  * GPU requirement: PVC
  * Description: Validate 'ccs_mode' sysfs uapi
- * Functionality: ccs_mode user interface
+ * Functionality: ccs mode
  */
 static void
 test_ccs_mode(int num_gt)
@@ -111,7 +111,7 @@ test_ccs_mode(int num_gt)
  * SUBTEST: ccs-mode-compute-kernel
  * GPU requirement: PVC
  * Description: Validate 'ccs_mode' by running compute kernel
- * Functionality: CCS mode funtionality
+ * Functionality: ccs mode
  */
 static void
 test_compute_kernel_with_ccs_mode(int num_gt)
@@ -158,7 +158,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
- * Functionality: compute openCL kernel
+ * Functionality: OpenCL kernel
  */
 static void
 test_compute_square(int fd)
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 45aa15c78..b8448ef91 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -7,6 +7,7 @@
  * TEST: Check compute-related preemption functionality
  * Category: Hardware building block
  * Sub-category: Compute
+ * Functionality: OpenCL kernel
  * Test category: functionality test
  */
 
@@ -21,17 +22,16 @@
  * GPU requirement: LNL
  * Description:
  *      Exercise compute walker mid thread preemption scenario
- * Functionality: compute openCL kernel
+ *
  * SUBTEST: compute-preempt-many
  * GPU requirement: LNL
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
- * Functionality: compute openCL kernel
+ *
  * SUBTEST: compute-threadgroup-preempt
  * GPU requirement: LNL
  * Description:
  *      Exercise compute walker threadgroup preemption scenario
- * Functionality: compute openCL kernel
  */
 static void
 test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index c1f703c43..3ec848164 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -7,7 +7,7 @@
  * TEST: Basic tests for execbuf compute machine functionality
  * Category: Hardware building block
  * Sub-category: CMD submission
- * Functionality: compute machine
+ * Functionality: compute
  */
 
 #include <fcntl.h>
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 51f28d9d0..f88f2af9d 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -19,7 +19,7 @@
  * TEST: Expose compute VM's unnecessary rebinds
  * Category: Hardware building block
  * Sub-category: Compute
- * Functionality: compute VM rebind
+ * Functionality: VM rebind
  * Test category: functionality test
  *
  * SUBTEST:
-- 
2.34.1

