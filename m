Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3AC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FE710FCE9;
	Wed, 27 Mar 2024 12:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWsL6awo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD02610FCE7
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542550; x=1743078550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01a8iLCOmXonSomW6HELIwXzAIHnjAVkS/htyZYU3DA=;
 b=FWsL6awolRLgco3/eAoUNVS+VvtqRU8syUWApvDx21i/8+lQYIM/sMs2
 ARFoqlwGDbsJ2RQk2QEQUv0flROM9XP2Sd+VxYJ6DJ0PFcoWt9RO+/nbD
 vRu+sh845l856Ld0o0Sek0YEudg0wq5YZNKTKU6u6FAZU3T0HgKghs9pL
 zBUKcZN4D5Et/8w3a7XPwqcfBIkUz8+SSOekJaiXmtdRdjh6RcPjBldjy
 GV39wIZR4Yg/Tns38SnR4TmY0thJXOK/6N4/Izthd7ZxIBaizXFMuJJPa
 CvYRNUvZpmytxWW9H+66ZhT7zGrlh7oRdDQVWtaKPAY+s049zRv+nFPGn g==;
X-CSE-ConnectionGUID: wsi9aedZSOKxV9j7fa/PAw==
X-CSE-MsgGUID: OkLAn4z5TDOc/SH3gHbTrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="10419113"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="10419113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16336905"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:07 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 09/16] tests/intel: Introduce General XE mega feature
Date: Wed, 27 Mar 2024 12:27:24 +0000
Message-Id: <20240327122731.2104614-10-katarzyna.piecielska@intel.com>
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

Add tests to 'General tests feature' mega feature.
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
 tests/intel/xe_huc_copy.c            |  1 +
 tests/intel/xe_intel_bb.c            |  1 +
 tests/intel/xe_live_ktest.c          |  1 +
 tests/intel/xe_module_load.c         |  1 +
 tests/intel/xe_peer2peer.c           |  3 +-
 tests/intel/xe_prime_self_import.c   |  1 +
 tests/intel/xe_query.c               | 66 +++++++++++++++++-----------
 tests/intel/xe_spin_batch.c          |  1 +
 tests/intel/xe_waitfence.c           |  3 ++
 15 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index fd5d71d8a..52ba4a579 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check bo create ioctl
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: uapi
  */
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index c5a586e9b..162830787 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -5,11 +5,12 @@
 
 /**
  * TEST: Check debugfs userspace API
+ * Description: Validate debugfs entries
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: uapi
  * Functionality: debugfs
  * Test category: functionality test
- * Description: Validate debugfs entries
  */
 
 #include <fcntl.h>
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index b69283093..a7d10f0ef 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check dmabuf functionality
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: dmabuf
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9e5d0644a..554082d3b 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -15,10 +15,11 @@
 /**
  * TEST: xe drm fdinfo
  * Description: Read and verify drm client memory consumption using fdinfo
- * Feature: SMI, core
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: driver
  * Functionality: Per client memory statistics
+ * Feature: SMI, core
  * Test category: SysMan
  *
  * SUBTEST: basic
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index d9790da78..7ce374b75 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -15,6 +15,7 @@
 /**
  * TEST: Tests to verify atomic functionality.
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: HW
  * Functionality: intel-bb
  * Test category: functionality test
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 51ecd725d..4a0681fe8 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests to check exec_queue set/get property functionality
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: uapi
  * Functionality: exec queue set property
  * Test category: functionality test
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 339cf6e5f..3c475112d 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Test HuC copy firmware.
  * Category: Firmware building block
+ * Mega feature: General Xe features
  * Sub-category: Firmware
  * Functionality: huc copy
  * Test category: functionality test
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 09164c41f..bad2b622d 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -27,6 +27,7 @@
 /**
  * TEST: Basic tests for intel-bb xe functionality
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: IGT Lib
  * Functionality: intel-bb
  * Test category: functionality test
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index c50aefea8..fc2ba29a9 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -5,6 +5,7 @@
  * TEST: Xe driver live kunit tests
  * Description: Xe driver live dmabuf unit tests
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: kunit
  * Functionality: kunit
  * Test category: functionality test
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 080e12ec8..f93b93f9f 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Tests the xe module loading
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: driver
  * Functionality: module load
  * Test category: functionality test
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index c63f1e4c4..35c8df252 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -17,10 +17,11 @@
 
 /**
  * TEST: xe_peer2peer
+ * Description: Peer2peer dma buf copy tests
  * Category: Hardware building block
+ * Mega feature: General Xe features
  * Sub-category: MultiGPU
  * Functionality: dma buf copy
- * Description: Peer2peer dma buf copy tests
  * Test category: xe
  *
  * SUBTEST: read
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index f47733bb2..4220a6677 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -28,6 +28,7 @@
 /**
  * TEST: Check whether prime import/export works on the same device
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: DRM
  * Functionality: prime import/export
  * Test category: functionality test
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..d0416ee17 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check device configuration query
  * Category: Software building block
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
+ * Mega feature: General Xe features
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
index da8fd0a30..ee9a223d3 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -9,6 +9,7 @@
 /**
  * TEST: Tests for spin batch submissons.
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: IGT Lib
  * Functionality: parallel execution
  * Test category: functionality test
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 071e67bd6..099ba4f8f 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -16,6 +16,7 @@
 /**
  * TEST: Check if waitfences work
  * Category: Software building block
+ * Mega feature: General Xe features
  * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: functionality test
@@ -140,6 +141,8 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
+ * Mega feature: General Xe features
+ * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: negative test
  *
-- 
2.34.1

