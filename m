Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEF3C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 14:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDF010E6AC;
	Tue, 18 Jun 2024 14:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsTToOsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EB210E6AC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718720832; x=1750256832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ipai4t+eqyhfIw5CVb63vKOzDLjLVb6S6i3wv8xM5IM=;
 b=PsTToOsLJ/oEZt4ObMF3DsNTDBvUXeo9MhLiVgEnp+IbY5KKKhZUzXCL
 KXMvJid09kL2SBXDfqd52tuV1VuQKQjUt9YCXGmOtyUgUvItWBYYQ/4OD
 e+abZ4eBaOyAG47O69x13RUQn7MqYBWjax+A9yuI126Sh3TjuXvuAZMOH
 FX2y7T9FaCTH9OHJrcdmbMh85vDb9WalolE0FdPy4m3Ja1lBmYfkwEO8g
 GAoR/odnRgixxivkyegSaRwR41c4B5KrE1yV/K0fww0AY6mF76pajVG2S
 S8SvcJN0HpuK/eQDD3ZwKq18EbZQNz35ayBbcyl0GlfMXdo8CyGHldgzQ w==;
X-CSE-ConnectionGUID: GWHts80uTQSX3Dc+Ugghjw==
X-CSE-MsgGUID: bYPu7Z+aTTKBeaGySvexCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33073920"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33073920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:12 -0700
X-CSE-ConnectionGUID: JZddLhUGQfagI4L63sm6FA==
X-CSE-MsgGUID: ecLQaUMfRT62zrZemn4vBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41676285"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:10 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 1/4] tests: Unify GEM_Legacy 'Test category' in Core
 tests for i915
Date: Tue, 18 Jun 2024 14:26:47 +0000
Message-Id: <20240618142650.1991834-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
References: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
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

Change 'Test category' documentation field from GEM_Legacy to one of
values: functionality test, stress test, negative test. Test category
should reflect main test purpose:
 * functionality test - all testing for driver, HW or uapi that are not
   a stress or negative testing
 * stress test - stress cases to reveal corner cases, e.g. huge memory
   usage, many parallel operations, races etc.
 * negative test - check that invalid behaviors will not break anything

