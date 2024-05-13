Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F78C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFDA10E645;
	Mon, 13 May 2024 10:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Agtuv0vQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4F810E645
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597427; x=1747133427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IPh42Iz3ScNFpDXktvPSECm/FVkfKcEQeHS1QcTviI=;
 b=Agtuv0vQh+W0hswxG6Pqf3cDOHhk8vSJmVt0o1Ca2cYEVgMOMvXfBC3Y
 jiyUE6SQsD5Qc7MsYD+tzzF/5aHjt42cDhQA/poS9iuaOBOif6FZl/gvM
 UtAEjLJVSOKCkGeQuXNlK8HDnKgnlEaHN6MpAL0xalcmJaw5XloSpBGgt
 5cPg1w53Rvsovh3DeoRZRTRFzzeWZ1clQ9MGoQB3ZNeA47mGQZNPOUpMZ
 bAmMKHFqlGck/wihqL+nhQtYvAmsdbwh+PlkriX3MQ1ngpUxeea6myiR6
 W2K0Ble0FYbCFlegVLii1w79YyoXn0GeymNey8XqpwM7wU3/Hzsakr6t5 g==;
X-CSE-ConnectionGUID: c1Q2ZZbDTr2ul5qQM8eEWA==
X-CSE-MsgGUID: ScfUhQCJR6iOY20+GvasXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22925148"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22925148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:26 -0700
X-CSE-ConnectionGUID: hnXTG9GtRRGr1oJrJCEM1w==
X-CSE-MsgGUID: cWap+VQNRRGdyBdeaWvTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="53519025"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:25 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 09/16] tests/intel: Add general XE tests to General
 Core Mega feature
Date: Mon, 13 May 2024 10:48:39 +0000
Message-Id: <20240513104846.362332-10-katarzyna.piecielska@intel.com>
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

Add general XE tests to 'General Core features' mega feature.
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
 tests/intel/xe_create.c              |  1 +
 tests/intel/xe_debugfs.c             |  3 +-
 tests/intel/xe_dma_buf_sync.c        |  1 +
 tests/intel/xe_drm_fdinfo.c          |  3 +-
 tests/intel/xe_exec_atomic.c         |  1 +
 tests/intel/xe_exec_queue_property.c |  1 +
 tests/intel/xe_intel_bb.c            |  1 +
 tests/intel/xe_live_ktest.c          |  1 +
 tests/intel/xe_module_load.c         |  1 +
 tests/intel/xe_peer2peer.c           |  3 +-
 tests/intel/xe_prime_self_import.c   |  1 +
 tests/intel/xe_query.c               | 66 +++++++++++++++++-----------
 tests/intel/xe_spin_batch.c          |  1 +
 tests/intel/xe_waitfence.c           |  2 +
 14 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 8d1db9896..59f1e2992 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check bo create ioctl
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: uapi
  */
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 73b11dc74..1f4750923 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -5,11 +5,12 @@
 
 /**
  * TEST: Check debugfs userspace API
+ * Description: Validate debugfs entries
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: debugfs
  * Test category: functionality test
- * Description: Validate debugfs entries
  */
 
 #include <fcntl.h>
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 2db576ba8..3ed690f4e 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check dmabuf functionality
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: dmabuf
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9e5d0644a..51d2ea368 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -15,10 +15,11 @@
 /**
  * TEST: xe drm fdinfo
  * Description: Read and verify drm client memory consumption using fdinfo
- * Feature: SMI, core
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: Per client memory statistics
+ * Feature: SMI, core
  * Test category: SysMan
  *
  * SUBTEST: basic
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index d9790da78..4eff16f7a 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -15,6 +15,7 @@
 /**
  * TEST: Tests to verify atomic functionality.
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: HW
  * Functionality: intel-bb
  * Test category: functionality test
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index c3a3751cb..6df9815ad 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests to check exec_queue set/get property functionality
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: exec queue set property
  * Test category: functionality test
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 09164c41f..690576586 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -27,6 +27,7 @@
 /**
  * TEST: Basic tests for intel-bb xe functionality
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: IGT Lib
  * Functionality: intel-bb
  * Test category: functionality test
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index a894c6257..f3380dc98 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -5,6 +5,7 @@
  * TEST: Xe driver live kunit tests
  * Description: Xe driver live dmabuf unit tests
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: kunit
  * Functionality: kunit test
  * Test category: functionality test
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 080e12ec8..ce63ab106 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Tests the xe module loading
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: module load
  * Test category: functionality test
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index c63f1e4c4..59ea9964b 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -17,10 +17,11 @@
 
 /**
  * TEST: xe_peer2peer
+ * Description: Peer2peer dma buf copy tests
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
  * Functionality: dma buf copy
- * Description: Peer2peer dma buf copy tests
  * Test category: xe
  *
  * SUBTEST: read
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index f47733bb2..10a393811 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -28,6 +28,7 @@
 /**
  * TEST: Check whether prime import/export works on the same device
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: DRM
  * Functionality: prime import/export
  * Test category: functionality test
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..de2b13818 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check device configuration query
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: ioctl
  * Description: Acquire configuration data for xe device
@@ -176,10 +177,11 @@ const char *get_topo_name(int value)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
- * Category: Hardware building block
  * Description: Display engine classes available for all Xe devices.
- * Test category: functionality test
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_engines(int fd)
@@ -204,10 +206,11 @@ test_query_engines(int fd)
  *	and alignment.
  *
  * SUBTEST: multigpu-query-mem-usage
+ * Description: Display memory information for all Xe devices.
  * Category: Hardware building block
- * Test category: functionality test
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Description: Display memory information for all Xe devices.
+ * Test category: functionality test
  */
 static void
 test_query_mem_regions(int fd)
