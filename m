Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346BFC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD2310E36C;
	Thu, 27 Feb 2025 13:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5QS4nlS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1652010E36C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740661479; x=1772197479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PDUpQ9qZW1uyuvyEVWAPoCvgslLWkOsJaVw0kJZsnw8=;
 b=S5QS4nlSZ8i5KHHS9S9LKk8oqfSA4C471Pwrmm2dRLL86ptd3lxD7Rqs
 /oGD80jS/ynLdLD/ZeJOO0WuHH4jWmxp1B68K1zHSqLxTGFEq6Pl+bAnp
 pcm3XMzmkFpL7KCISZ/crogSwpY56geCeGM9xYYPW/NQDxrN5c4otH351
 0XjG52P9A/T6tqulcQ5iD0CxivMMLjgRIc6BnnWDlKamVmudaFzOfUf4Q
 tthncM0SFz6deKrla1RSOCFdmzt3tZEVZbBCjKrj1gTwZWqkX7Bz+RiVS
 kLZEEbNtmAKdeuVu8KAToJgPXVb27/hfqyBxsYORFnqn78EzvAGqiM5vK w==;
X-CSE-ConnectionGUID: sN9WuNmBTUq2pKpNxPtbQw==
X-CSE-MsgGUID: Chd36vv5RS2vOtMGvs9ERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41570205"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41570205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:38 -0800
X-CSE-ConnectionGUID: Y/g6WGlfRRamf1ASUDHTRA==
X-CSE-MsgGUID: /G1HeQZ/TqqG6dk+8zkp3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117026727"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.211.135.227])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:36 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel: Adjust test documentation
Date: Thu, 27 Feb 2025 13:03:54 +0000
Message-Id: <20250227130354.1169897-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
References: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

During making changes in Mega feature <-> Sub-category pairs I've
noticed few places were test documentation formatting is different
than pattern:

	/**
	 * TEST:
	 * Category:
	 * Mega feature:
	 * Sub-category:
	 * Functionality:
	 * Test category:
	 *
	 * SUBTEST:
	 * Functionality:
	 * Description:
	*/

So let's align Xe tests to this order.

Also there is no need to duplicate documentation fields in subtests
if Category/Mega feature/Sub-category/Functionality are the same
for subtest as for whole binary.

Last thing is to make sure test description is properly adjusted.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 tests/intel/xe_compute.c                 |  2 -
 tests/intel/xe_debugfs.c                 |  2 +-
 tests/intel/xe_drm_fdinfo.c              |  2 +-
 tests/intel/xe_exec_atomic.c             |  7 ++-
 tests/intel/xe_exec_balancer.c           |  1 -
 tests/intel/xe_exec_basic.c              |  4 +-
 tests/intel/xe_exec_queue_property.c     | 14 +++--
 tests/intel/xe_exec_store.c              | 11 ++--
 tests/intel/xe_fault_injection.c         |  6 ++-
 tests/intel/xe_media_fill.c              |  2 +-
 tests/intel/xe_oa.c                      |  2 +-
 tests/intel/xe_peer2peer.c               |  2 +-
 tests/intel/xe_pm_residency.c            |  6 ++-
 tests/intel/xe_pmu.c                     |  3 +-
 tests/intel/xe_query.c                   | 58 ++++++++-------------
 tests/intel/xe_spin_batch.c              |  7 ++-
 tests/intel/xe_sriov_auto_provisioning.c | 24 ++++-----
 tests/intel/xe_sriov_scheduling.c        |  1 -
 tests/intel/xe_sysfs_scheduler.c         |  6 ++-
 tests/intel/xe_vm.c                      | 65 ++++++++++++------------
 tests/intel/xe_waitfence.c               | 15 +++---
 21 files changed, 118 insertions(+), 122 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 7daf6209d..446dfeb63 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -170,8 +170,6 @@ test_compute_kernel_with_ccs_mode(int num_gt)
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
- * Mega feature: WMTP
- * Functionality: OpenCL kernel
  */
 static void
 test_compute_square(int fd)
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index c653daae4..ec8b0d0b5 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -5,11 +5,11 @@
 
 /**
  * TEST: Check debugfs userspace API
- * Description: Validate debugfs entries
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: debugfs
+ * Description: Validate debugfs entries
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 7330b4330..f17245bea 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -19,11 +19,11 @@
 
 /**
  * TEST: xe drm fdinfo
- * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: Per client memory and engine utilization statistics
+ * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
  * Feature: SMI, core
  * Test category: SysMan
  *
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 67017d9e1..825d7d190 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -48,9 +48,12 @@ static void atomic_batch(struct data *data, uint64_t addr, int ops)
 
 /**
  * SUBTEST: basic-inc-all
- * Description: Test to verify atomic increment on all available engines and memory types.
+ * Description: Test to verify atomic increment on all available engines
+ *		and memory types.
+ *
  * SUBTEST: basic-dec-all
- * Description: Test to verify atomic decrement on all available engines and memory types.
+ * Description: Test to verify atomic decrement on all available engines
+ *		and memory types.
  */
 static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
 		       uint32_t placement)
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index bc15cc0f8..1747e207c 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -333,7 +333,6 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Run compute mode virtual exec_queue arg[1] test only once
  * Test category: functionality test
  *