This approach will align i915 docmentation to Xe and KMS tests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Peter Senna Tschudin <me@petersenna.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/core_auth.c                         | 2 +-
 tests/core_getclient.c                    | 2 +-
 tests/core_getstats.c                     | 2 +-
 tests/core_getversion.c                   | 2 +-
 tests/core_setmaster.c                    | 2 +-
 tests/core_setmaster_vs_auth.c            | 2 +-
 tests/device_reset.c                      | 2 +-
 tests/dmabuf.c                            | 2 +-
 tests/drm_mm.c                            | 2 +-
 tests/intel/api_intel_allocator.c         | 2 +-
 tests/intel/api_intel_bb.c                | 2 +-
 tests/intel/gem_barrier_race.c            | 2 +-
 tests/intel/gem_basic.c                   | 3 ++-
 tests/intel/gem_blits.c                   | 2 +-
 tests/intel/gem_busy.c                    | 2 +-
 tests/intel/gem_caching.c                 | 2 +-
 tests/intel/gem_close.c                   | 2 +-
 tests/intel/gem_close_race.c              | 2 +-
 tests/intel/gem_create.c                  | 2 +-
 tests/intel/gem_cs_tlb.c                  | 2 +-
 tests/intel/gem_ctx_bad_destroy.c         | 2 +-
 tests/intel/gem_ctx_create.c              | 2 +-
 tests/intel/gem_ctx_engines.c             | 2 +-
 tests/intel/gem_ctx_exec.c                | 2 +-
 tests/intel/gem_ctx_freq.c                | 2 +-
 tests/intel/gem_ctx_isolation.c           | 2 +-
 tests/intel/gem_ctx_param.c               | 5 ++++-
 tests/intel/gem_ctx_persistence.c         | 2 +-
 tests/intel/gem_ctx_shared.c              | 4 ++--
 tests/intel/gem_eio.c                     | 2 +-
 tests/intel/gem_exec_alignment.c          | 2 +-
 tests/intel/gem_exec_async.c              | 2 +-
 tests/intel/gem_exec_await.c              | 2 +-
 tests/intel/gem_exec_basic.c              | 2 +-
 tests/intel/gem_exec_big.c                | 2 +-
 tests/intel/gem_exec_capture.c            | 2 +-
 tests/intel/gem_exec_create.c             | 2 +-
 tests/intel/gem_exec_fence.c              | 2 +-
 tests/intel/gem_exec_gttfill.c            | 2 +-
 tests/intel/gem_exec_nop.c                | 2 +-
 tests/intel/gem_exec_parallel.c           | 2 +-
 tests/intel/gem_exec_params.c             | 2 +-
 tests/intel/gem_exec_schedule.c           | 2 +-
 tests/intel/gem_exec_store.c              | 2 +-
 tests/intel/gem_exec_whisper.c            | 2 +-
 tests/intel/gem_exercise_blt.c            | 2 +-
 tests/intel/gem_flink_basic.c             | 2 +-
 tests/intel/gem_flink_race.c              | 2 +-
 tests/intel/gem_gpgpu_fill.c              | 2 +-
 tests/intel/gem_linear_blits.c            | 2 +-
 tests/intel/gem_lmem_evict.c              | 2 +-
 tests/intel/gem_lmem_swapping.c           | 2 +-
 tests/intel/gem_madvise.c                 | 2 +-
 tests/intel/gem_mmap_offset.c             | 8 +++++++-
 tests/intel/gem_pipe_control_store_loop.c | 2 +-
 tests/intel/gem_ppgtt.c                   | 2 +-
 tests/intel/gem_request_retire.c          | 2 +-
 tests/intel/gem_ringfill.c                | 2 +-
 tests/intel/gem_shrink.c                  | 2 +-
 tests/intel/gem_softpin.c                 | 2 +-
 tests/intel/gem_spin_batch.c              | 2 +-
 tests/intel/gem_sync.c                    | 2 +-
 tests/intel/gem_unref_active_buffers.c    | 2 +-
 tests/intel/gem_userptr_blits.c           | 2 +-
 tests/intel/gem_vm_create.c               | 2 +-
 tests/intel/gem_wait.c                    | 2 +-
 tests/intel/gem_workarounds.c             | 2 +-
 tests/intel/i915_getparams_basic.c        | 2 +-
 tests/intel/i915_hangman.c                | 2 +-
 tests/intel/i915_module_load.c            | 2 +-
 tests/intel/i915_pciid.c                  | 2 +-
 tests/intel/i915_power.c                  | 2 +-
 tests/intel/i915_query.c                  | 3 ++-
 tests/intel/prime_busy.c                  | 2 +-
 tests/intel/prime_mmap.c                  | 2 +-
 tests/intel/prime_mmap_coherency.c        | 2 +-
 tests/intel/prime_mmap_kms.c              | 2 +-
 tests/intel/prime_self_import.c           | 2 +-
 tests/intel/sysfs_defaults.c              | 2 +-
 tests/prime_vgem.c                        | 2 +-
 tests/sw_sync.c                           | 3 ++-
 tests/syncobj_basic.c                     | 2 +-
 tests/syncobj_timeline.c                  | 2 +-
 tests/vgem_basic.c                        | 6 +++++-
 tests/vgem_slow.c                         | 2 +-
 85 files changed, 102 insertions(+), 86 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index 3c00d7925..e366869ea 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -50,7 +50,7 @@
  * Sub-category: DRM
  * Functionality: permission management for clients
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-auth
  * Description: Test magic numbers for master and slave.
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 21711cc55..fc4cbdd5a 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -39,7 +39,7 @@
  * Sub-category: DRM
  * Functionality: permission management for clients
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST:
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 0b9138aed..2e74a8e12 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -40,7 +40,7 @@
  * Sub-category: uapi
  * Functionality: DRM memory management
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST:
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 158133da7..d219a5962 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -36,7 +36,7 @@
  * Sub-category: DRM
  * Functionality: permission management for clients
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Tests GET_VERSION ioctl of the first device.
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..ec23aba40 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -46,7 +46,7 @@
  * Sub-category: DRM
  * Functionality: permission management for clients
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: master-drop-set-root
  * Description: Ensure that root can Set/DropMaster
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index b48e51f51..d49fdff89 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -48,7 +48,7 @@
  * Sub-category: DRM
  * Functionality: permission management for clients
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST:
  * Description: Check that drop/setMaster correctly transfer master state
