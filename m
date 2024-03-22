Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93D5C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B88710F4C4;
	Fri, 22 Mar 2024 12:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxBnqY7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2110F388
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111322; x=1742647322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUWV4bv26bBQJOcx3OgGD02vkYwglN3dzbAYrELiYeQ=;
 b=UxBnqY7PBdQ6GebMibbStUpneP7sOeDynTiwFwbHE3jBV9HoQjBVlc/W
 MmKCT6Bw0WidhUlcs9MuHVFsujJMSUOCBK0bKac4AGdyBYPlnzcH2pIHl
 txbFBQrUKjdLi2OMUP4S5qSviBcW8dXnSny7cJBWFZioDaXQjqIzcrc9P
 FMx4jXRhMVl6epjiCmCm01mbzrv9AtxegGsQPemKaJhoSqArzRwa9pf7b
 L4wrvEeSBu5BD0zvIxcLC9my1fm7t5JbkQaEWxDywZY0i7+X8kJN0eoLX
 3ZIhnDBhVxwZc8EDtMJqJgMkq+lcf2xU58EvApzfbOzO73x/yM49CfBNg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9919303"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9919303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19585903"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:00 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 03/11] tests/intel: Fix inconsitency in Sub-category
 names
Date: Fri, 22 Mar 2024 12:40:59 +0000
Message-Id: <20240322124108.1825345-5-katarzyna.piecielska@intel.com>
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

Let's fix:
 - s/compute/Compute/
 - s/Flat-CCS/Flat-ccs/
 - s/frequency/Power management/.
 - s/power management/Power management/
 - s/Power Management/Power management/
 - s/sysman/SysMan/
 - s/gpgpu/GPGPU/
 - s/gpgpu/gpgpu_fill/
 - s/evict/eviction/
 - s/BO creation/bo/

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_compute.c          | 2 +-
 tests/intel/xe_compute_preempt.c  | 2 +-
 tests/intel/xe_create.c           | 2 +-
 tests/intel/xe_evict.c            | 2 +-
 tests/intel/xe_evict_ccs.c        | 2 +-
 tests/intel/xe_gpgpu_fill.c       | 4 ++--
 tests/intel/xe_gt_freq.c          | 2 +-
 tests/intel/xe_noexec_ping_pong.c | 2 +-
 tests/intel/xe_pm.c               | 2 +-
 tests/intel/xe_pm_residency.c     | 2 +-
 tests/intel/xe_sysfs_scheduler.c  | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 42f42ca0c..9cf359383 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 2bc27eff1..45aa15c78 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related preemption functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 1d3918663..fd5d71d8a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -273,7 +273,7 @@ static void create_massive_size(int fd)
 
 /**
  * SUBTEST: create-big-vram
- * Functionality: BO creation
+ * Functionality: bo
  * Test category: functionality test
  * Description: Verifies the creation of substantial BO within VRAM,
  *		constituting all available CPU-visible VRAM.
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 43e20ef6c..8ef55211f 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -7,7 +7,7 @@
  * TEST: Check VMA eviction
  * Category: Software building block
  * Sub-category: VMA
- * Functionality: evict
+ * Functionality: eviction
  * GPU requirements: GPU needs to have dedicated VRAM
  */
 
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 35ae8151a..8e43f691d 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check flat-ccs eviction
  * Category: Software building block
- * Sub-category: Flat-CCS
+ * Sub-category: Flat-ccs
  * Functionality: ccs-evict
  * GPU requirements: GPU needs to have dedicated VRAM
  */
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index eee77d252..a359f9f55 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Basic tests for gpgpu functionality
  * Category: Software building block
- * Sub-category: gpgpu
- * Functionality: gpgpu
+ * Sub-category: GPGPU
+ * Functionality: gpgpu_fill
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index f0de341cb..c12f6c52c 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Test Xe GT frequency request functionality
  * Category: Infrastructure
- * Sub-category: frequency
+ * Sub-category: Power management
  * Functionality: frequency request
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index d02ef62e4..51f28d9d0 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -18,7 +18,7 @@
 /**
  * TEST: Expose compute VM's unnecessary rebinds
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Functionality: compute VM rebind
  * Test category: functionality test
  *
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3aa247353..c8a5cc6de 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check Power Management functionality
  * Category: Software building block
- * Sub-category: power management
+ * Sub-category: Power management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0d8ead6a2..ad70e2430 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Test gtidle properties
  * Category: Software building block
- * Sub-category: Power Management
+ * Sub-category: Power management
  * Functionality: GT C States
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 5a22abbf1..d1ef422f4 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -6,7 +6,7 @@
 /**
  * TEST: xe sysfs scheduler
  * Category: Infrastructure
- * Sub-category: sysman
+ * Sub-category: SysMan
  * Functionality: scheduler control interface
  *
  * SUBTEST: %s-invalid
-- 
2.34.1