- *
  * SUBTEST: twice-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] test twice
  * Test category: functionality test
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index dfbd68d1d..f652ab6b2 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -62,13 +62,13 @@
  * Test category: functionality test
  *
  * SUBTEST: multigpu-many-execqueues-many-vm-%s
- * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
  * Sub-category: MultiGPU
+ * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
  * Test category: stress test
  *
  * SUBTEST: multigpu-no-exec-%s
- * Description: Run no-exec %arg[1] test on multiGPU
  * Sub-category: MultiGPU
+ * Description: Run no-exec %arg[1] test on multiGPU
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 885d5bcc9..4dfcf09e2 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -10,10 +10,14 @@
  * Sub-category: uapi
  * Functionality: exec queue set property
  * Test category: functionality test
+ *
  * SUBTEST: priority-set-property
- * Description: tests basic priority property by setting invalid values and positive values.
+ * Description: tests basic priority property by setting invalid values
+ *		and positive values.
+ *
  * SUBTEST: %s-property-min-max
- * Description: Test to check if %arg[1] schedule parameter checks for min max values.
+ * Description: Test to check if %arg[1] schedule parameter checks for min max
+ *		values.
  *
  * arg[1]:
  *
@@ -94,7 +98,8 @@ static void test_property_min_max(int xe, int engine, const char **property,
 
 /**
  * SUBTEST: Invalid-exec-queue
- * Description: Negative test to check the expected behaviour with invalid exec_queue_id.
+ * Description: Negative test to check the expected behaviour with invalid
+ *		exec_queue_id.
  * Test category: functionality test
  */
 static void Invalid_exec_queue_id(int xe)
@@ -109,7 +114,8 @@ static void Invalid_exec_queue_id(int xe)
 
 /**
  * SUBTEST: non-zero-reserved
- * Description: Negative test to check the expected behaviour with non-zero reserved.
+ * Description: Negative test to check the expected behaviour with non-zero
+ *		reserved.
  * Test category: functionality test
  */
 static void non_zero_reserved(int xe)
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 2450834bf..bf22c3475 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -105,8 +105,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
 /**
  * SUBTEST: basic-store
  * Description: Basic test to verify store dword.
+ *
  * SUBTEST: basic-cond-batch
  * Description: Basic test to verify cond batch end instruction.
+ *
  * SUBTEST: basic-all
  * Description: Test to verify store dword on all available engines.
  */
@@ -277,7 +279,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 
 /**
  * SUBTEST: persistent
- * DESCRIPTION: Validate MI_PRT_BATCH_BUFFER_START functionality
+ * Description: Validate MI_PRT_BATCH_BUFFER_START functionality
  */
 static void persistent(int fd)
 {
@@ -343,9 +345,10 @@ static void persistent(int fd)
 
 /**
  * SUBTEST: long-shader-bb-check
- * DESCRIPTION: Write incrementing values to 2-page-long target surface using long shader. Check if
- *		the bb contains full shader. Check if all written values are in the target surface.
- *		Place bb and surface in various memory regions to validate memory coherency.
+ * Description: Write incrementing values to 2-page-long target surface using
+ *		long shader. Check if the bb contains full shader. Check if all
+ *		written values are in the target surface. Place bb and surface
+ *		in various memory regions to validate memory coherency.
  */
 static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
 			uint64_t bb_region, uint64_t target_region)
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index ede483535..3631128b2 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -153,7 +153,8 @@ static void set_retval(const char function_name[], long long retval)
 
 /**
  * SUBTEST: inject-fault-probe-function-%s
- * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Description: inject an error in the injectable function %arg[1] then
+ *		reprobe driver
  * Functionality: fault
  *
  * arg[1]:
@@ -254,7 +255,8 @@ simple_vm_bind(int fd, uint32_t vm)
 
 /**
  * SUBTEST: vm-bind-fail-%s
- * Description: inject an error in function %arg[1] used in vm bind IOCTL to make it fail
+ * Description: inject an error in function %arg[1] used in vm bind IOCTL
+ *		to make it fail
  * Functionality: fault
  *
  * arg[1]:
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 7fc3c187e..1e0ccb829 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -27,11 +27,11 @@
 
 /**
  * TEST: xe media fill
- * Description: Basic tests for the media_fill() function.
  * Category: Core
  * Mega feature: Media
  * Sub-category: Media tests
  * Functionality: fill surface with media block
+ * Description: Basic tests for the media_fill() function.
  * Feature: media
  * Test category: functionality test
  *
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 6abf44128..c0e5ef756 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -30,11 +30,11 @@
 
 /**
  * TEST: perf
- * Description: Test the Xe OA metrics streaming interface
  * Category: Core
  * Mega feature: Performance interface
  * Sub-category: Performance tests
  * Functionality: oa
+ * Description: Test the Xe OA metrics streaming interface
  * Feature: xe streaming interface, oa
  * Test category: Perf
  */
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 2a941abe6..b777d2b66 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -17,11 +17,11 @@
 
 /**
  * TEST: xe_peer2peer
- * Description: Peer2peer dma buf copy tests
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
  * Functionality: dma buf copy
+ * Description: Peer2peer dma buf copy tests
  * Test category: xe
  *
  * SUBTEST: read
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 3432077cc..7d43b6dec 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -55,13 +55,15 @@ enum test_type {
  *
  * SUBTEST: toggle-gt-c6
  * Description: toggles GT C states by acquiring/releasing forcewake,
- *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
+ *		also validates power consumed by GPU in GT C6 is lesser than
+ *		that of GT C0.
  *
  * SUBTEST: cpg-basic
  * Description: Validate GT coarse power gating status with S3 cycle.
  *
  * SUBTEST: cpg-gt-toggle
- * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
+ * Description: Toggle GT coarse power gating states by acquiring/releasing
+ *		forcewake.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 4584fc7d3..66edf24ad 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -130,7 +130,8 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
  * Description: Test to validate engine activity shows no load when idle
  *
  * SUBTEST: engine-activity-load-idle
- * Description: Test to validate engine activity with full load followed by trailing idle
+ * Description: Test to validate engine activity with full load followed by
+ *		trailing idle
  *
  * SUBTEST: engine-activity-load
  * Description: Test to validate engine activity stats by running a workload and
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1566680e7..9775a4119 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -184,10 +184,8 @@ const char *get_topo_name(int value)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
- * Description: Display engine classes available for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Display engine classes available for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -208,15 +206,13 @@ test_query_engines(int fd)
 
 /**
  * SUBTEST: query-mem-usage
- * Test category: functionality test
  * Description: Display memory information like memory class, size
  *	and alignment.
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-mem-usage
- * Description: Display memory information for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Display memory information for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -275,14 +271,12 @@ test_query_mem_regions(int fd)
 
 /**
  * SUBTEST: query-gt-list
- * Test category: functionality test
  * Description: Display information about available GT components for xe device.
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-gt-list
- * Description: Display information about GT components for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Display information about GT components for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -352,14 +346,12 @@ test_query_gt_list(int fd)
 
 /**
  * SUBTEST: query-topology
- * Test category: functionality test
  * Description: Display topology information of GT.
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology
- * Description: Display topology information of GT for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Display topology information of GT for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -418,13 +410,13 @@ test_query_gt_topology(int fd)
 
 /**
  * SUBTEST: query-topology-l3-bank-mask
- * Test category: functionality test
  * Description: Check the value of the l3 bank mask
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-topology-l3-bank-mask
- * Test category: functionality test
- * Description: Check the value of the l3 bank mask for all Xe devices.
  * Sub-category: MultiGPU
+ * Description: Check the value of the l3 bank mask for all Xe devices.
+ * Test category: functionality test
  */
 static void
 test_query_gt_topology_l3_bank_mask(int fd)
@@ -490,14 +482,12 @@ test_query_gt_topology_l3_bank_mask(int fd)
 
 /**
  * SUBTEST: query-config
- * Test category: functionality test
  * Description: Display xe device id, revision and configuration.
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-config
- * Description: Display config information for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Display config information for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -546,14 +536,12 @@ test_query_config(int fd)
 
 /**
  * SUBTEST: query-hwconfig
- * Test category: functionality test
  * Description: Display hardware configuration of xe device.
+ * Test category: functionality test
  *
  * SUBTEST: multigpu-query-hwconfig
- * Description: Display hardware configuration for all Xe devices.
- * Category: Core
  * Sub-category: MultiGPU
- * Mega feature: General Core features
+ * Description: Display hardware configuration for all Xe devices.
  * Test category: functionality test
  */
 static void
@@ -587,14 +575,12 @@ test_query_hwconfig(int fd)
 
 /**
  * SUBTEST: query-invalid-query
- * Test category: negative test
  * Description: Check query with invalid arguments returns expected error code.
+ * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-query
- * Description: Check query with invalid arguments for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Check query with invalid arguments for all Xe devices.
  * Test category: negative test
  */
 static void
@@ -612,14 +598,12 @@ test_query_invalid_query(int fd)
 
 /**
  * SUBTEST: query-invalid-size
- * Test category: negative test
  * Description: Check query with invalid size returns expected error code.
+ * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-size
- * Description: Check query with invalid size for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Check query with invalid size for all Xe devices.
  * Test category: negative test
  */
 static void
@@ -637,14 +621,12 @@ test_query_invalid_size(int fd)
 
 /**
  * SUBTEST: query-invalid-extension
- * Test category: negative test
  * Description: Check query with invalid extension returns expected error code.
+ * Test category: negative test
  *
  * SUBTEST: multigpu-query-invalid-extension
- * Description: Check query with invalid extension for all Xe devices.
- * Category: Core
- * Mega feature: General Core features
  * Sub-category: MultiGPU
+ * Description: Check query with invalid extension for all Xe devices.
  * Test category: negative test
  */
 static void
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index e4000f50e..7c0305d17 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -217,11 +217,14 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 #define SPIN_FIX_DURATION_PREEMPT		1
 /**
  * SUBTEST: spin-fixed-duration
- * Description: Basic test which validates the functionality of xe_spin with fixed duration.
+ * Description: Basic test which validates the functionality of xe_spin with
+ *		fixed duration.
  */
 /**
  * SUBTEST: spin-fixed-duration-with-preempter
- * Description: Basic test which validates the functionality of xe_spin preemption which gets preempted with a short duration high-priority task.
+ * Description: Basic test which validates the functionality of xe_spin
+ *		preemption which gets preempted with a short duration
+ *		high-priority task.
  */
 static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 {
diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index d71bcbfec..9ef5ed79a 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -19,32 +19,30 @@
  * Mega feature: SR-IOV
  * Sub-category: provisioning
  * Functionality: auto-provisioning
- * Run type: FULL
  * Description: Examine behavior of SR-IOV auto-provisioning
+ * Run type: FULL
  *
  * SUBTEST: fair-allocation
- * Description:
- *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
+ * Description: Verify that auto-provisioned resources are allocated by
+ *		PF driver in fairly manner
  *
  * SUBTEST: resources-released-on-vfs-disabling
- * Description:
- *   Verify that auto-provisioned resources are released once VFs are disabled
+ * Description: Verify that auto-provisioned resources are released
+ *		once VFs are disabled
  *
  * SUBTEST: exclusive-ranges
- * Description:
- *   Verify that ranges of auto-provisioned resources are exclusive
+ * Description: Verify that ranges of auto-provisioned resources are exclusive
  *
  * SUBTEST: selfconfig-basic
- * Description:
- *   Check if VF configuration data is the same as provisioned
+ * Description: Check if VF configuration data is the same as provisioned
  *
  * SUBTEST: selfconfig-reprovision-increase-numvfs
- * Description:
- *   Check if VF configuration data is updated properly after increasing number of VFs
+ * Description: Check if VF configuration data is updated properly after
+ *		increasing number of VFs
  *
  * SUBTEST: selfconfig-reprovision-reduce-numvfs
- * Description:
- *   Check if VF configuration data is updated properly after decreasing number of VFs
+ * Description: Check if VF configuration data is updated properly after
+ *		decreasing number of VFs
  */
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 82c525fe3..89cdd8750 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -17,7 +17,6 @@
  * Mega feature: SR-IOV
  * Sub-category: scheduling
  * Functionality: vGPU profiles scheduling parameters
- * Run type: FULL
  * Description: Verify behavior after modifying scheduling attributes.
  */
 
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 89c87c2ee..4fc764f82 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -11,11 +11,13 @@
  * Functionality: scheduler control interface
  *
  * SUBTEST: %s-invalid
- * Description: Test to check if %s arg[1] schedule parameter rejects any unrepresentable intervals.
+ * Description: Test to check if %s arg[1] schedule parameter rejects any
+ *		unrepresentable intervals.
  * Test category: negative test
  *
  * SUBTEST: %s-min-max
- * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ *		min max values.
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 0730dd3d3..fdf74c114 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -83,8 +83,8 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 
 /**
  * SUBTEST: scratch
- * Description: Test scratch page creation and write
  * Functionality: scratch page
+ * Description: Test scratch page creation and write
  * Test category: functionality test
  */
 
@@ -206,8 +206,8 @@ uint64_t addrs_57b[] = {
 
 /**
  * SUBTEST: bind-once
- * Description: bind once on one BO
  * Functionality: bind BO
+ * Description: bind once on one BO
  * Test category: functionality test
  */
 
@@ -223,8 +223,8 @@ test_bind_once(int fd)
 
 /**
  * SUBTEST: bind-one-bo-many-times
- * Description: bind many times on one BO
  * Functionality: bind BO
+ * Description: bind many times on one BO
  * Test category: functionality test
  */
 
@@ -243,8 +243,8 @@ test_bind_one_bo_many_times(int fd)
 
 /**
  * SUBTEST: bind-one-bo-many-times-many-vm
- * Description: Test bind many times and many VM on one BO
  * Functionality: bind BO
+ * Description: Test bind many times and many VM on one BO
  * Test category: functionality test
  */
 
@@ -261,8 +261,8 @@ test_bind_one_bo_many_times_many_vm(int fd)
 
 /**
  * SUBTEST: partial-unbinds
- * Description: Test partial unbinds
  * Functionality: unbind
+ * Description: Test partial unbinds
  * Test category: functionality test
  */
 
@@ -301,8 +301,8 @@ static void test_partial_unbinds(int fd)
 
 /**
  * SUBTEST: unbind-all-%d-vmas
- * Description: Test unbind all with %arg[1] VMAs
  * Functionality: unbind
+ * Description: Test unbind all with %arg[1] VMAs
  * Test category: functionality test
  *
  * arg[1].values: 2, 8
@@ -339,10 +339,10 @@ static void unbind_all(int fd, int n_vmas)
 
 /**
  * SUBTEST: userptr-invalid
+ * Functionality: userptr
  * Description:
  *	Verifies that mapping an invalid userptr returns -EFAULT,
  *	and that it is correctly handled.
- * Functionality: userptr
  * Test category: negative test
  */
 static void userptr_invalid(int fd)
@@ -368,9 +368,9 @@ static void userptr_invalid(int fd)
 
 /**
  * SUBTEST: compact-64k-pages
+ * Functionality: bind
  * Description:
  *	Take corner cases related to compact and 64k pages
- * Functionality: bind
  * Test category: functionality test
  */
 static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
@@ -676,13 +676,13 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 /**
  * SUBTEST: bind-execqueues-independent
- * Description: Test independent bind exec_queues
  * Functionality: bind exec_queues
+ * Description: Test independent bind exec_queues
  * Test category: functionality test
  *
  * SUBTEST: bind-execqueues-conflict
- * Description: Test conflict bind exec_queues
  * Functionality: bind exec_queues
+ * Description: Test conflict bind exec_queues
  * Test category: functionality test
  */
 
@@ -869,28 +869,28 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
 
 /**
  * SUBTEST: bind-array-twice
- * Description: Test bind array twice
  * Functionality: bind exec_queues
+ * Description: Test bind array twice
  * Test category: functionality test
  *
  * SUBTEST: bind-array-many
- * Description: Test bind array many times
  * Functionality: bind exec_queues
+ * Description: Test bind array many times
  * Test category: functionality test
  *
  * SUBTEST: bind-array-enobufs
- * Description: Test bind array which too large are trigger -ENOBUFs error
  * Functionality: bind exec_queues
+ * Description: Test bind array which too large are trigger -ENOBUFs error
  * Test category: functionality test
  *
  * SUBTEST: bind-array-exec_queue-twice
- * Description: Test bind array exec_queue twice
  * Functionality: bind exec_queues
+ * Description: Test bind array exec_queue twice
  * Test category: functionality test
  *
  * SUBTEST: bind-array-exec_queue-many
- * Description: Test bind array exec_queue many times
  * Functionality: bind exec_queues
+ * Description: Test bind array exec_queue many times
  * Test category: functionality test
  */
 static void
@@ -1029,18 +1029,18 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 /**
  * SUBTEST: bind-array-conflict
- * Description: Test bind array with conflicting address
  * Functionality: bind exec_queues and page table updates
+ * Description: Test bind array with conflicting address
  * Test category: functionality test
  *
  * SUBTEST: bind-no-array-conflict
- * Description: Test binding with conflicting address
  * Functionality: bind and page table updates
+ * Description: Test binding with conflicting address
  * Test category: functionality test
  *
  * SUBTEST: bind-array-conflict-error-inject
- * Description: Test bind array with conflicting address plus error injection
  * Functionality: bind exec_queues and page table updates error paths
+ * Description: Test bind array with conflicting address plus error injection
  * Test category: functionality test
  */
 static void
@@ -1284,8 +1284,8 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 
 /**
  * SUBTEST: %s-%ld
- * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: bind
+ * Description: Test %arg[1] with %arg[2] bind size
  * Test category: functionality test
  *
  * arg[1]:
@@ -1302,8 +1302,8 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 
 /**
  * SUBTEST: %s-%ld
- * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: userptr bind
+ * Description: Test %arg[1] with %arg[2] bind size
  * Test category: functionality test
  *
  * arg[1]:
@@ -1321,8 +1321,8 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 /**
  *
  * SUBTEST: %s-%ld
- * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
+ * Description: Test %arg[1] with %arg[2] bind size
  * Test category: functionality test
  *
  * arg[1]:
@@ -1336,8 +1336,8 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 /**
  *
  * SUBTEST: %s-%ld
- * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
+ * Description: Test %arg[1] with %arg[2] bind size
  * Test category: functionality test
  *
  * arg[1]:
@@ -1582,8 +1582,8 @@ static void *hammer_thread(void *tdata)
 
 /**
  * SUBTEST: munmap-style-unbind-%s
- * Description: Test munmap style unbind with %arg[1]
  * Functionality: unbind
+ * Description: Test munmap style unbind with %arg[1]
  * Test category: functionality test
  *
  * arg[1]:
@@ -1600,8 +1600,8 @@ static void *hammer_thread(void *tdata)
 
 /**
  * SUBTEST: munmap-style-unbind-%s
- * Description: Test munmap style unbind with %arg[1]
  * Functionality: unbind
+ * Description: Test munmap style unbind with %arg[1]
  * Test category: functionality test
  *
  * arg[1]:
@@ -1918,8 +1918,8 @@ try_again_after_invalidate:
 
 /**
  * SUBTEST: mmap-style-bind-%s
- * Description: Test mmap style unbind with %arg[1]
  * Functionality: bind
+ * Description: Test mmap style unbind with %arg[1]
  * Test category: functionality test
  *
  * arg[1]:
@@ -2175,9 +2175,8 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 
 /**
  * SUBTEST: bind-flag-invalid
- * Description:
- *	Ensure invalid bind flags are rejected.
  * Functionality: bind
+ * Description: Ensure invalid bind flags are rejected.
  * Test category: negative test
  */
 static void bind_flag_invalid(int fd)
@@ -2249,8 +2248,8 @@ static void bind_flag_invalid(int fd)
 
 /**
  * SUBTEST: invalid-flag-%s
- * Description:  function %arg[1] used in vm create IOCTL to make it fail
  * Functionality: ioctl_input_validation
+ * Description:  function %arg[1] used in vm create IOCTL to make it fail
  *
  * arg[1]:
  * @xe_vm_create_fault:  xe_vm_create_fault
@@ -2269,12 +2268,12 @@ static void invalid_flag(int fd, __u32 flags)
 
 /**
  * SUBTEST: invalid-extensions
- * Description: Check query with invalid extensions returns expected error code
  * Functionality: ioctl_input_validation
+ * Description: Check query with invalid extensions returns expected error code
  *
  * SUBTEST: vm-create-invalid-reserved
- * Description: Send query with invalid reserved value for vm_create ioctl
  * Functionality: ioctl_input_validation
+ * Description: Send query with invalid reserved value for vm_create ioctl
  */
 
 static void invalid_extensions(int fd)
@@ -2301,16 +2300,16 @@ static void vm_create_invalid_reserved(int fd)
 
 /**
  * SUBTEST: vm-destroy-invalid-reserved
- * Description: Send query with invalid reserved value for vm_destroy ioctl
  * Functionality: ioctl_input_validation
+ * Description: Send query with invalid reserved value for vm_destroy ioctl
  *
  * SUBTEST: invalid-pad
- * Description: Check query with invalid pad returns expected error code
  * Functionality: ioctl_input_validation
+ * Description: Check query with invalid pad returns expected error code
  *
  * SUBTEST: invalid-vm-id
- * Description: Check query with invalid vm_id returns expected error code
  * Functionality: ioctl_input_validation
+ * Description: Check query with invalid vm_id returns expected error code
  */
 
 static void vm_destroy_invalid_reserved(int fd)
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 0981e1962..48076ddeb 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -19,8 +19,8 @@
  * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: waitfence
- * Test category: functionality test
  * Description: Test waitfences functionality
+ * Test category: functionality test
  */
 
 uint64_t wait_fence = 0;
@@ -139,21 +139,20 @@ waitfence(int fd, enum waittype wt)
 }
 
 /**
- * TEST: Negative test for wait ufence ioctl
- * Category: Core
- * Mega feature: General Core features
- * Sub-category: Synchronization
- * Functionality: waitfence
- * Test category: negative test
- *
  * SUBTEST: invalid-flag
+ * Functionality: waitfence
  * Description: Check query with invalid flag returns expected error code
+ * Test category: negative test
  *
  * SUBTEST: invalid-ops
+ * Functionality: waitfence
  * Description: Check query with invalid ops returns expected error code
+ * Test category: negative test
  *
  * SUBTEST: exec_queue-reset-wait
+ * Functionality: waitfence
  * Description: Don’t wait till timeout on user fence when exec_queue reset is detected and return return proper error
+ * Test category: negative test
  */
 
 static void
-- 
2.34.1