diff --git a/tests/device_reset.c b/tests/device_reset.c
index a669e1224..56fadb461 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -22,7 +22,7 @@
  * Sub-category: Reset tests
  * Functionality: sysfs reset
  * Feature: reset
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: cold-reset-bound
  * Description: Cold Resets device with bound driver
diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 8568bdfb3..902aa147c 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -31,7 +31,7 @@
  * Functionality: drm_mm
  * Sub-category: Memory management tests
  * Feature: mapping, prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: all-tests
  *
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index e7b4c651f..8f73fa179 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -31,7 +31,7 @@
  * Sub-category: Memory management tests
  * Functionality: drm_mm
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: drm_mm
  *
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 9218be3b9..8782a38fd 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -20,7 +20,7 @@
  * Mega feature: General Core features
  * Sub-category: IGT Lib
  * Functionality: virtual address
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: igt_core
  *
  * SUBTEST: alloc-simple
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4158fa06c..8349aef19 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -49,7 +49,7 @@
  * Sub-category: IGT Lib
  * Functionality: dummy buffer creation & submission
  * Feature: igt_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: add-remove-objects
  *
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index ac60f6659..47af7a863 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -25,7 +25,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: barrier
- * Test category: GEM_Legacy
+ * Test category: stress test
  *
  * SUBTEST: remote-request
  * Description:
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index e4e49415d..09dae78af 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -49,10 +49,11 @@
  * Sub-category: uapi
  * Functionality: create/close IOCTLs
  * Feature: gem_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: bad-close
  * Description: Verify that gem_close fails with bad params.
+ * Test category: negative test
  *
  * SUBTEST: create-close
  * Description: Verify basic functionality of gem_create and gem_close.
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index 5ca81fbfe..1a6cea7ed 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -35,7 +35,7 @@
  * Sub-category: CMD submission
  * Functionality: command streamer
  * Feature: blitter
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  */
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 02eaeb864..d6699a66c 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -37,7 +37,7 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: busy IOCTL
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: cmd_submission
  *
  * SUBTEST: busy
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 11ce9c796..8d4af2b10 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -48,7 +48,7 @@
  * Sub-category: CMD submission
  * Functionality: coherency
  * Feature: caching
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: read-writes
  *
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index 3971cc75e..f82959a8f 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -32,7 +32,7 @@
  * Sub-category: driver
  * Functionality: driver handler
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  *
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index 9edcf13eb..b13023277 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -56,7 +56,7 @@
  * Sub-category: CMD submission
  * Functionality: buffer management
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-process
  * Description: Basic workload submission.
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 26cd6e32e..13fb10e43 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -71,7 +71,7 @@
  * Sub-category: uapi
  * Functionality: gem_create IOCTL
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: busy-create
  * Description: Create buffer objects while GPU is busy.
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index a72bbe847..c7cbb5cb8 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -60,7 +60,7 @@
  * Sub-category: Memory management tests
  * Functionality: tlb
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: engines
  */
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 1467f2943..6c42fa118 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -42,7 +42,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: negative test
  *
  * SUBTEST: double-destroy
  *
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 6afb10a7b..8ecea93cc 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -43,7 +43,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: active
  * Description: For each engine calculate the average performance of context
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 94a47ecc3..1dd3814d6 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -50,7 +50,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: execute-allforone
  *
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index d6aa8ba0a..77c4b91ed 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -55,7 +55,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check the basic context batch buffer execution.
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 29fdf89cb..3d6caed56 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -44,7 +44,7 @@
  * Sub-category: Power management tests
  * Functionality: frequency management
  * Feature: context feature
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: sysfs
  */
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index f406462d8..4948100e0 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -33,7 +33,7 @@
  * Sub-category: Security
  * Functionality: priv/non-priv registers
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: clean
  *
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 2e39a519b..627227cfe 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -38,17 +38,20 @@
  * Sub-category: uapi
  * Functionality: get/set IOCTLs
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: negative test
  *
  * SUBTEST: basic
  * Description: Basic test for context get/set param ioctls using valid context
