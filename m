Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E375CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFC910E38F;
	Mon, 10 Nov 2025 13:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BucTl4vv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0D810E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762779938; x=1794315938;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zy51F4H0gTCxXlBpow8bXRzgJQQ5btB96y0Dv8frzHI=;
 b=BucTl4vv211A46rn+r7MmHR4ZVnwb1/wgZVQsGVGTssVaQgLAojf5IGX
 fSE0yrqyyXI7YpUwW1lprr0sKm3KQ7beVlA4XoQ4hhd58HISXGBLVgr7c
 OCGSFBx654DGdNQRBoGyMeEi7+3qOerJPiNzuctbC5G0JfDaL3+rWqXfD
 9D5HXOCv41oVnmyh1rNMAv0JdU74t/A27AS3RmXj0KZXThaYcp+el6jcu
 V2172KiKWu5ZUPdCqRbzXr1oIVXHnuw/ZeFsIBVOOwGjQlkAcUYvnIJq1
 vSlluyhdKzgvGxsEJumYtDmeD55rxRM4qQrpg/d1OjJocOWmMy8bbJrr+ A==;
X-CSE-ConnectionGUID: E3c1x5x2QGStdW71Zw6zSw==
X-CSE-MsgGUID: vUTQgs0YQQCinWdWYSk6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64034943"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64034943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:05:38 -0800
X-CSE-ConnectionGUID: tlHnw9O0TNaX8MdTAElIig==
X-CSE-MsgGUID: tD9kYiVkRjyUHr2j4o3gNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="219324394"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 05:05:36 -0800
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 jari.tahvanainen@intel.com
Subject: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
Date: Mon, 10 Nov 2025 18:36:14 +0530
Message-ID: <20251110130614.28345-1-himanshu.girotra@intel.com>
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

v2 Remove subcategory entries when possible, as they duplicate the information
already captured in mega-feature entries (Priyanka).

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_create.c          |  2 +-
 tests/intel/xe_eudebug.c         |  2 ++
 tests/intel/xe_exec_basic.c      |  6 ++---
 tests/intel/xe_peer2peer.c       |  4 ++--
 tests/intel/xe_query.c           | 38 ++++++++++++++------------------
 tests/intel/xe_sysfs_defaults.c  |  2 +-
 tests/intel/xe_sysfs_scheduler.c |  2 +-
 7 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index e8b8bb025..d7fe9d626 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -383,7 +383,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
  *              buffer sizes.
  *
  * SUBTEST: multigpu-create-massive-size
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Functionality: ioctl
  * Test category: functionality test
  * Feature: multigpu
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 59aca526e..9d1280528 100644
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
index f652ab6b2..616fd262c 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -58,16 +58,16 @@
  *
  * SUBTEST: multigpu-once-%s
  * Description: Run %arg[1] test only once on multiGPU
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Test category: functionality test
  *
  * SUBTEST: multigpu-many-execqueues-many-vm-%s
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
  * Test category: stress test
  *
  * SUBTEST: multigpu-no-exec-%s
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Run no-exec %arg[1] test on multiGPU
  * Test category: functionality test
  *
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 70374e56d..92cb6a65f 100644
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
index 2de88fac9..928daaf58 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -184,7 +184,7 @@ const char *get_topo_name(int value)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display engine classes available for all Xe devices.
  * Test category: functionality test
  */
@@ -211,7 +211,7 @@ test_query_engines(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-mem-usage
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display memory information for all Xe devices.
  * Test category: functionality test
  */
@@ -275,7 +275,7 @@ test_query_mem_regions(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-gt-list
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display information about GT components for all Xe devices.
  * Test category: functionality test
  */
@@ -350,7 +350,7 @@ test_query_gt_list(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display topology information of GT for all Xe devices.
  * Test category: functionality test
  */
@@ -414,7 +414,7 @@ test_query_gt_topology(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology-l3-bank-mask
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Check the value of the l3 bank mask for all Xe devices.
  * Test category: functionality test
  */
@@ -486,7 +486,7 @@ test_query_gt_topology_l3_bank_mask(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-config
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display config information for all Xe devices.
  * Test category: functionality test
  */
@@ -543,7 +543,7 @@ test_query_config(int fd)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-hwconfig
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Display hardware configuration for all Xe devices.
  * Test category: functionality test
  */
@@ -582,7 +582,7 @@ test_query_hwconfig(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-query
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Check query with invalid arguments for all Xe devices.
  * Test category: negative test
  */
@@ -605,7 +605,7 @@ test_query_invalid_query(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-size
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Check query with invalid size for all Xe devices.
  * Test category: negative test
  */
@@ -628,7 +628,7 @@ test_query_invalid_size(int fd)
  * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-extension
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Description: Check query with invalid extension for all Xe devices.
  * Test category: negative test
  */
@@ -793,8 +793,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: multigpu-query-cs-cycles
  * Description: Query CPU-GPU timestamp correlation for all Xe devices.
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  */
 static void test_query_engine_cycles(int fd)
 {
@@ -815,8 +814,7 @@ static void test_query_engine_cycles(int fd)
  * SUBTEST: multigpu-query-invalid-cs-cycles
  * Description: Check query with invalid arguments for all Xe devices.
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  */
 static void test_engine_cycles_invalid(int fd)
 {
@@ -929,8 +927,7 @@ test_query_uc_fw_version(int fd, uint32_t uc_type)
  *
  * SUBTEST: multigpu-query-uc-fw-version-guc
  * Description: Display GuC firmware submission version for all Xe devices.
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Test category: functionality test
  */
 static void
@@ -946,8 +943,7 @@ test_query_uc_fw_version_guc(int fd)
  *
  * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
  * Description: Check query with invalid arguments for all Xe devices.
- * Mega feature: General Core features
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Test category: functionality test
  */
 static void
@@ -996,7 +992,7 @@ test_query_uc_fw_version_invalid_mbz(int fd)
  *
  * SUBTEST: multigpu-query-uc-fw-version-huc
  * Description: Display HuC firmware version for all Xe devices.
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  * Test category: functionality test
  */
 static void
@@ -1011,7 +1007,7 @@ test_query_uc_fw_version_huc(int fd)
  *
  * SUBTEST: multigpu-query-oa-units
  * Description: Display fields for OA unit query for all GPU devices
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
  */
 static void test_query_oa_units(int fd)
 {
@@ -1063,7 +1059,7 @@ static void test_query_oa_units(int fd)
  *
  * SUBTEST: multigpu-query-pxp-status
  * Description: Display fields for PXP unit query for all Xe devices
- * Sub-category: MultiGPU
+ * Mega feature: MultiGPU
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

