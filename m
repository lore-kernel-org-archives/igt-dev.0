Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862AECCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 17:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AF910E2A7;
	Tue,  4 Nov 2025 17:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjH9Uo3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8F10E2A7
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762279074; x=1793815074;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Noynsr8TE0J6r2AY5cY1UGSJvrH6TjI2um1fFqHEa3Y=;
 b=GjH9Uo3mcxhB5gCu2TkQKsp29DAkDYYN9JdsErpadfUE/ZbKFnRauamg
 9ACDtpdSOJ0Gwl8KbnwUjX9bMVMM2YBOtjq6mX1ivXgFFRMjsUEbd7yc/
 /gA3LsrWRQt5ora7Ootr2r/i0NprS5Gi2Wtil7UZcNPFSgx48WkRb5bky
 TrPs0HtMsy8PAVdwFNgIFFHVGFU9asE+llwfmniOaN+tZq0wWVNmfIbVj
 R+TmhSMe5quukz0fgC/sA7stM9bVRU0edVFhKn3Kdpdm+U5KdpWjKxcLf
 /nn72OeRxCXROPXO7fZ6u1Mji7q+aaKHhk0FjOvfuZIAzd9m5d/toN+qF Q==;
X-CSE-ConnectionGUID: BqrNVm+7S8uoIaVUqfmZ5Q==
X-CSE-MsgGUID: k+c/cE+yR7u1SV3H6iGBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75493657"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75493657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:57:54 -0800
X-CSE-ConnectionGUID: cs2EnndvSTSM6ZWX09fXZA==
X-CSE-MsgGUID: 8l6+hdD2TVmW5EdXNzaASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186905491"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 09:57:53 -0800
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@intel.com, jari.tahvanainen@intel.com
Subject: [PATCH i-g-t] tests/intel: Adjust test documentation
Date: Tue,  4 Nov 2025 23:28:19 +0530
Message-ID: <20251104175819.13809-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Change mega feature and sub-category for multigpu subtests
and some other legacy tests so that it can be fetched under
correct Feature Bucket.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_create.c          |  3 +-
 tests/intel/xe_eudebug.c         |  2 ++
 tests/intel/xe_exec_basic.c      |  9 ++++--
 tests/intel/xe_peer2peer.c       |  4 +--
 tests/intel/xe_query.c           | 55 ++++++++++++++++++++------------
 tests/intel/xe_sysfs_defaults.c  |  2 +-
 tests/intel/xe_sysfs_scheduler.c |  2 +-
 7 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index e8b8bb025..f0a3f737a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -383,7 +383,8 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
  *              buffer sizes.
  *
  * SUBTEST: multigpu-create-massive-size
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Functionality: ioctl
  * Test category: functionality test
  * Feature: multigpu
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 4a2c43635..f0d32f6f8 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -932,11 +932,13 @@ static void test_read_event(int fd)
  *	partial unbind, unbind and unbind all operations.
  *
  * SUBTEST: multigpu-basic-client
+ * Mega feature: MultiGPU
  * Functionality: attach multiGPU
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
  *
  * SUBTEST: multigpu-basic-client-many
+ * Mega feature: MultiGPU
  * Functionality: attach multiGPU
  * Description:
  *	Simultaneously attach many debuggers to many processes on all Xe devices.
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index f652ab6b2..79dace331 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -58,16 +58,19 @@
  *
  * SUBTEST: multigpu-once-%s
  * Description: Run %arg[1] test only once on multiGPU
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Test category: functionality test
  *
  * SUBTEST: multigpu-many-execqueues-many-vm-%s
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
  * Test category: stress test
  *
  * SUBTEST: multigpu-no-exec-%s
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Run no-exec %arg[1] test on multiGPU
  * Test category: functionality test
  *
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index b777d2b66..c2b724a52 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -18,8 +18,8 @@
 /**
  * TEST: xe_peer2peer
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Functionality: dma buf copy
  * Description: Peer2peer dma buf copy tests
  * Test category: xe
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 2de88fac9..d320f3ec1 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -184,7 +184,8 @@ const char *get_topo_name(int value)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display engine classes available for all Xe devices.
  * Test category: functionality test
  */
