Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE44C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFDB10F7FF;
	Fri, 22 Mar 2024 12:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHvQrayb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775710F8A5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111393; x=1742647393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bvh2ZKL3IIjbn+PuW3oLoRe13f4ipYArv29wIyZmW7M=;
 b=CHvQraybz6zO8DPlosoKehbvjDmW0G8+HalK9tgtZyFPxvbF8JjTbs2X
 Ivh+W6/upc9SoEN5MQm3r3PA/qKhf/Iofxjh0I867E1SuK18s7AclsngW
 /VNoYZ4CGj70pU3LZTSFI2N0mjjaPqGWRLDObzjDrOVnwnm2NNVOi8FMn
 QWORLyZfQB80RlGGkpDb4tdPH8B8TX1R4StJeqmVKak0gtn5BXQCRHLyv
 4Au5shAm2+x7wntdoPN3w25iRAYpTMsGs2QmOMeee9fef0b8DprdQhaLQ
 wYlkR/TJIT9ltqhzbt7aUkb5S4QlXfvjLUWZX3sOTMz7KNzQJ+jb0i+LH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9919479"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9919479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="45895955"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:43:11 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 11/12] tests/intel: Unify functionality for compute tests
Date: Fri, 22 Mar 2024 12:41:07 +0000
Message-Id: <20240322124108.1825345-13-katarzyna.piecielska@intel.com>
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

Let's clean up functionality for Xe compute tests:

	s/compute machine/compute/ for xe_exec_compute_mode.c
	s/compute VM bind/VM bind/ for igt@xe_noexec_ping_pong.c
	s/compute openCL kernel/openCL kernel/ for xe_compute*.c
	s/ccs_mode user interface/ccs mode/ for xe_compute@ccs-mode-*

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_compute.c           | 6 +++---
 tests/intel/xe_compute_preempt.c   | 8 +++++---
 tests/intel/xe_exec_compute_mode.c | 2 +-
 tests/intel/xe_noexec_ping_pong.c  | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 9cf359383..8d377990c 100644
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
+ * Functionality: openCL kernel
  */
 static void
 test_compute_square(int fd)
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 45aa15c78..a4863c364 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -21,17 +21,19 @@
  * GPU requirement: LNL
  * Description:
  *      Exercise compute walker mid thread preemption scenario
- * Functionality: compute openCL kernel
+ * Functionality: openCL kernel
+ *
  * SUBTEST: compute-preempt-many
  * GPU requirement: LNL
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
- * Functionality: compute openCL kernel
+ * Functionality: openCL kernel
+ *
  * SUBTEST: compute-threadgroup-preempt
  * GPU requirement: LNL
  * Description:
  *      Exercise compute walker threadgroup preemption scenario
- * Functionality: compute openCL kernel
+ * Functionality: openCL kernel
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