+ * Test category: functionality test
  *
  * SUBTEST: basic-default
  * Description: Basic test for context get/set param ioctls using default context
+ * Test category: functionality test
  *
  * SUBTEST: get-priority-new-ctx
  * Description: Test performed with context param set to priority. Verify that
  *		priority is default for newly created context
+ * Test category: functionality test
  *
  * SUBTEST: invalid-ctx-get
  * Description: Verify that context get param ioctl using invalid context
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 90c1e0112..b865f2505 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -52,7 +52,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: engines-cleanup
  *
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index de06f2d54..4f6b66ab6 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -53,9 +53,9 @@
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: CMD submission
- * Functionality: shared contex
+ * Functionality: shared context
  * Feature: context
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: Q-in-order
  *
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index dc6178d63..5a9ef4e28 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -61,7 +61,7 @@
  * Sub-category: uapi
  * Functionality: reset
  * Feature: reset
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: banned
  *
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 7b51b7af0..8c61adbfc 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -53,7 +53,7 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: forked
  *
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 573157add..9df08a0e8 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -32,7 +32,7 @@
  * Functionality: concurent writes
  * Description: Check that we can issue concurrent writes across the engines.
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: concurrent-writes
  *
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 5dc43a0c4..4ca52354e 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -50,7 +50,7 @@
  * Sub-category: CMD submission
  * Functionality: requests
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: wide-all
  *
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index ca56bf4b5..b32a703c6 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -33,7 +33,7 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check basic functionality of GEM_EXECBUFFER2 ioctl on every
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 7bd91c2a0..1ec64433c 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -56,7 +56,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: large nop batch
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: exhaustive
  *
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 720ff796d..ac166df96 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -40,7 +40,7 @@
  * Sub-category: Debugging
  * Functionality: offline debugging
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: capture
  *
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index fb096a181..ade43738e 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -56,7 +56,7 @@
  *		and checks if we don't kill the system under the memory pressure
  *		some of the symptoms this test look for include mysterious hangs.
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check if we kill system by overloading it with active objects
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index a313c31f2..01bb0efc1 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -43,7 +43,7 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: cmd_submission, synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: await-hang
  * Description: Check for explicit fence with async wait on each engine with a
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 096681740..ad4b82bc2 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -34,7 +34,7 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Feature: cmd_submission, gtt
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: all-engines
  * Description: Stress test check behaviour/correctness of handling batches to fill gtt
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index fb37cb511..88024ef56 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -55,7 +55,7 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-parallel
  *
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index 90c46bf0c..bb5503713 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -41,7 +41,7 @@
  * Sub-category: CMD submission
  * Functionality: parallel clients
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  *
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index d0260d5f1..444547d8e 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -51,7 +51,7 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: negative test
  *
  * SUBTEST: DR1-dirt
  *
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index fdb7ebd70..18fd3c6f2 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -52,7 +52,7 @@
  * Sub-category: CMD submission
  * Functionality: execution order
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: deep
  * SUBTEST: fairslice
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 3b1319519..fa213dfae 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -42,7 +42,7 @@
  * Sub-category: CMD submission
  * Functionality: coherency
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Verify that all capable engines can store dwords to a common
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 8d39fc0af..b3b30f983 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -44,7 +44,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-contexts
  * SUBTEST: basic-contexts-all
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 72f3b6b34..881cd518f 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -18,7 +18,7 @@
  * Sub-category: Blitter tests
  * Functionality: fast-copy
  * Feature: blitter
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: fast-copy
  * Description: Check fast-copy blit blitter
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 2fa3e925c..24ee56b7f 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -46,7 +46,7 @@
  * Sub-category: DRM
  * Functionality: flink
  * Feature: xorg_dri2
- * Test category: GEM_Legacy
+ * Test category: negative test
  *
  * SUBTEST: bad-flink
  * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 2fd523436..6243912a3 100644
--- a/tests/intel/gem_flink_race.c
+++ b/tests/intel/gem_flink_race.c
@@ -43,7 +43,7 @@
  * Sub-category: DRM
  * Functionality: flink
  * Feature: xorg_dri2