@@ -211,7 +212,8 @@ test_query_engines(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-mem-usage
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display memory information for all Xe devices.
  * Test category: functionality test
  */
@@ -275,7 +277,8 @@ test_query_mem_regions(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-gt-list
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display information about GT components for all Xe devices.
  * Test category: functionality test
  */
@@ -350,7 +353,8 @@ test_query_gt_list(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display topology information of GT for all Xe devices.
  * Test category: functionality test
  */
@@ -414,7 +418,8 @@ test_query_gt_topology(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology-l3-bank-mask
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Check the value of the l3 bank mask for all Xe devices.
  * Test category: functionality test
  */
@@ -486,7 +491,8 @@ test_query_gt_topology_l3_bank_mask(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-config
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display config information for all Xe devices.
  * Test category: functionality test
  */
@@ -543,7 +549,8 @@ test_query_config(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-hwconfig
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Display hardware configuration for all Xe devices.
  * Test category: functionality test
  */
@@ -582,7 +589,8 @@ test_query_hwconfig(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-query
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Check query with invalid arguments for all Xe devices.
  * Test category: negative test
  */
@@ -605,7 +613,8 @@ test_query_invalid_query(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-size
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Check query with invalid size for all Xe devices.
  * Test category: negative test
  */
@@ -628,7 +637,8 @@ test_query_invalid_size(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-extension
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Description: Check query with invalid extension for all Xe devices.
  * Test category: negative test
  */
@@ -793,8 +803,8 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: multigpu-query-cs-cycles
  * Description: Query CPU-GPU timestamp correlation for all Xe devices.
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  */
 static void test_query_engine_cycles(int fd)
 {
@@ -815,8 +825,8 @@ static void test_query_engine_cycles(int fd)
  * SUBTEST: multigpu-query-invalid-cs-cycles
  * Description: Check query with invalid arguments for all Xe devices.
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  */
 static void test_engine_cycles_invalid(int fd)
 {
@@ -929,8 +939,8 @@ test_query_uc_fw_version(int fd, uint32_t uc_type)
  *
  * SUBTEST: multigpu-query-uc-fw-version-guc
  * Description: Display GuC firmware submission version for all Xe devices.
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Test category: functionality test
  */
 static void
@@ -946,8 +956,8 @@ test_query_uc_fw_version_guc(int fd)
  *
  * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
  * Description: Check query with invalid arguments for all Xe devices.
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Test category: functionality test
  */
 static void
@@ -996,7 +1006,8 @@ test_query_uc_fw_version_invalid_mbz(int fd)
  *
  * SUBTEST: multigpu-query-uc-fw-version-huc
  * Description: Display HuC firmware version for all Xe devices.
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  * Test category: functionality test
  */
 static void
@@ -1011,7 +1022,8 @@ test_query_uc_fw_version_huc(int fd)
  *
  * SUBTEST: multigpu-query-oa-units
  * Description: Display fields for OA unit query for all GPU devices
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  */
 static void test_query_oa_units(int fd)
 {
@@ -1063,7 +1075,8 @@ static void test_query_oa_units(int fd)
  *
  * SUBTEST: multigpu-query-pxp-status
  * Description: Display fields for PXP unit query for all Xe devices
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
+ * Sub-category: MultiGPU tests
  */
 static void test_query_pxp_status(int fd)
 {
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 393e56651..f21ae94e6 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -7,7 +7,7 @@
  * TEST: xe sysfs defaults
  * Description: check if the sysfs engine .defaults node has all values.
  * Category: Core
- * Mega feature: SysMan
+ * Mega feature: General Core features
  * Sub-category: SysMan tests
  * Functionality: sysman defaults
  * Test category: functionality test
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index faafabd29..90d4ab8fd 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -6,7 +6,7 @@
 /**
  * TEST: xe sysfs scheduler
  * Category: Core
- * Mega feature: SysMan
+ * Mega feature: General Core features
  * Sub-category: SysMan tests
  * Functionality: scheduler control interface
  *
-- 
2.50.1

