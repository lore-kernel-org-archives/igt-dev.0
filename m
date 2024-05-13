Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB86C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779410E658;
	Mon, 13 May 2024 10:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baXcyCrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6410E636
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597408; x=1747133408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ff2YEOn3uC8eg79GOEV3KSd84jt/ZKaJUyc17+33wgM=;
 b=baXcyCrOAWPRqAx9+EEHSKm1usHpc9tfXRVXEahuxzhZRnN6jP62zvjr
 /BqnQFXHevnLbxoFOU1TCZaw7nQUSLNFnB/3if5HLbXY3opE9RiCRiwNW
 vvpwNhSUL2EEFQVs/QkE2z0DNwJpRYDITvq4p0okZnHWP7AY00tpu4FfB
 e/o2WWeSCBKvs3/bsfKHDQ/G7h5PFaa4qFio225KurMLv6ldpzv1Ki2Ze
 1YVY3nsUqRiI6qMciyfaDhYaYaOI1NpcaD45aWKrWccd68hh2yMYkBSiL
 V16w00IhVDXOKcoI0xVYqavBpfWQd/EqC0XZtJ/bQCwdL0vf2vbaz7NXC Q==;
X-CSE-ConnectionGUID: b13fjkELSbiW8MQTXCh/Dw==
X-CSE-MsgGUID: MC1hsl/TTeqGhvFyNRKl+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11390904"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11390904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:08 -0700
X-CSE-ConnectionGUID: wEQ6phgzRqaX550FexQK8w==
X-CSE-MsgGUID: 3zMN50G6Q/mIAcEZo0RYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30138816"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:06 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 07/16] tests/intel: Add legacy i915 tests to General
 Core Mega feature
Date: Mon, 13 May 2024 10:48:37 +0000
Message-Id: <20240513104846.362332-8-katarzyna.piecielska@intel.com>
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

Add legacy and DRIVER_INTEL tests to 'General Core features' mega feature.
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
 tests/intel/api_intel_allocator.c      |   5 +-
 tests/intel/api_intel_bb.c             |   7 +-
 tests/intel/debugfs_test.c             |   5 +-
 tests/intel/drm_fdinfo.c               |   7 +-
 tests/intel/gem_basic.c                |   7 +-
 tests/intel/gem_busy.c                 |   3 +-
 tests/intel/gem_caching.c              |   7 +-
 tests/intel/gem_close_race.c           |   6 +-
 tests/intel/gem_create.c               |   5 +-
 tests/intel/gem_ctx_isolation.c        |   5 +-
 tests/intel/gem_ctx_param.c            |   5 +-
 tests/intel/gem_ctx_sseu.c             |   7 +-
 tests/intel/gem_eio.c                  |   5 +-
 tests/intel/gem_exec_capture.c         |   5 +-
 tests/intel/gem_exec_endless.c         |   1 +
 tests/intel/gem_flink_basic.c          |   7 +-
 tests/intel/gem_flink_race.c           |   7 +-
 tests/intel/gem_huc_copy.c             |   7 +-
 tests/intel/gem_reg_read.c             |   5 +-
 tests/intel/gem_reset_stats.c          |   5 +-
 tests/intel/gem_spin_batch.c           |   7 +-
 tests/intel/gem_sync.c                 |   7 +-
 tests/intel/gem_wait.c                 |   9 +-
 tests/intel/gem_workarounds.c          |   5 +-
 tests/intel/gen3_mixed_blits.c         |   1 +
 tests/intel/gen3_render_linear_blits.c |   1 +
 tests/intel/gen3_render_mixed_blits.c  |   1 +
 tests/intel/gen3_render_tiledx_blits.c |   1 +
 tests/intel/gen3_render_tiledy_blits.c |   1 +
 tests/intel/i915_getparams_basic.c     |   7 +-
 tests/intel/i915_hangman.c             |   7 +-
 tests/intel/i915_module_load.c         |   7 +-
 tests/intel/i915_pciid.c               |   7 +-
 tests/intel/i915_pm_freq_api.c         |   1 +
 tests/intel/i915_pm_freq_mult.c        |   2 +-
 tests/intel/i915_query.c               |   7 +-
 tests/intel/i915_selftest.c            | 175 +++++++++++++++----------
 tests/intel/sysfs_defaults.c           |   5 +-
 tests/intel/xe_huc_copy.c              |   3 +-
 39 files changed, 220 insertions(+), 145 deletions(-)

diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 60cd16de0..95b85baff 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -15,10 +15,11 @@
 
 /**
  * TEST: api intel allocator
- * Category: Infrastructure
- * Functionality: virtual address
  * Description: checking the virtual address ranges
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: IGT Lib
+ * Functionality: virtual address
  * Test category: GEM_Legacy
  * Feature: igt_core
  *
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 6e5c1293e..e53298695 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -43,11 +43,12 @@
 #include "intel_blt.h"
 /**
  * TEST: api intel bb
- * Category: Infrastructure
  * Description: checking dummy buffer creation & submission
- * Feature: igt_core
- * Functionality: dummy buffer creation & submission
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: IGT Lib
+ * Functionality: dummy buffer creation & submission
+ * Feature: igt_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: add-remove-objects
diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
index 1278b0ae1..f3eb43d68 100644
--- a/tests/intel/debugfs_test.c
+++ b/tests/intel/debugfs_test.c
@@ -32,10 +32,11 @@
 /**
  * TEST: debugfs test
  * Description: Read entries from debugfs, hwmon and sysfs paths.
- * Feature: core
  * Category: Infrastructure
- * Functionality: debugfs
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
  * Test category: uapi
  *
  * SUBTEST: basic-hwmon
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 61c66079e..effa01da4 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -36,10 +36,11 @@
 /**
  * TEST: drm fdinfo
  * Description: Test the i915 drm fdinfo data
- * Feature: client busyness
- * Functionality: Per client memory statistics
- * Sub-category: driver
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: driver
+ * Functionality: Per client memory statistics
+ * Feature: client_busyness
  *
  * SUBTEST: all-busy-check-all
  *
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index bd9401149..c1ff3478a 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -45,9 +45,10 @@
  * TEST: gem basic
  * Description: Tests basic gem_create and gem_close IOCTLs
  * Category: Infrastructure
- * Feature: gem_core
- * Functionality: driver handler
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: create/close IOCTLs
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-close
@@ -61,8 +62,8 @@
  *
  * SUBTEST: multigpu-create-close
  * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
+ * Functionality: IOCTLs & multiGPU
  * Feature: gem_core, multigpu
- * Test category: MultiGPU
  */
 
 IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 58720b4dc..b0a35d1c0 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -34,8 +34,9 @@
  * TEST: gem busy
  * Description: Basic check of busy-ioctl ABI.
  * Category: Desktop client