- * Test category: GEM_Legacy
+ * Test category: stress test
  *
  * SUBTEST: flink_close
  *
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index aa735e539..6c3f3ce7f 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -54,7 +54,7 @@
  * Mega feature: Compute
  * Sub-category: GPGPU tests
  * Functionality: gpgpu_fill
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: compute
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index 2eeec5b6a..715b6fa2f 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -57,7 +57,7 @@
  * Sub-category: Blitter tests
  * Functionality: linear blits
  * Feature: blitter
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Basic blitter functionality check with 2 buffers
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index dcdf30c1d..9406148b3 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -15,7 +15,7 @@
  * Sub-category: Memory management tests
  * Functionality: local memory eviction
  * Feature: local_memory
- * Test category: GEM_Legacy
+ * Test category: stress test
  *
  * SUBTEST: dontneed-evict-race
  * Description: Regression test to verify that madvise will sync against busy dma-resv object for lmem
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index b8f24742b..934e687af 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -32,7 +32,7 @@
  * Sub-category: Memory management tests
  * Functionality: local memory
  * Feature: local_memory
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Exercise local memory swapping to system memory
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index c090f121e..ccd878b99 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -45,7 +45,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: madvise
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: caching, mapping
  *
  * SUBTEST: dontneed-after-mmap
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index d0e439fea..a1b51b12c 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -45,11 +45,17 @@
  * Sub-category: Memory management tests
  * Functionality: mapping
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: bad-extensions
+ * Test category: negative test
+ *
  * SUBTEST: bad-flags
+ * Test category: negative test
+ *
  * SUBTEST: bad-object
+ * Test category: negative test
+ *
  * SUBTEST: basic-uaf
  * SUBTEST: blt-coherency
  * SUBTEST: clear
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 27630b188..27c361def 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -51,7 +51,7 @@
  * Functionality: coherency
  * Description: Test (TLB-)Coherency of pipe_control QW writes.
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: fresh-buffer
  * Description: Checks tlb consistency of the pipe_control with fresh buffer.
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 309f240cc..9365067a2 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -45,7 +45,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: ppgtt
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: mapping, xorg_dri2
  *
  * SUBTEST: blt-vs-render-ctx0
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index 5ebfc1d3b..709fdead0 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -56,7 +56,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: requests
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: cmd_submission
  *
  * SUBTEST: retire-vma-not-inactive
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 298ed9c67..69ace7d39 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -50,7 +50,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: cmd_submission
  *
  * SUBTEST: basic-all
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index 53332afbd..762a0e222 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -40,7 +40,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: buffer management
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: execbuf1
  *
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index b7c1b34e1..776dbc9b3 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -40,7 +40,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: softpin
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: mapping
  *
  * SUBTEST: 32b-excludes-last-page
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 682a06218..edd72c6ea 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -32,7 +32,7 @@
  * Sub-category: IGT Lib
  * Functionality: dummy workload
  * Feature: context, igt_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: engines
  * SUBTEST: legacy
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 21180012c..ec9da63a0 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -40,7 +40,7 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: active
  * Description: Exercise waiting while keeping the GPU busy on each engine.
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index 21a5a07d9..7279048cc 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -49,7 +49,7 @@
  * Sub-category: CMD submission
  * Functionality: buffer management
  * Feature: cmd_submission
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 807c209e8..ed4f842ce 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -74,7 +74,7 @@
  * Sub-category: Compute tests
  * Functionality: userptr blits
  * Feature: userptr
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: access-control
  * SUBTEST: coherency-sync
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 752babfa8..5851e6ca5 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -34,7 +34,7 @@
  * Sub-category: CMD submission
  * Functionality: context
  * Feature: mapping
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: create-ext
  * Feature: mapping
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index 7a353a11e..b789b0faa 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -39,7 +39,7 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: await
  * Description: Verify GEM_WAIT functionality in await mode.
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index b810b125c..76c7e2479 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -39,7 +39,7 @@
  * Sub-category: Workarounds
  * Functionality: workaround registers
  * Feature: workarounds
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-read
  * SUBTEST: basic-read-context
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index cd0b528bc..7655c9d69 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -38,7 +38,7 @@
  * Sub-category: uapi
  * Functionality: device topology
  * Feature: gem_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-eu-total
  * Description: Examine the export of EU_TOTAL parameter
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index f100118b6..3b488d74e 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -48,7 +48,7 @@
  * Sub-category: Debugging
  * Functionality: error handling
  * Feature: reset
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: detector
  * Description:
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index e3e4470df..8df158d9e 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -31,7 +31,7 @@
  * Sub-category: driver
  * Functionality: driver handler
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: load
  * Description: Check if i915 and friends are not yet loaded, then load them.
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index a8c5df9d9..3f69cf583 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -36,7 +36,7 @@
  * Sub-category: driver
  * Functionality: device management
  * Feature: core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index 4de7adbe6..646f24339 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -15,7 +15,7 @@
  * Sub-category: Power management tests
  * Functionality: hwmon
  * Feature: hwmon
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: sanity
  * Description: Sanity check gpu power measurement
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index f886297ed..e282a33b4 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -35,13 +35,14 @@
  * Sub-category: uapi
  * Functionality: device topology
  * Feature: gem_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: engine-info
  * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
  *
  * SUBTEST: engine-info-invalid
  * Description: Negative tests for DRM_I915_QUERY_ENGINE_INFO
