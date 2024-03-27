Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FFC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B46810FCE0;
	Wed, 27 Mar 2024 12:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahqLuaOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB6310FCDB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542526; x=1743078526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M0+5oSfY7Qmy99U3rOz/O+FDmY6DwQWKmHpjg64Vr7E=;
 b=ahqLuaOwjPTaxtP6irMHoL35Y8/r5yDS5dJ9jmKqiBShXkOgY+Tbaji8
 FOjCmACSm4j4RbcN1wu5/zD5i3X6enD02TzniNhek69yjoWYIS8e7IM+0
 B0A8O7BN+0ofbmUYprdyzxgBZ01wkO7WrSqV/qocf4KAUz9ZzKWSYL0a9
 UDXv4PfFw6z/nFZbQ/cEASVCwW2TGRmYk/kqgitO0B8ITq6C6Ys/nHebU
 HGbc2R3qM1d5fLc/Gla2V0+Yd7dPyiN5mON0xZOBUS84jz7EIUGkIzAYz
 xg+sL1TpAKxiK1EzsrXEtsNeQcBSlT5QwgH9xsFN876r1jEOAg9syBmqo A==;
X-CSE-ConnectionGUID: S3sn6y/8Rn+kKmBnXB2WtA==
X-CSE-MsgGUID: OzTQ3u1nR/GupPpikBF5dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6771291"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6771291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16118507"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:43 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 07/16] tests/intel: Introduce General i915 mega feature
Date: Wed, 27 Mar 2024 12:27:22 +0000
Message-Id: <20240327122731.2104614-8-katarzyna.piecielska@intel.com>
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

Add tests to 'General i915 features' mega feature.
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
 tests/intel/gem_basic.c                |   5 +-
 tests/intel/gem_busy.c                 |   3 +-
 tests/intel/gem_caching.c              |   7 +-
 tests/intel/gem_create.c               |   5 +-
 tests/intel/gem_ctx_isolation.c        |   5 +-
 tests/intel/gem_ctx_param.c            |   5 +-
 tests/intel/gem_ctx_sseu.c             |   5 +-
 tests/intel/gem_eio.c                  |   5 +-
 tests/intel/gem_exec_capture.c         |   5 +-
 tests/intel/gem_flink_basic.c          |   7 +-
 tests/intel/gem_flink_race.c           |   7 +-
 tests/intel/gem_huc_copy.c             |   7 +-
 tests/intel/gem_reg_read.c             |   5 +-
 tests/intel/gem_reset_stats.c          |   5 +-
 tests/intel/gem_spin_batch.c           |   7 +-
 tests/intel/gem_sync.c                 |   7 +-
 tests/intel/gem_wait.c                 |   9 +-
 tests/intel/gem_workarounds.c          |   5 +-
 tests/intel/gen3_mixed_blits.c         |   5 +-
 tests/intel/gen3_render_linear_blits.c |   5 +-
 tests/intel/gen3_render_mixed_blits.c  |   5 +-
 tests/intel/gen3_render_tiledx_blits.c |   5 +-
 tests/intel/gen3_render_tiledy_blits.c |   5 +-
 tests/intel/i915_getparams_basic.c     |   7 +-
 tests/intel/i915_hangman.c             |   7 +-
 tests/intel/i915_module_load.c         |   7 +-
 tests/intel/i915_pciid.c               |   7 +-
 tests/intel/i915_pm_freq_api.c         |   1 +
 tests/intel/i915_query.c               |   7 +-
 tests/intel/i915_selftest.c            | 174 +++++++++++++++----------
 tests/intel/prime_mmap_kms.c           |   5 +-
 tests/intel/sysfs_defaults.c           |   5 +-
 36 files changed, 223 insertions(+), 150 deletions(-)

diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 60cd16de0..3bffed16a 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -15,10 +15,11 @@
 
 /**
  * TEST: api intel allocator
- * Category: Infrastructure
- * Functionality: virtual address
  * Description: checking the virtual address ranges
+ * Category: Infrastructure
+ * Mega feature: General i915 features
  * Sub-category: IGT Lib
+ * Functionality: virtual address
  * Test category: GEM_Legacy
  * Feature: igt_core
  *
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 6e5c1293e..cddb9ed6f 100644
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
+ * Mega feature: General i915 features
  * Sub-category: IGT Lib
+ * Functionality: dummy buffer creation & submission
+ * Feature: igt_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: add-remove-objects
diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
index 1278b0ae1..7036e8853 100644
--- a/tests/intel/debugfs_test.c
+++ b/tests/intel/debugfs_test.c
@@ -32,10 +32,11 @@
 /**
  * TEST: debugfs test
  * Description: Read entries from debugfs, hwmon and sysfs paths.
- * Feature: core
  * Category: Infrastructure
- * Functionality: debugfs
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
  * Test category: uapi
  *
  * SUBTEST: basic-hwmon
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 61c66079e..45996dae4 100644
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
+ * Mega feature: General i915 features
+ * Sub-category: driver
+ * Functionality: Per client memory statistics
+ * Feature: client_busyness
  *
  * SUBTEST: all-busy-check-all
  *
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index bd9401149..1a13138df 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -45,9 +45,10 @@
  * TEST: gem basic
  * Description: Tests basic gem_create and gem_close IOCTLs
  * Category: Infrastructure
- * Feature: gem_core
- * Functionality: driver handler
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: driver handler
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-close
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 58720b4dc..043e734e6 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -34,8 +34,9 @@
  * TEST: gem busy
  * Description: Basic check of busy-ioctl ABI.
  * Category: Desktop client
- * Functionality: semaphore
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: semaphore
  * Test category: GEM_Legacy
  * Feature: cmd_submission
  *
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 475013739..a61d88774 100644
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
+ * Mega feature: General i915 features
+ * Sub-category: Caching
  * Functionality: coherency
- * Sub-category: Memory management
+ * Feature: caching
  * Test category: GEM_Legacy
  *
  * SUBTEST: read-writes
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 1434a50a9..69e72e848 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -67,9 +67,10 @@
  * Description: Ensure that basic gem_create and gem_create_ext works and that
  *		invalid input combinations are rejected.
  * Category: Infrastructure
- * Feature: mapping
- * Functionality: buffer management
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: buffer management
+ * Feature: mapping
  * Test category: GEM_Legacy
  *
  * SUBTEST: busy-create
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index e6b609e35..97656a1bc 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -29,9 +29,10 @@
 /**
  * TEST: gem ctx isolation
  * Category: Infrastructure
- * Feature: context
- * Functionality: priv/non-priv registers
+ * Mega feature: General i915 features
  * Sub-category: Security
+ * Functionality: priv/non-priv registers
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: clean
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index e09216487..623e59d8d 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -34,9 +34,10 @@
  * TEST: gem ctx param
  * Description: Basic test for context set/get param input validation.
  * Category: Infrastructure
- * Feature: context feature
- * Functionality: context
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index d7cb730b1..3b63774d4 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -47,10 +47,11 @@
 /**
  * TEST: gem ctx sseu
  * Description: Test context render powergating programming.
- * Feature: pm_sseu
- * Sub-category: uapi
  * Category: Desktop client
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: sseu
+ * Feature: pm_sseu
  *
  * SUBTEST: engines
  *
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index c2fdff7c0..0977cd496 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -56,10 +56,11 @@
 /**
  * TEST: gem eio
  * Description: Test that specific ioctls report a wedged GPU (EIO).
+ * Mega feature: General i915 features
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
index 57b178f3e..781ad700b 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -35,10 +35,11 @@
 /**
  * TEST: gem exec capture
  * Description: Check that we capture the user specified objects on a hang
- * Feature: cmd_submission
  * Category: Server
- * Functionality: offline debugging
+ * Mega feature: General i915 features
  * Sub-category: Debugging
+ * Functionality: offline debugging
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: capture
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 049c91be2..0cf7f75c5 100644
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
+ * Mega feature: General i915 features
  * Sub-category: DRM
+ * Functionality: buffer management
+ * Feature: xorg_dri2
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-flink
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 5675954bd..dfb2047e0 100644
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
+ * Mega feature: General i915 features
  * Sub-category: DRM
+ * Functionality: buffer management
+ * Feature: xorg_dri2
  * Test category: GEM_Legacy
  *
  * SUBTEST: flink_close
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 541ed01f1..e441571fb 100644
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
+ * Mega feature: General i915 features
+ * Sub-category: Firmware
+ * Functionality: HUC
+ * Feature: huc
  *
  * SUBTEST: huc-copy
  * Description:
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 8b7bc9898..772d7fa1d 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -34,10 +34,11 @@
 
 /**
  * TEST: gem reg read
- * Feature: gem_core
- * Sub-category: uapi
  * Category: Desktop client
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: ioctl
+ * Feature: gem_core
  *
  * SUBTEST: bad-register
  *
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index fdad7600c..1b0908218 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -49,9 +49,10 @@
 #include "sw_sync.h"
 /**
  * TEST: gem reset stats
- * Sub-category: uapi
  * Category: Desktop client
- * Functionality: sysfs reset
+ * Mega feature: General i915 features
+ * Sub-category: uapi
+ * Functionality: reset
  *
  * SUBTEST: ban-blt
  *
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index a865e8549..1d4ada020 100644
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
+ * Mega feature: General i915 features
  * Sub-category: IGT Lib
+ * Functionality: dummy workload
+ * Feature: context, igt_core
+ * Test category: GEM_Legacy
  *
  * SUBTEST: engines
  * SUBTEST: legacy
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 80119e30b..1a37ad954 100644
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
+ * Mega feature: General i915 features
  * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: active
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index fa6eb9f77..400ebe841 100644
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
+ * Mega feature: General i915 features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: await
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index dbde4cb45..7f4d641df 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -35,9 +35,10 @@
 /**
  * TEST: gem workarounds
  * Category: Infrastructure
- * Feature: workaround
- * Functionality: context
+ * Mega feature: General i915 features
  * Sub-category: Workarounds
+ * Functionality: context
+ * Feature: workarounds
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-read
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index ea65579b2..7ce998f59 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -50,10 +50,11 @@
 #include "igt.h"
 /**
  * TEST: gen3 mixed blits
- * Feature: obsolete
+ * Category: Obsolete
+ * Mega feature: General i915 features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index e370c4406..fc4c1cc2d 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -49,10 +49,11 @@
 #include "igt.h"
 /**
  * TEST: gen3 render linear blits
- * Feature: obsolete
+ * Category: Obsolete
+ * Mega feature: General i915 features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index 14fae3e7b..541a44244 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -50,10 +50,11 @@
 #include "igt.h"
 /**
  * TEST: gen3 render mixed blits
- * Feature: obsolete
+ * Category: Obsolete
+ * Mega feature: General i915 features
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
- * Category: Obsolete
+ * Feature: obsolete
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index a2748f272..c5ab6268d 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -50,10 +50,11 @@
 #include "igt.h"
 /**
  * TEST: gen3 render tiledx blits
- * Feature: obsolete
- * Sub-category: Obsolete_gen3
  * Category: Obsolete
+ * Mega feature: General i915 features
+ * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
+ * Feature: obsolete
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index eb63aaa82..5152ea6a3 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -50,10 +50,11 @@
 #include "igt.h"
 /**
  * TEST: gen3 render tiledy blits
- * Feature: obsolete
- * Sub-category: Obsolete_gen3
  * Category: Obsolete
+ * Mega feature: General i915 features
+ * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
+ * Feature: obsolete
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index 3518a3b9f..f5056af2c 100644
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
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: device topology
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-eu-total
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 47bc4cdd2..c703b1c4c 100644
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
+ * Mega feature: General i915 features
  * Sub-category: Debugging
+ * Functionality: error handling
+ * Feature: reset
  * Test category: GEM_Legacy
  *
  * SUBTEST: detector
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 6cde9274e..760eb8916 100644
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
+ * Mega feature: General i915 features
  * Sub-category: driver
+ * Functionality: driver handler
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: load
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index cc62b1947..f05859e4e 100644
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
+ * Mega feature: General i915 features
  * Sub-category: Core
+ * Functionality: device management
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index 7766be82d..8ab6ec235 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -12,6 +12,7 @@
  * TEST: i915 pm freq api
  * Description: Test SLPC freq API
  * Category: Infrastructure
+ * Mega feature: General i915 features
  * Sub-category: uapi
  * Functionality: slpc
  *
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 6da974fd1..980a748fa 100644
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
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: device topology
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: engine-info
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 675dad574..517151e48 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -28,16 +28,18 @@
  * Description: Basic unit tests for i915.ko
  *
  * SUBTEST: live
- * Feature: gem_core
- * Sub-category: Selftest
  * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Selftest
  * Functionality: live selftest
+ * Feature: gem_core
  *
  * SUBTEST: live@active
  * Category: Selftest
+ * Mega feature: General i915 features
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
+ * Mega feature: General i915 features
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
+ * Mega feature: General i915 features
+ * Sub-category: Debugging
  * Functionality: device management
  * Test category: debugger
- * Sub-category: Debugging
  *
  * SUBTEST: live@display
  * Category: Selftest
@@ -152,11 +156,12 @@
  * Test category: HW
  *
  * SUBTEST: live@gt_heartbeat
- * Category: Selftest
  * Description: Stall detection interface validation
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Reset
  * Functionality: heartbeat
  * Test category: i915
- * Sub-category: Reset
  *
  * SUBTEST: live@gt_lrc
  * Description: HW isolation and HW context validation
@@ -167,11 +172,12 @@
  * Test category: HW
  *
  * SUBTEST: live@gt_mocs
- * Category: Selftest
  * Description: Verification of mocs registers
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Mocs
  * Functionality: mocs registers
  * Test category: i915 / HW
- * Sub-category: Mocs
  *
  * SUBTEST: live@gt_pm
  * Description: Basic i915 driver module selftests
@@ -181,11 +187,12 @@
  * Functionality: rps, rc6
  *
  * SUBTEST: live@gt_timelines
- * Category: Selftest
  * Description: semaphore tracking
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Synchronization
  * Functionality: semaphore
  * Test category: i915
- * Sub-category: Synchronization
  *
  * SUBTEST: live@gt_tlb
  * Category: Selftest
@@ -203,38 +210,43 @@
  * Test category: i915
  *
  * SUBTEST: live@gtt_l4wa
- * Category: Selftest
  * Description: Check the L4WA is enabled when it was required
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Workarounds
  * Functionality: L4WA
  * Test category: i915
- * Sub-category: Workarounds
  *
  * SUBTEST: live@guc
  * Category: Selftest
- * Feature: firmware feature
+ * Mega feature: General i915 features
  * Sub-category: Firmware
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_doorbells
  * Category: Selftest
- * Feature: firmware feature
+ * Mega feature: General i915 features
  * Sub-category: Firmware
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_hang
  * Category: Selftest
- * Feature: firmware feature
+ * Mega feature: General i915 features
  * Sub-category: Firmware
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@guc_multi_lrc
  * Category: Selftest
- * Feature: firmware feature
+ * Mega feature: General i915 features
  * Sub-category: Firmware
  * Functionality: GUC
+ * Feature: GuC
  * Test category: GuC
  *
  * SUBTEST: live@hangcheck
@@ -291,18 +303,20 @@
  * Test category: i915
  *
  * SUBTEST: live@obj_lock
- * Category: Selftest
  * Description: Validation of per-object locking patterns
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Core
  * Functionality: per-object locking
  * Test category: i915
- * Sub-category: Core
  *
  * SUBTEST: live@objects
- * Category: Selftest
  * Description: User object allocation and isolation checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Core
  * Functionality: buffer management
  * Test category: i915
- * Sub-category: Core
  *
  * SUBTEST: live@perf
  * Category: Selftest
@@ -312,10 +326,11 @@
  * Sub-category: Performance
  *
  * SUBTEST: live@remote_tiles
- * Category: Selftest
  * Description: Tile meta data validation
- * Functionality: meta data
+ * Category: Selftest
+ * Mega feature: General i915 features
  * Sub-category: MultiTile
+ * Functionality: meta data
  *
  * SUBTEST: live@requests
  * Description: Validation of internal i915 command submission interface
@@ -326,18 +341,20 @@
  * Test category: i915
  *
  * SUBTEST: live@reset
- * Category: Selftest
  * Description: engine/GT resets
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Reset
  * Functionality: engine/GT reset
  * Test category: HW
- * Sub-category: Reset
  *
  * SUBTEST: live@sanitycheck
- * Category: Selftest
  * Description: Checks the selftest infrastructure itself
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Core
  * Functionality: selftest
  * Test category: i915
- * Sub-category: Core
  *
  * SUBTEST: live@scheduler
  * Category: Selftest
@@ -346,11 +363,12 @@
  * Functionality: scheduler
  *
  * SUBTEST: live@semaphores
- * Category: Selftest
  * Description: GuC semaphore management
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Synchronization
  * Functionality: semaphore
  * Test category: HW
- * Sub-category: Synchronization
  *
  * SUBTEST: live@slpc
  * Description: Basic i915 driver module selftests
@@ -385,14 +403,16 @@
  * Test category: i915 / HW
  *
  * SUBTEST: live@workarounds
- * Category: Selftest
  * Description: Check workarounds persist or are reapplied after resets and other power management events
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Workarounds
  * Functionality: driver workarounds
  * Test category: HW
- * Sub-category: Workarounds
  *
  * SUBTEST: mock
  * Category: Selftest
+ * Mega feature: General i915 features
  * Feature: gem_core
  * Sub-category: Selftest
  * Functionality: mock selftest
@@ -406,123 +426,140 @@
  * Test category: DRM
  *
  * SUBTEST: mock@contexts
- * Category: Selftest
  * Description: GEM context internal API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: context
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@dmabuf
- * Category: Selftest
  * Description: dma-buf (buffer management) API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: buffer management
  * Test category: DRM
- * Sub-category: uapi
  *
  * SUBTEST: mock@engine
- * Category: Selftest
  * Description: Engine topology API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: engine topology
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@evict
- * Category: Selftest
  * Description: GTT eviction API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: gtt eviction
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@fence
- * Category: Selftest
  * Description: semaphore API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: semaphore
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@gtt
- * Category: Selftest
  * Description: Virtual address management API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: gtt
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@hugepages
- * Category: Selftest
  * Description: Hugepage API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: huge page
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@memory_region
- * Category: Selftest
  * Description: Memory region API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: memory region
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@objects
- * Category: Selftest
  * Description: Buffer object API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: buffer object
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@phys
- * Category: Selftest
  * Description: legacy physical object API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: physical object
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@requests
- * Category: Selftest
  * Description: Internal command submission API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: requests
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@ring
- * Category: Selftest
  * Description: Ringbuffer management API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: ringbuffer
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@sanitycheck
- * Category: Selftest
  * Description: Selftest for the selftest
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: Core
  * Functionality: selftest
  * Test category: i915
- * Sub-category: Core
  *
  * SUBTEST: mock@scatterlist
- * Category: Selftest
  * Description: Scatterlist API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: scatterlist
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@shmem
- * Category: Selftest
  * Description: SHM utils API checks
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: shm
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@syncmap
- * Category: Selftest
  * Description: API checks for the contracted radixtree
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: contracted radixtree
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@timelines
- * Category: Selftest
  * Description: API checks for semaphore tracking
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: semaphore
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: mock@tlb
  * Category: Selftest
@@ -540,11 +577,12 @@
  * Feature: forcewake
  *
  * SUBTEST: mock@vma
- * Category: Selftest
  * Description: API checks for virtual address management
+ * Category: Selftest
+ * Mega feature: General i915 features
+ * Sub-category: uapi
  * Functionality: vma
  * Test category: i915
- * Sub-category: uapi
  *
  * SUBTEST: perf
  * Category: Selftest
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 35d1eedde..3ef72c38f 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -40,9 +40,10 @@ IGT_TEST_DESCRIPTION(
 /**
  * TEST: prime mmap kms
  * Category: Infrastructure
- * Feature: prime
- * Functionality: memory management
  * Sub-category: DRM
+ * Mega feature: General i915 features
+ * Functionality: memory management
+ * Feature: prime
  * Test category: GEM_Legacy
  *
  * SUBTEST: buffer-sharing
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index 0be8232d5..e9184ea4a 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -36,9 +36,10 @@
 /**
  * TEST: sysfs defaults
  * Category: Infrastructure
- * Feature: gem_core
- * Functionality: sysfs
+ * Mega feature: General i915 features
  * Sub-category: uapi
+ * Functionality: sysfs
+ * Feature: gem_core
  * Test category: GEM_Legacy
  *
  * SUBTEST: readonly
-- 
2.34.1