@@ -269,10 +272,11 @@ test_query_mem_regions(int fd)
  * Description: Display information about available GT components for xe device.
  *
  * SUBTEST: multigpu-query-gt-list
- * Category: Hardware building block
- * Test category: functionality test
  * Description: Display information about GT components for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_gt_list(int fd)
@@ -340,10 +344,11 @@ test_query_gt_list(int fd)
  * Description: Display topology information of GT.
  *
  * SUBTEST: multigpu-query-topology
- * Category: Hardware building block
- * Test category: functionality test
  * Description: Display topology information of GT for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_gt_topology(int fd)
@@ -390,10 +395,11 @@ test_query_gt_topology(int fd)
  * Description: Display xe device id, revision and configuration.
  *
  * SUBTEST: multigpu-query-config
- * Category: Hardware building block
- * Test category: functionality test
  * Description: Display config information for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_config(int fd)
@@ -445,10 +451,11 @@ test_query_config(int fd)
  * Description: Display hardware configuration of xe device.
  *
  * SUBTEST: multigpu-query-hwconfig
- * Category: Hardware building block
- * Test category: functionality test
  * Description: Display hardware configuration for all Xe devices.
+ * Category: Hardware building block
  * Sub-category: MultiGPU
+ * Mega feature: General Core features
+ * Test category: functionality test
  */
 static void
 test_query_hwconfig(int fd)
@@ -485,10 +492,11 @@ test_query_hwconfig(int fd)
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-query
- * Category: Hardware building block
- * Test category: negative test
  * Description: Check query with invalid arguments for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: negative test
  */
 static void
 test_query_invalid_query(int fd)
@@ -509,10 +517,11 @@ test_query_invalid_query(int fd)
  * Description: Check query with invalid size returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-size
- * Category: Hardware building block
- * Test category: negative test
  * Description: Check query with invalid size for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: negative test
  */
 static void
 test_query_invalid_size(int fd)
@@ -533,10 +542,11 @@ test_query_invalid_size(int fd)
  * Description: Check query with invalid extension returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-extension
- * Category: Hardware building block
- * Test category: negative test
  * Description: Check query with invalid extension for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Test category: negative test
  */
 static void
 test_query_invalid_extension(int fd)
@@ -698,8 +708,9 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
  * Description: Query CPU-GPU timestamp correlation
  *
  * SUBTEST: multigpu-query-cs-cycles
- * Category: Hardware building block
  * Description: Query CPU-GPU timestamp correlation for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
  */
 static void test_query_engine_cycles(int fd)
@@ -719,8 +730,9 @@ static void test_query_engine_cycles(int fd)
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-cs-cycles
- * Category: Hardware building block
  * Description: Check query with invalid arguments for all Xe devices.
+ * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: MultiGPU
  */
 static void test_engine_cycles_invalid(int fd)
@@ -833,9 +845,10 @@ test_query_uc_fw_version(int fd, uint32_t uc_type)
  * Description: Display the GuC firmware submission version
  *
  * SUBTEST: multigpu-query-uc-fw-version-guc
- * Test category: functionality test
- * Sub-category: MultiGPU
  * Description: Display GuC firmware submission version for all Xe devices.
+ * Mega feature: General Core features
+ * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_guc(int fd)
@@ -849,9 +862,10 @@ test_query_uc_fw_version_guc(int fd)
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
- * Test category: functionality test
- * Sub-category: MultiGPU
  * Description: Check query with invalid arguments for all Xe devices.
+ * Mega feature: General Core features
+ * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_invalid_mbz(int fd)
@@ -898,9 +912,9 @@ test_query_uc_fw_version_invalid_mbz(int fd)
  * Description: Display the HuC firmware version
  *
  * SUBTEST: multigpu-query-uc-fw-version-huc
- * Test category: functionality test
- * Sub-category: MultiGPU
  * Description: Display HuC firmware version for all Xe devices.
+ * Sub-category: MultiGPU
+ * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_huc(int fd)
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 68cbd1bd1..66ed0b77e 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -9,6 +9,7 @@
 /**
  * TEST: Tests for spin batch submissons.
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: IGT Lib
  * Functionality: parallel execution
  * Test category: functionality test
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 45378d95d..6916694f9 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -16,6 +16,7 @@
 /**
  * TEST: Check if waitfences work
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: functionality test
@@ -140,6 +141,7 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: negative test
-- 
2.34.1