+ * Test category: negative test
  *
  * SUBTEST: hwconfig_table
  * Description: Test DRM_I915_QUERY_HWCONFIG_BLOB query
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 4bba32835..650d9ca6e 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -33,7 +33,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: prime
  *
  * SUBTEST: after
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index 6de54b840..def3fe08e 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -56,7 +56,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: prime
  *
  * SUBTEST: test_aperture_limit
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index 01c394639..5398af9a0 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -41,7 +41,7 @@
  * Sub-category: Memory management tests
  * Functionality: prime
  * Feature: prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: ioctl-errors
  *
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index c0c2f2fc0..873c6b6f9 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -44,7 +44,7 @@ IGT_TEST_DESCRIPTION(
  * Sub-category: DRM
  * Functionality: prime
  * Feature: prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: buffer-sharing
  * Description: Test efficiently sharing CPU and GPU buffers
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index 62d7431c2..d58134986 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -52,7 +52,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: prime import/export
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: prime
  *
  * SUBTEST: basic-llseek-bad
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index c7b6b36fd..d4234fc06 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -40,7 +40,7 @@
  * Sub-category: uapi
  * Functionality: sysfs
  * Feature: gem_core
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: readonly
  */
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 932058d2c..94197074f 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -38,7 +38,7 @@
  * Sub-category: DRM
  * Functionality: mock device
  * Feature: prime
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: basic-blt
  * Description: Examine blitter access path.
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index fbb24e8ac..d32376f19 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -46,11 +46,12 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: alloc_fence
  *
  * SUBTEST: alloc_fence_invalid_timeline
+ * Test category: negative test
  *
  * SUBTEST: alloc_merge_fence
  *
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 8a4416fff..9c5d3d694 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -34,7 +34,7 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: negative test
  *
  * SUBTEST: bad-create-flags
  *
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 96d5d8b45..eb309d37d 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -38,7 +38,7 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: 32bits-limit
  * Description:
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 048ad7460..8533edf78 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -38,20 +38,24 @@
  * Mega feature: General Core features
  * Sub-category: DRM
  * Functionality: mock device
- * Test category: GEM_Legacy
+ * Test category: functionality test
  * Feature: vgem
  *
  * SUBTEST: bad-fence
  * Description: Make sure a non-existent fence cannot be signaled.
+ * Test category: negative test
  *
  * SUBTEST: bad-flag
  * Description: Make sure a fence cannot be attached and signaled with invalid flags.
+ * Test category: negative test
  *
  * SUBTEST: bad-handle
  * Description: Make sure a fence cannot be attached to a invalid handle.
+ * Test category: negative test
  *
  * SUBTEST: bad-pad
  * Description: Make sure a non-zero pad is rejected.
+ * Test category: negative test
  *
  * SUBTEST: busy-fence
  * Description: Make sure a conflicting fence cannot be attached.
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 6609989c7..dcea7c677 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -38,7 +38,7 @@
  * Sub-category: DRM
  * Functionality: mock device
  * Feature: vgem
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: nohang
  */
-- 
2.34.1