- * Functionality: semaphore
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: busy IOCTL
  * Test category: GEM_Legacy
  * Feature: cmd_submission
  *
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 475013739..111e32625 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -42,11 +42,12 @@
 #include "intel_blt.h"
 /**
  * TEST: gem caching
- * Category: Desktop client
  * Description: Test snoop consistency when touching partial cachelines.
- * Feature: caching feature
+ * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: coherency
- * Sub-category: Memory management
+ * Feature: caching
  * Test category: GEM_Legacy
  *
  * SUBTEST: read-writes
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index abfb27247..b89fd016d 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -75,13 +75,15 @@
  *
  * SUBTEST: multigpu-basic-process
  * Description: Basic workload submission on multi-GPU machine.
+ * Sub-category: MultiGPU
+ * Functionality: buffer management on MultiGPU
  * Feature: multigpu, synchronization
- * Test category: MultiGPU
  *
  * SUBTEST: multigpu-basic-threads
  * Description: Run basic-threads race on multi-GPU machine.
+ * Sub-category: MultiGPU
+ * Functionality: buffer management on MultiGPU
  * Feature: multigpu, synchronization
- * Test category: MultiGPU
  *
  * SUBTEST: process-exit
  * Description: Test try to race gem_close against submission of continuous workload.
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 1434a50a9..0e017fb9d 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -67,9 +67,10 @@
  * Description: Ensure that basic gem_create and gem_create_ext works and that
  *		invalid input combinations are rejected.
  * Category: Infrastructure
- * Feature: mapping
- * Functionality: buffer management
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: gem_create IOCTL
+ * Feature: mapping
  * Test category: GEM_Legacy
  *
  * SUBTEST: busy-create
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index e6b609e35..cd4aaee9c 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -29,9 +29,10 @@
 /**
  * TEST: gem ctx isolation
  * Category: Infrastructure
- * Feature: context
- * Functionality: priv/non-priv registers
+ * Mega feature: General Core features
  * Sub-category: Security
+ * Functionality: priv/non-priv registers
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: clean
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index e09216487..96998dc1e 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -34,9 +34,10 @@
  * TEST: gem ctx param
  * Description: Basic test for context set/get param input validation.
  * Category: Infrastructure
- * Feature: context feature
- * Functionality: context
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: get/set IOCTLs
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index d7cb730b1..88a0d9eca 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -47,10 +47,11 @@
 /**
  * TEST: gem ctx sseu
  * Description: Test context render powergating programming.
- * Feature: pm_sseu
- * Sub-category: uapi
  * Category: Desktop client
- * Functionality: sseu
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sseu api
+ * Feature: pm_sseu
  *
  * SUBTEST: engines
  *
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index c2fdff7c0..39100086d 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -56,10 +56,11 @@
 /**
  * TEST: gem eio
  * Description: Test that specific ioctls report a wedged GPU (EIO).
+ * Mega feature: General Core features
  * Category: Infrastructure
- * Feature: reset uapi
- * Functionality: sysfs reset
  * Sub-category: uapi
+ * Functionality: reset
+ * Feature: reset
  * Test category: GEM_Legacy
  *
  * SUBTEST: banned
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 0b428e541..d671c7278 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -35,10 +35,11 @@
 /**
  * TEST: gem exec capture
  * Description: Check that we capture the user specified objects on a hang
- * Feature: cmd_submission
  * Category: Server
- * Functionality: offline debugging
+ * Mega feature: General Core features
  * Sub-category: Debugging
+ * Functionality: offline debugging
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: capture
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index f0bf82b54..99c5403ec 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -33,6 +33,7 @@
 /**
  * TEST: gem exec endless
  * Category: Server
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: compute test
  * Test category: Compute
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 049c91be2..bb400a8bc 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -40,11 +40,12 @@
 #include "igt_types.h"
 /**
  * TEST: gem flink basic
- * Category: Desktop client
  * Description: Tests for flink - a way to export a gem object by name
- * Feature: xorg_dri2
- * Functionality: buffer management
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: flink
+ * Feature: xorg_dri2
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-flink
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 5675954bd..b75d0c9be 100644
--- a/tests/intel/gem_flink_race.c
+++ b/tests/intel/gem_flink_race.c
@@ -37,11 +37,12 @@
 #include "igt_stats.h"
 /**
  * TEST: gem flink race
- * Category: Desktop client
  * Description: Check for flink/open vs. gem close races.
- * Feature: xorg_dri2
- * Functionality: buffer management
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: flink
+ * Feature: xorg_dri2
  * Test category: GEM_Legacy
  *
  * SUBTEST: flink_close
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 541ed01f1..07810e696 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -38,10 +38,11 @@
 /**
  * TEST: gem huc copy
  * Description: A very simple workload for the HuC.
- * Feature: firmware feature
- * Sub-category: Firmware
  * Category: Desktop client
- * Functionality: huc copy
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
+ * Functionality: HUC
+ * Feature: huc
  *
  * SUBTEST: huc-copy
  * Description:
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 8b7bc9898..46ea06979 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -34,10 +34,11 @@
 
 /**
  * TEST: gem reg read
- * Feature: gem_core
- * Sub-category: uapi
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: ioctl
+ * Feature: gem_core
  *
  * SUBTEST: bad-register
  *
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index fdad7600c..df470fc6a 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -49,9 +49,10 @@
 #include "sw_sync.h"
 /**
  * TEST: gem reset stats
- * Sub-category: uapi
  * Category: Desktop client
- * Functionality: sysfs reset
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: reset
  *
  * SUBTEST: ban-blt
  *
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index a865e8549..e1522c260 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -27,11 +27,12 @@
 #include "igt.h"
 /**
  * TEST: gem spin batch
- * Test category: GEM_Legacy
  * Category: Infrastructure
- * Feature: context, igt_core
- * Functionality: dummy workload
+ * Mega feature: General Core features
  * Sub-category: IGT Lib
+ * Functionality: dummy workload
+ * Feature: context, igt_core
+ * Test category: GEM_Legacy
  *
  * SUBTEST: engines
  * SUBTEST: legacy
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 041ea5959..e10f49f16 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -34,11 +34,12 @@
 #include "igt_sysfs.h"
 /**
  * TEST: gem sync
- * Category: Infrastructure
  * Description: Basic check of ring<->ring write synchronisation.
- * Feature: synchronization feature
- * Functionality: semaphore
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: active
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index 149f1ce71..8128e2f12 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -33,11 +33,12 @@
 #include "igt_vgem.h"
 /**
  * TEST: gem wait
- * Category: Infrastructure
  * Description: Tests the GEM_WAIT ioctl
- * Feature: synchronization feature
- * Functionality: GEM_WAIT ioctl
- * Sub-category: uapi
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: await
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index dbde4cb45..d7fd8a8e0 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -35,9 +35,10 @@
 /**
  * TEST: gem workarounds
  * Category: Infrastructure
- * Feature: workaround
- * Functionality: context
+ * Mega feature: General Core features
  * Sub-category: Workarounds
+ * Functionality: workaround registers
+ * Feature: workarounds
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-read
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index 55bbb5d45..fbfd04705 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -51,6 +51,7 @@
 /**
  * TEST: gen3 mixed blits
  * Category: Obsolete
+ * Mega feature: General Core features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Feature: obsolete test
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 43a443e0a..34bf510f0 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -50,6 +50,7 @@
 /**
  * TEST: gen3 render linear blits
  * Category: Obsolete
+ * Mega feature: General Core features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Feature: obsolete test
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index c7336adfe..29db12d3d 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -51,6 +51,7 @@
 /**
  * TEST: gen3 render mixed blits
  * Category: Obsolete
+ * Mega feature: General Core features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Feature: obsolete test
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index f5818135b..578abdef0 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -51,6 +51,7 @@
 /**
  * TEST: gen3 render tiledx blits
  * Category: Obsolete
+ * Mega feature: General Core features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Feature: obsolete test
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index b40be62f6..d8ecc1626 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -51,6 +51,7 @@
 /**
  * TEST: gen3 render tiledy blits
  * Category: Obsolete
+ * Mega feature: General Core features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Feature: obsolete test
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index 3518a3b9f..507e9754f 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -32,11 +32,12 @@
 #include <i915_drm.h>
 /**
  * TEST: i915 getparams basic
- * Category: Infrastructure
  * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
- * Feature: gem_core
- * Functionality: device topology
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: device topology
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-eu-total
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 47bc4cdd2..4a03917dc 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -42,11 +42,12 @@
 #include "sw_sync.h"
 /**
  * TEST: i915 hangman
- * Category: Server
  * Description: Tests for hang detection and recovery
- * Feature: reset
- * Functionality: error handling
+ * Category: Server
+ * Mega feature: General Core features
  * Sub-category: Debugging
+ * Functionality: error handling
+ * Feature: reset
  * Test category: GEM_Legacy
  *
  * SUBTEST: detector
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 6cde9274e..4508b43de 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -25,11 +25,12 @@
 #include <sys/utsname.h>
 /**
  * TEST: i915 module load
- * Category: Infrastructure
  * Description: Tests the i915 module loading.
- * Feature: core
- * Functionality: driver handler
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: driver
+ * Functionality: driver handler
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: load
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index cc62b1947..a66bd5edd 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -30,11 +30,12 @@
 #include "intel_chipset.h"
 /**
  * TEST: i915 pciid
- * Category: Infrastructure
  * Description: Check that igt/i915 know about this PCI-ID
- * Feature: core
- * Functionality: device management
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: Core
+ * Functionality: device management
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index 7766be82d..bfcd02e25 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -12,6 +12,7 @@
  * TEST: i915 pm freq api
  * Description: Test SLPC freq API
  * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: slpc
  *
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 6d375c5aa..5ea3b05b7 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -14,7 +14,7 @@
  * TEST: i915 pm freq mult
  * Description: Tests for sysfs controls (or multipliers) for IP blocks which
  *		run at frequencies different from the main GT frequency.
- * Category: Firmware
+ * Category: Firmware building block
  * Mega feature: Power management
  * Sub-category: Power management tests
  * Functionality: freg multipliers
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 6da974fd1..a6e35804b 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -29,11 +29,12 @@
 #include <limits.h>
 /**
  * TEST: i915 query
- * Category: Infrastructure
  * Description: Testing the i915 query uAPI.
- * Feature: gem_core
- * Functionality: device topology
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: device topology
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: engine-info
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 7097622a9..7d6b4d4fd 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -29,15 +29,17 @@
  *
  * SUBTEST: live
  * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: Selftest subcategory
  * Functionality: live selftest
  * Feature: gem_core
  *
  * SUBTEST: live@active
  * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
  * Functionality: semaphore
  * Test category: i915
- * Sub-category: Synchronization
  *
  * SUBTEST: live@blt
  * Description: Blitter validation
@@ -48,11 +50,12 @@
  * Test category: i915 / HW
  *
  * SUBTEST: live@client
- * Category: Selftest
  * Description: Internal API over blitter
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: blitter api
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: live@coherency
  * Description: Cache management
@@ -64,9 +67,10 @@
  *
  * SUBTEST: live@debugger
  * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Debugging
  * Functionality: device management
  * Test category: debugger
- * Sub-category: Debugging
  *
  * SUBTEST: live@display
  * Category: Selftest
@@ -152,13 +156,12 @@
  * Test category: HW
  *
  * SUBTEST: live@gt_heartbeat
- * Category: Selftest
  * Description: Stall detection interface validation
+ * Category: Selftest
  * Mega feature: General Core features
  * Sub-category: Reset tests
  * Functionality: heartbeat
  * Test category: i915
- * Sub-category: Reset
  *
  * SUBTEST: live@gt_lrc
  * Description: HW isolation and HW context validation
@@ -169,11 +172,12 @@
  * Test category: HW
  *
  * SUBTEST: live@gt_mocs
- * Category: Selftest
  * Description: Verification of mocs registers
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Mocs
  * Functionality: mocs registers
  * Test category: i915 / HW
- * Sub-category: Mocs
  *
  * SUBTEST: live@gt_pm
  * Description: Basic i915 driver module selftests
@@ -183,11 +187,12 @@
  * Functionality: rps, rc6
  *
  * SUBTEST: live@gt_timelines
- * Category: Selftest
  * Description: semaphore tracking
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
  * Functionality: semaphore
  * Test category: i915
- * Sub-category: Synchronization
  *
  * SUBTEST: live@gt_tlb
  * Category: Selftest
@@ -205,43 +210,49 @@
  * Test category: i915
  *
  * SUBTEST: live@gtt_l4wa
- * Category: Selftest
  * Description: Check the L4WA is enabled when it was required
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Workarounds
  * Functionality: L4WA
  * Test category: i915
- * Sub-category: Workarounds
  *
  * SUBTEST: live@guc
  * Category: Selftest
- * Feature: firmware feature
- * Sub-category: Firmware
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_doorbells
  * Category: Selftest
- * Feature: firmware feature
- * Sub-category: Firmware
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_hang
  * Category: Selftest
- * Feature: firmware feature
- * Sub-category: Firmware
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_multi_lrc
  * Category: Selftest
- * Feature: firmware feature
- * Sub-category: Firmware
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@hangcheck
- * Category: Selftest
  * Description: reset handling after stall detection
+ * Category: Selftest
+ * Mega feature: General Core features
  * Functionality: hangcheck
  * Test category: i915
  * Sub-category: Reset tests
@@ -295,18 +306,20 @@
  * Test category: i915
  *
  * SUBTEST: live@obj_lock
- * Category: Selftest
  * Description: Validation of per-object locking patterns
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Core
  * Functionality: per-object locking
  * Test category: i915
- * Sub-category: Core
  *
  * SUBTEST: live@objects
- * Category: Selftest
  * Description: User object allocation and isolation checks
- * Functionality: buffer management
- * Test category: i915
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: Core
+ * Functionality: objects
+ * Test category: i915
  *
  * SUBTEST: live@perf
  * Category: Selftest
@@ -316,10 +329,11 @@
  * Sub-category: Performance
  *
  * SUBTEST: live@remote_tiles
- * Category: Selftest
  * Description: Tile meta data validation
- * Functionality: meta data
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: MultiTile
+ * Functionality: meta data
  *
  * SUBTEST: live@requests
  * Description: Validation of internal i915 command submission interface
@@ -340,6 +354,7 @@
  * SUBTEST: live@sanitycheck
  * Description: Checks the selftest infrastructure itself
  * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: Core
  * Functionality: sanitycheck
  * Test category: i915
@@ -351,11 +366,12 @@
  * Functionality: scheduler
  *
  * SUBTEST: live@semaphores
- * Category: Selftest
  * Description: GuC semaphore management
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
  * Functionality: semaphore
  * Test category: HW
- * Sub-category: Synchronization
  *
  * SUBTEST: live@slpc
  * Description: Basic i915 driver module selftests
@@ -390,14 +406,17 @@
  * Test category: i915 / HW
  *
  * SUBTEST: live@workarounds
- * Category: Selftest
  * Description: Check workarounds persist or are reapplied after resets and other power management events
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Workarounds
  * Functionality: driver workarounds
  * Test category: HW
- * Sub-category: Workarounds
  *
  * SUBTEST: mock
  * Category: Selftest
+ * Mega feature: General Core features
+ * Feature: gem_core
  * Sub-category: Selftest subcategory
  * Functionality: mock selftest
  * Feature: gem_core
@@ -411,123 +430,140 @@
  * Test category: DRM
  *
  * SUBTEST: mock@contexts
- * Category: Selftest
  * Description: GEM context internal API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: context
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@dmabuf
- * Category: Selftest
  * Description: dma-buf (buffer management) API checks
- * Functionality: buffer management
- * Test category: DRM
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: dmabuf test
+ * Test category: DRM
  *
  * SUBTEST: mock@engine
- * Category: Selftest
  * Description: Engine topology API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: engine topology
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@evict
- * Category: Selftest
  * Description: GTT eviction API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: gtt eviction
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@fence
- * Category: Selftest
  * Description: semaphore API checks
- * Functionality: semaphore
- * Test category: i915
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: semaphore api
+ * Test category: i915
  *
  * SUBTEST: mock@gtt
- * Category: Selftest
  * Description: Virtual address management API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: gtt
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@hugepages
- * Category: Selftest
  * Description: Hugepage API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: huge page
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@memory_region
- * Category: Selftest
  * Description: Memory region API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: memory region
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@objects
- * Category: Selftest
  * Description: Buffer object API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: buffer object
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@phys
- * Category: Selftest
  * Description: legacy physical object API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: physical object
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@requests
- * Category: Selftest
  * Description: Internal command submission API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: requests
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@ring
- * Category: Selftest
  * Description: Ringbuffer management API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: ringbuffer
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@sanitycheck
  * Description: Selftest for the selftest
  * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: Core
  * Functionality: sanitycheck
  * Test category: i915
  *
  * SUBTEST: mock@scatterlist
- * Category: Selftest
  * Description: Scatterlist API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: scatterlist
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@shmem
- * Category: Selftest
  * Description: SHM utils API checks
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: shm
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@syncmap
- * Category: Selftest
  * Description: API checks for the contracted radixtree
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: contracted radixtree
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@timelines
- * Category: Selftest
  * Description: API checks for semaphore tracking
- * Functionality: semaphore
- * Test category: i915
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: semaphore api
+ * Test category: i915
  *
  * SUBTEST: mock@tlb
  * Category: Selftest
@@ -545,11 +581,12 @@
  * Feature: forcewake
  *
  * SUBTEST: mock@vma
- * Category: Selftest
  * Description: API checks for virtual address management
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: uapi
  * Functionality: virtual address
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: perf
  * Category: Selftest
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index 0be8232d5..5b37e038d 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -36,9 +36,10 @@
 /**
  * TEST: sysfs defaults
  * Category: Infrastructure
- * Feature: gem_core
- * Functionality: sysfs
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: sysfs
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: readonly
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 339cf6e5f..692278cb5 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Test HuC copy firmware.
  * Category: Firmware building block
- * Sub-category: Firmware
+ * Mega feature: General Core features
+ * Sub-category: Firmware tests
  * Functionality: huc copy
  * Test category: functionality test
  * TODO: make the test more generic, getting rid of the PCI ID list
-- 
2.34.1

