Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64526C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0C810ED84;
	Thu, 21 Mar 2024 15:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KL+rFC4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56B10ED84
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035777; x=1742571777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PN3ZUHsyr3epvWK97ly/sgLjtNbI5lk4TwuBhc4J8bs=;
 b=KL+rFC4h+o5CYLpyxiI2Gi5r+a1mh0YAWns32Tm/CBOxJuXkjCNF3Fh2
 1ryLv2SLlwTkVDav216irY3fjtOKTY9XVypn2HAg8pyAid7XlkjI0YweQ
 3rTvL+8qGkVwJTgINL4p0TqXZOLC39HqJPSidosq3bzHKdNQ3W1HN59ow
 KvWyOgXMydIRekVZpNXfccx0RDYOAFRXDHXkRpv3HZMX+kUJ1RCTRAXlz
 qLlYVr47inMusxoRBsNOt+DZI3NS5JPwvv//jseRvf6YZrS9ZAXILdjjF
 mH7SojXtwCfE+aS1kbSsrRuwEVWNXPiGUSiTioJyef6HXPjrt0ATgS7db Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9837852"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9837852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45660560"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:54 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 24/24] tests: Remove 'Run type' documentation field
Date: Thu, 21 Mar 2024 15:38:47 +0000
Message-Id: <20240321153847.1787625-25-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

It has been easier to maintain the Run type field by reading it from testlists
instead of from C file, as this changes dynamically, and different
devices may have either have it inside, for instance, BAT test list or not.

So, drop the field from the C file.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/core_auth.c                            |  4 ----
 tests/core_getclient.c                       |  1 -
 tests/core_getstats.c                        |  1 -
 tests/core_getversion.c                      |  1 -
 tests/core_hotunplug.c                       |  2 --
 tests/core_setmaster.c                       |  1 -
 tests/core_setmaster_vs_auth.c               |  1 -
 tests/device_reset.c                         |  1 -
 tests/dmabuf.c                               |  1 -
 tests/dmabuf_sync_file.c                     |  1 -
 tests/drm_mm.c                               |  1 -
 tests/drm_read.c                             |  1 -
 tests/dumb_buffer.c                          |  1 -
 tests/intel/api_intel_allocator.c            |  1 -
 tests/intel/api_intel_bb.c                   |  1 -
 tests/intel/debugfs_test.c                   |  3 ---
 tests/intel/drm_fdinfo.c                     |  1 -
 tests/intel/gem_bad_reloc.c                  |  1 -
 tests/intel/gem_barrier_race.c               |  1 -
 tests/intel/gem_basic.c                      |  2 --
 tests/intel/gem_blits.c                      |  1 -
 tests/intel/gem_busy.c                       |  2 --
 tests/intel/gem_caching.c                    |  1 -
 tests/intel/gem_ccs.c                        |  1 -
 tests/intel/gem_close.c                      |  1 -
 tests/intel/gem_close_race.c                 |  3 ---
 tests/intel/gem_compute.c                    |  1 -
 tests/intel/gem_create.c                     |  1 -
 tests/intel/gem_cs_tlb.c                     |  1 -
 tests/intel/gem_ctx_bad_destroy.c            |  1 -
 tests/intel/gem_ctx_create.c                 |  3 ---
 tests/intel/gem_ctx_engines.c                |  1 -
 tests/intel/gem_ctx_exec.c                   |  2 --
 tests/intel/gem_ctx_freq.c                   |  1 -
 tests/intel/gem_ctx_isolation.c              |  1 -
 tests/intel/gem_ctx_param.c                  |  1 -
 tests/intel/gem_ctx_persistence.c            |  1 -
 tests/intel/gem_ctx_shared.c                 |  1 -
 tests/intel/gem_ctx_sseu.c                   |  1 -
 tests/intel/gem_ctx_switch.c                 |  1 -
 tests/intel/gem_eio.c                        |  1 -
 tests/intel/gem_evict_alignment.c            |  1 -
 tests/intel/gem_evict_everything.c           |  1 -
 tests/intel/gem_exec_alignment.c             |  1 -
 tests/intel/gem_exec_async.c                 |  1 -
 tests/intel/gem_exec_await.c                 |  1 -
 tests/intel/gem_exec_balancer.c              |  1 -
 tests/intel/gem_exec_basic.c                 |  1 -
 tests/intel/gem_exec_big.c                   |  1 -
 tests/intel/gem_exec_capture.c               |  1 -
 tests/intel/gem_exec_create.c                |  2 --
 tests/intel/gem_exec_endless.c               |  1 -
 tests/intel/gem_exec_fair.c                  |  1 -
 tests/intel/gem_exec_fence.c                 |  5 -----
 tests/intel/gem_exec_flush.c                 |  1 -
 tests/intel/gem_exec_gttfill.c               |  2 --
 tests/intel/gem_exec_latency.c               |  1 -
 tests/intel/gem_exec_lut_handle.c            |  1 -
 tests/intel/gem_exec_nop.c                   |  1 -
 tests/intel/gem_exec_parallel.c              |  2 --
 tests/intel/gem_exec_params.c                |  1 -
 tests/intel/gem_exec_reloc.c                 |  1 -
 tests/intel/gem_exec_schedule.c              |  1 -
 tests/intel/gem_exec_store.c                 |  2 --
 tests/intel/gem_exec_suspend.c               |  1 -
 tests/intel/gem_exec_whisper.c               |  1 -
 tests/intel/gem_exercise_blt.c               |  1 -
 tests/intel/gem_fd_exhaustion.c              |  1 -
 tests/intel/gem_fence_thrash.c               |  1 -
 tests/intel/gem_fence_upload.c               |  1 -
 tests/intel/gem_fenced_exec_thrash.c         |  1 -
 tests/intel/gem_flink_basic.c                |  1 -
 tests/intel/gem_flink_race.c                 |  1 -
 tests/intel/gem_gpgpu_fill.c                 |  1 -
 tests/intel/gem_gtt_cpu_tlb.c                |  1 -
 tests/intel/gem_gtt_hog.c                    |  1 -
 tests/intel/gem_gtt_speed.c                  |  1 -
 tests/intel/gem_huc_copy.c                   |  1 -
 tests/intel/gem_linear_blits.c               |  2 --
 tests/intel/gem_lmem_evict.c                 |  1 -
 tests/intel/gem_lmem_swapping.c              |  4 ----
 tests/intel/gem_lut_handle.c                 |  1 -
 tests/intel/gem_madvise.c                    |  1 -
 tests/intel/gem_media_fill.c                 |  1 -
 tests/intel/gem_media_vme.c                  |  1 -
 tests/intel/gem_mmap.c                       |  2 --
 tests/intel/gem_mmap_gtt.c                   |  1 -
 tests/intel/gem_mmap_offset.c                |  1 -
 tests/intel/gem_mmap_wc.c                    |  1 -
 tests/intel/gem_partial_pwrite_pread.c       |  1 -
 tests/intel/gem_pipe_control_store_loop.c    |  1 -
 tests/intel/gem_ppgtt.c                      |  1 -
 tests/intel/gem_pread.c                      |  1 -
 tests/intel/gem_pread_after_blit.c           |  1 -
 tests/intel/gem_pwrite.c                     |  1 -
 tests/intel/gem_pwrite_snooped.c             |  1 -
 tests/intel/gem_pxp.c                        |  1 -
 tests/intel/gem_read_read_speed.c            |  1 -
 tests/intel/gem_readwrite.c                  |  1 -
 tests/intel/gem_reg_read.c                   |  1 -
 tests/intel/gem_render_copy.c                |  1 -
 tests/intel/gem_render_copy_redux.c          |  1 -
 tests/intel/gem_render_linear_blits.c        |  2 --
 tests/intel/gem_render_tiled_blits.c         |  2 --
 tests/intel/gem_request_retire.c             |  1 -
 tests/intel/gem_reset_stats.c                |  1 -
 tests/intel/gem_ringfill.c                   |  2 --
 tests/intel/gem_set_tiling_vs_blt.c          |  1 -
 tests/intel/gem_set_tiling_vs_gtt.c          |  1 -
 tests/intel/gem_set_tiling_vs_pwrite.c       |  1 -
 tests/intel/gem_shrink.c                     |  1 -
 tests/intel/gem_softpin.c                    |  3 ---
 tests/intel/gem_spin_batch.c                 |  1 -
 tests/intel/gem_streaming_writes.c           |  1 -
 tests/intel/gem_stress.c                     |  1 -
 tests/intel/gem_sync.c                       |  4 ----
 tests/intel/gem_tiled_blits.c                |  2 --
 tests/intel/gem_tiled_fence_blits.c          |  2 --
 tests/intel/gem_tiled_partial_pwrite_pread.c |  1 -
 tests/intel/gem_tiled_pread_basic.c          |  1 -
 tests/intel/gem_tiled_pread_pwrite.c         |  1 -
 tests/intel/gem_tiled_swapping.c             |  1 -
 tests/intel/gem_tiled_wb.c                   |  1 -
 tests/intel/gem_tiled_wc.c                   |  1 -
 tests/intel/gem_tiling_max_stride.c          |  1 -
 tests/intel/gem_unfence_active_buffers.c     |  1 -
 tests/intel/gem_unref_active_buffers.c       |  1 -
 tests/intel/gem_userptr_blits.c              |  1 -
 tests/intel/gem_vm_create.c                  |  1 -
 tests/intel/gem_wait.c                       |  3 ---
 tests/intel/gem_watchdog.c                   |  1 -
 tests/intel/gem_workarounds.c                |  1 -
 tests/intel/gen3_mixed_blits.c               |  1 -
 tests/intel/gen3_render_linear_blits.c       |  1 -
 tests/intel/gen3_render_mixed_blits.c        |  1 -
 tests/intel/gen3_render_tiledx_blits.c       |  1 -
 tests/intel/gen3_render_tiledy_blits.c       |  1 -
 tests/intel/gen7_exec_parse.c                |  1 -
 tests/intel/gen9_exec_parse.c                |  1 -
 tests/intel/i915_fb_tiling.c                 |  1 -
 tests/intel/i915_getparams_basic.c           |  1 -
 tests/intel/i915_hangman.c                   |  9 ---------
 tests/intel/i915_module_load.c               |  3 ---
 tests/intel/i915_pciid.c                     |  1 -
 tests/intel/i915_pipe_stress.c               |  1 -
 tests/intel/i915_pm_freq_api.c               |  1 -
 tests/intel/i915_pm_freq_mult.c              |  1 -
 tests/intel/i915_pm_rc6_residency.c          |  1 -
 tests/intel/i915_pm_rpm.c                    |  1 -
 tests/intel/i915_pm_rps.c                    |  2 --
 tests/intel/i915_pm_sseu.c                   |  1 -
 tests/intel/i915_power.c                     |  1 -
 tests/intel/i915_query.c                     |  1 -
 tests/intel/i915_selftest.c                  |  3 ---
 tests/intel/i915_suspend.c                   |  2 --
 tests/intel/intel_hwmon.c                    |  1 -
 tests/intel/perf.c                           |  1 -
 tests/intel/perf_pmu.c                       |  1 -
 tests/intel/prime_busy.c                     |  1 -
 tests/intel/prime_mmap.c                     |  1 -
 tests/intel/prime_mmap_coherency.c           |  1 -
 tests/intel/prime_mmap_kms.c                 |  1 -
 tests/intel/prime_self_import.c              |  3 ---
 tests/intel/sysfs_defaults.c                 |  1 -
 tests/intel/sysfs_heartbeat_interval.c       |  1 -
 tests/intel/sysfs_preempt_timeout.c          |  1 -
 tests/intel/sysfs_timeslice_duration.c       |  1 -
 tests/intel/xe_drm_fdinfo.c                  |  1 -
 tests/intel/xe_pm.c                          |  1 -
 tests/intel/xe_pm_residency.c                |  1 -
 tests/intel/xe_spin_batch.c                  |  2 --
 tests/intel/xe_waitfence.c                   |  1 -
 tests/prime_nv_api.c                         |  1 -
 tests/prime_nv_pcopy.c                       |  1 -
 tests/prime_nv_test.c                        |  1 -
 tests/prime_vgem.c                           |  7 -------
 tests/sriov_basic.c                          |  4 ----
 tests/sw_sync.c                              |  1 -
 tests/syncobj_basic.c                        |  1 -
 tests/syncobj_eventfd.c                      |  1 -
 tests/syncobj_timeline.c                     |  1 -
 tests/syncobj_wait.c                         |  1 -
 tests/vgem_basic.c                           | 12 ------------
 tests/vgem_slow.c                            |  1 -
 184 files changed, 259 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index 6103d0ffc..2d6ad83e9 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -53,19 +53,15 @@
  *
  * SUBTEST: basic-auth
  * Description: Test magic numbers for master and slave.
- * Run type: BAT
  *
  * SUBTEST: getclient-master-drop
  * Description: Use 2 clients, check second is authenticated even when first dropped.
- * Run type: FULL
  *
  * SUBTEST: getclient-simple
  * Description: Check drm client is always authenticated.
- * Run type: FULL
  *
  * SUBTEST: many-magics
  * Description: Test authentication and magic numbers uniqness for rlimit slaves.
- * Run type: FULL
  */
 
 #ifndef __linux__
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 839fae36a..308f2c0e4 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -37,7 +37,6 @@
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  * Feature: core
  * Functionality: permission management for clients
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 1a8ad22c7..b2d26a826 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -38,7 +38,6 @@
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  * Feature: core
  * Functionality: DRM memory management
- * Run type: FULL
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 8b95e2ce4..94cedff8c 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -34,7 +34,6 @@
  * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
  * Feature: core
  * Functionality: permission management for clients
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index f578afa4a..9af857e67 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -47,7 +47,6 @@
  * Category: Software building block
  * Sub-category: driver
  * Functionality: device hotplug
- * Run type: FULL
  *
  * SUBTEST: hotrebind
  * Description: Check if the driver can be cleanly rebound to a device with a
@@ -76,7 +75,6 @@
  * SUBTEST: unbind-rebind
  * Description: Check if the driver can be cleanly unbound from a device
  *		believed to be closed, then rebound
- * Run type: BAT
  *
  * SUBTEST: unplug-rescan
  * Description: Check if a device believed to be closed can be cleanly
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 04ee6b8b5..707c2305f 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -44,7 +44,6 @@
  * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
  * Feature: core
  * Functionality: permission management for clients
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index b80ed3879..592d850f6 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -46,7 +46,6 @@
  * Description: Check that drop/setMaster correctly transfer master state
  * Feature: core
  * Functionality: permission management for clients
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 4db7df7c5..e19e672ce 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -23,7 +23,6 @@
  * Functionality: sysfs reset
  * Sub-category: Reset
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: cold-reset-bound
  * Description: Cold Resets device with bound driver
diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 977b04043..549cfa27e 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -32,7 +32,6 @@
  * Functionality: DRM
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: BAT
  *
  * SUBTEST: all-tests
  *
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 57f1ce2bc..f4eb2e63f 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -16,7 +16,6 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
  * Description: Tests for sync_file support in dma-buf
  * Functionality: dmabuf
  * Sub-category: Core
- * Run type: FULL
  *
  * SUBTEST: export-basic
  * SUBTEST: export-before-signal
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 9319558db..b8b72635b 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -31,7 +31,6 @@
  * Functionality: DRM
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: drm_mm
  *
diff --git a/tests/drm_read.c b/tests/drm_read.c
index f8ef324fa..a976a59a2 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -56,7 +56,6 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
  * Category: Infrastructure
  * Functionality: DRM memory managemnt
  * Sub-category: uapi
- * Run type: FULL
  *
  * SUBTEST: invalid-buffer
  * SUBTEST: fault-buffer
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index d76f0c70f..8e243459c 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -55,7 +55,6 @@
  * Description: This is a test for the generic dumb buffer interface.
  * Feature: prime
  * Functionality: ioctl
- * Run type: FULL
  * Sub-category: uapi
  * Test category: Compositor
  *
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index f260250d4..60cd16de0 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -18,7 +18,6 @@
  * Category: Infrastructure
  * Functionality: virtual address
  * Description: checking the virtual address ranges
- * Run type: FULL
  * Sub-category: IGT Lib
  * Test category: GEM_Legacy
  * Feature: igt_core
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 74e334581..6e5c1293e 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -49,7 +49,6 @@
  * Functionality: dummy buffer creation & submission
  * Sub-category: IGT Lib
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: add-remove-objects
  *
diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
index 9706b81e1..1278b0ae1 100644
--- a/tests/intel/debugfs_test.c
+++ b/tests/intel/debugfs_test.c
@@ -37,15 +37,12 @@
  * Functionality: debugfs
  * Sub-category: uapi
  * Test category: uapi
- * Run type: FULL
  *
  * SUBTEST: basic-hwmon
  * Description: Read all entries from hwmon path validating debugfs entries
- * Run type: BAT
  *
  * SUBTEST: read_all_entries
  * Description: Read all entries from debugfs path validating debugfs entries
- * Run type: BAT
  *
  * SUBTEST: read_all_entries_display_off
  * Description: Read all debugfs entries with display on/off.
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index aac2fdb6a..a10c9fffc 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -40,7 +40,6 @@
  * Functionality: client_busyness
  * Sub-category: FDinfo
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: all-busy-check-all
  *
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 8e17d6630..beb24c8b9 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -49,7 +49,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: relocations
- * Run type: FULL
  *
  * SUBTEST: negative-reloc
  * Description: SNA behaviour is compressing batch buffer which leads to
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index 7f434a68c..221579ad9 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -24,7 +24,6 @@
  * Category: Desktop client
  * Sub-category: CMD submission
  * Functionality: barrier
- * Run type: FULL
  * Test category: GEM_Legacy
  *
  * SUBTEST: remote-request
diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
index 513113cd1..bd9401149 100644
--- a/tests/intel/gem_basic.c
+++ b/tests/intel/gem_basic.c
@@ -49,7 +49,6 @@
  * Functionality: driver handler
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: BAT
  *
  * SUBTEST: bad-close
  * Description: Verify that gem_close fails with bad params.
@@ -63,7 +62,6 @@
  * SUBTEST: multigpu-create-close
  * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
  * Feature: gem_core, multigpu
- * Run type: FULL
  * Test category: MultiGPU
  */
 
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index b9d0b5f87..c23ad528d 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -33,7 +33,6 @@
  * Category: Infrastructure
  * Feature: blitter
  * Functionality: command streamer
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_busy.c b/tests/intel/gem_busy.c
index 7baaac41f..58720b4dc 100644
--- a/tests/intel/gem_busy.c
+++ b/tests/intel/gem_busy.c
@@ -38,7 +38,6 @@
  * Sub-category: uapi
  * Test category: GEM_Legacy
  * Feature: cmd_submission
- * Run type: FULL
  *
  * SUBTEST: busy
  * Description: Basic test to check busyness of each engine.
@@ -46,7 +45,6 @@
  * SUBTEST: busy@all
  *
  * SUBTEST: busy@all-engines
- * Run type: BAT
  *
  * SUBTEST: close-race
  * Description: Test to check race condition by randomly closing the handle
diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index c3311e9ec..475013739 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -46,7 +46,6 @@
  * Description: Test snoop consistency when touching partial cachelines.
  * Feature: caching feature
  * Functionality: coherency
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index e6257aeac..e4126bcaa 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -23,7 +23,6 @@
  * Sub-category: Flat-ccs
  * Category: Desktop \ Server
  * Functionality: block-copy
- * Run type: FULL
  *
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index 91cda5bdc..b3c5cb108 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -30,7 +30,6 @@
  * Category: Infrastructure
  * Feature: mapping
  * Functionality: driver handler
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index acfa8166a..11843170f 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -56,16 +56,13 @@
  * Functionality: driver handler
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-process
  * Description: Basic workload submission.
- * Run type: BAT
  *
  * SUBTEST: basic-threads
  * Description: Share buffer handle across different drm fd's and trying to
  *		race gem_close against continuous workload with minimum timeout.
- * Run type: BAT
  *
  * SUBTEST: contexts
  * Description: Share buffer handle across different drm fd's and trying to
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8bd9635ae..ffab45d61 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -8,7 +8,6 @@
  * Category: Hardware building block
  * Sub-category: Compute
  * Test category: functionality test
- * Run type: BAT
  */
 
 #include <string.h>
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index ae9575089..1434a50a9 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -71,7 +71,6 @@
  * Functionality: buffer management
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: busy-create
  * Description: Create buffer objects while GPU is busy.
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index f9bd86785..f18a8fdaa 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -58,7 +58,6 @@
  * Description: Check whether we correctly invalidate the cs tlb.
  * Feature: mapping
  * Functionality: tlb
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 9d8c6fff7..67a391f23 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -40,7 +40,6 @@
  * Description: Negative test cases for destroy contexts.
  * Feature: cmd_submission
  * Functionality: context
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index bcd74f51f..471070177 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -43,7 +43,6 @@
  * Functionality: context
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: active
  * Description: For each engine calculate the average performance of context
@@ -55,11 +54,9 @@
  *
  * SUBTEST: basic
  * Description: Test random context creation
- * Run type: BAT
  *
  * SUBTEST: basic-files
  * Description: Exercise implicit per-fd context creation
- * Run type: BAT
  *
  * SUBTEST: ext-param
  * Description: Verify valid and invalid context extensions
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 146a68cfd..76fc05a36 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -48,7 +48,6 @@
  * Category: Infrastructure
  * Feature: cmd_submission
  * Functionality: context
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 2643821a0..70aa5413c 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -55,11 +55,9 @@
  * Functionality: context
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Check the basic context batch buffer execution.
- * Run type: BAT
  *
  * SUBTEST: basic-close-race
  * Description: Race the execution and interrupt handlers along a context,
diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index 6caaf4a1a..db67cade5 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -42,7 +42,6 @@
  * Category: Server
  * Feature: context feature
  * Functionality: frequency management
- * Run type: FULL
  * Sub-category: Performance
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ctx_isolation.c b/tests/intel/gem_ctx_isolation.c
index 89c023e09..e6b609e35 100644
--- a/tests/intel/gem_ctx_isolation.c
+++ b/tests/intel/gem_ctx_isolation.c
@@ -33,7 +33,6 @@
  * Functionality: priv/non-priv registers
  * Sub-category: Security
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: clean
  *
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 61b79e1ab..e09216487 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -38,7 +38,6 @@
  * Functionality: context
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Basic test for context get/set param ioctls using valid context
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 6528e0f9c..80ece13a7 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -52,7 +52,6 @@
  * Functionality: context
  * Sub-category: Compute
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: engines-cleanup
  *
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index a8cbcf12a..f0005ead7 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -55,7 +55,6 @@
  * Functionality: shared contex
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: Q-in-order
  *
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index a9d400c2d..d7cb730b1 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -51,7 +51,6 @@
  * Sub-category: uapi
  * Category: Desktop client
  * Functionality: sseu
- * Run type: FULL
  *
  * SUBTEST: engines
  *
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 2f9786bf7..350efb69e 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -51,7 +51,6 @@
  * Category: Desktop client
  * Sub-category: CMD Submission
  * Functionality: context switching
- * Run type: FULL
  *
  * SUBTEST: all-heavy
  *
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 6fa68441f..4661a8959 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -61,7 +61,6 @@
  * Functionality: reset
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: banned
  *
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 7cd11d169..0ccddcfe3 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -53,7 +53,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: misalignment
- * Run type: FULL
  *
  * SUBTEST: major-hang
  *
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 578018e4d..87338506d 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -54,7 +54,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: eviction
- * Run type: FULL
  *
  * SUBTEST: forked-interruptible
  *
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 40ff15030..0e9f78362 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -51,7 +51,6 @@
  * Description: Exercises the basic execbuffer using object alignments
  * Feature: cmd_submission
  * Functionality: execbuf
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 8db8fbf3c..f09bc8692 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -30,7 +30,6 @@
  * Description: Check that we can issue concurrent writes across the engines.
  * Feature: cmd_submission
  * Functionality: concurent writes
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index b2b8218bf..fcbca1547 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -48,7 +48,6 @@
  * Category: Infrastructure
  * Feature: cmd_submission
  * Functionality: requests
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index efa875889..b1a108a5a 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -46,7 +46,6 @@
  * Functionality: load balancing
  * Sub-category: CMD submission
  * Test category: Media & Compute
- * Run type: FULL
  *
  * SUBTEST: bonded-chain
  *
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index aae773987..3982bccc6 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -31,7 +31,6 @@
  * Category: Infrastructure
  * Feature: cmd_submission
  * Functionality: execbuf
- * Run type: BAT
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index f22be96db..d464440e9 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -56,7 +56,6 @@
  * Functionality: large nop batch
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: exhaustive
  *
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 0be3c5349..57b178f3e 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -40,7 +40,6 @@
  * Functionality: offline debugging
  * Sub-category: Debugging
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: capture
  *
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index 1d5c2512f..e9a3cdc04 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -54,12 +54,10 @@
  *		some of the symptoms this test look for include mysterious hangs.
  * Feature: cmd_submission
  * Functionality: buffer management
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
- * Run type: BAT
  * Description: Check if we kill system by overloading it with active objects
  *		iterating over all engines.
  *
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index b7e2bb429..5bec7adee 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -35,7 +35,6 @@
  * Category: Server
  * Feature: cmd_submission
  * Functionality: compute
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: Compute
  *
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 2c33c0187..29d732205 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -33,7 +33,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: multi-client systems
- * Run type: FULL
  *
  * SUBTEST: basic-deadline
  *
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index e640a0a0a..3ed61b5f5 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -43,7 +43,6 @@
  * Functionality: semaphore
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: await-hang
  * Description: Check for explicit fence with async wait on each engine with a
@@ -51,13 +50,11 @@
  *
  * SUBTEST: basic-await
  * Description: Basic check for explicit fence with async wait on each engine.
- * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-busy
  * Description: Basic check for explicit fence on each busy engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-busy-all
@@ -69,7 +66,6 @@
  * Description: Basic check for explicit fence with additional wait time on
  *		each busy engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-wait-all
@@ -113,7 +109,6 @@
  * SUBTEST: nb-await
  * Description: Check for explicit fence with non-blocking wait on each engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: nb-await-hang
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index a540d1f30..5e2804f7d 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -34,7 +34,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: execbuf
- * Run type: FULL
  *
  * SUBTEST: basic-batch-kernel-default-cmd
  * Feature: cmd_submission, command_parser
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index b1063437b..bf7ff6ff7 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -34,14 +34,12 @@
  * Functionality: execbuf
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: all-engines
  * Description: Stress test check behaviour/correctness of handling batches to fill gtt
  *
  * SUBTEST: basic
  * Description: Checks if it can handle enough batches to fill gtt
- * Run type: BAT
  *
  * SUBTEST: engines
  * Description: Checks the correctness of handling enough batches to fill gtt for each engine
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index 42955e97a..e5399de17 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -53,7 +53,6 @@
  * Sub-category: CMD submission
  * Functionality: execbuf
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: context-preempt
  *
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index a03a716e5..ff37a9f0e 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -46,7 +46,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: execbuf
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 48308312e..8a6d6c42a 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -55,7 +55,6 @@
  * Functionality: execbuf
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-parallel
  *
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index fdf22cbea..cb9f0e33d 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -42,14 +42,12 @@
  * Functionality: parallel clients
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic
  *
  * SUBTEST: contexts
  *
  * SUBTEST: engines
- * Run type: BAT
  *
  * SUBTEST: fds
  *
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index 912c4f856..9ce4d7653 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -51,7 +51,6 @@
  * Functionality: execbuf
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: DR1-dirt
  *
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index f3a8a45c0..c7f7db27a 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -37,7 +37,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: relocations
- * Run type: FULL
  *
  * SUBTEST: basic-active
  * Feature: cmd_submission
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 47cbad85a..70243e72b 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -52,7 +52,6 @@
  * Functionality: execution order
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: deep
  * SUBTEST: fairslice
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index a5a6538cb..3f44f2aa6 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -42,12 +42,10 @@
  * Functionality: coherency
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Verify that all capable engines can store dwords to a common
  *		buffer object
- * Run type: BAT
  *
  * SUBTEST: cachelines
  * Description: Verify that each capable engine can store a dword to different
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 5e88ac378..28d51996e 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -43,7 +43,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: suspend
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Check basic functionality without any suspend/resume cycle.
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 29ed163cc..f0a83ab52 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -44,7 +44,6 @@
  * Functionality: execbuf
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-contexts
  * SUBTEST: basic-contexts-all
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 39bbdda17..7554aaef1 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -18,7 +18,6 @@
  * Category: Desktop client
  * Functionality: fast-copy
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: fast-copy
  * Description: Check fast-copy blit blitter
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index 0bf7b309a..14270897d 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -39,7 +39,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: fd exhaustion
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 95cd6cf90..0df7319fc 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -49,7 +49,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: synchronization
- * Run type: FULL
  *
  * SUBTEST: bo-copy
  *
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index fd6858759..b80d53a25 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -46,7 +46,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: synchronization
- * Run type: FULL
  *
  * SUBTEST: performance
  *
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 7203ac204..d0055dfb5 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -40,7 +40,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: synchronization
- * Run type: FULL
  *
  * SUBTEST: 2-spare-fences
  *
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 85cd78a46..049c91be2 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -46,7 +46,6 @@
  * Functionality: buffer management
  * Sub-category: DRM
  * Test category: GEM_Legacy
- * Run type: BAT
  *
  * SUBTEST: bad-flink
  * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
diff --git a/tests/intel/gem_flink_race.c b/tests/intel/gem_flink_race.c
index 41c15f298..5675954bd 100644
--- a/tests/intel/gem_flink_race.c
+++ b/tests/intel/gem_flink_race.c
@@ -41,7 +41,6 @@
  * Description: Check for flink/open vs. gem close races.
  * Feature: xorg_dri2
  * Functionality: buffer management
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 3a6d66b35..14811abce 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -55,7 +55,6 @@
  * Sub-category: GPGPU
  * Test category: GEM_Legacy
  * Feature: compute
- * Run type: FULL
  *
  * SUBTEST: basic
  */
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
index 760e0a4ac..c7a1cbe63 100644
--- a/tests/intel/gem_gtt_cpu_tlb.c
+++ b/tests/intel/gem_gtt_cpu_tlb.c
@@ -50,7 +50,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: mmap
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index 247b31da5..12f291020 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -47,7 +47,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: gtt
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
index 6cc34ce87..46ebafdd8 100644
--- a/tests/intel/gem_gtt_speed.c
+++ b/tests/intel/gem_gtt_speed.c
@@ -47,7 +47,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: gtt
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index a5b891247..541ed01f1 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -42,7 +42,6 @@
  * Sub-category: Firmware
  * Category: Desktop client
  * Functionality: huc copy
- * Run type: BAT
  *
  * SUBTEST: huc-copy
  * Description:
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index aac84211f..023b2026b 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -57,11 +57,9 @@
  * Functionality: linear blits
  * Sub-category: Blitter
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Basic blitter functionality check with 2 buffers
- * Run type: BAT
  *
  * SUBTEST: interruptible
  * Description: Test with interrupts in between the parent process
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index 1574bbb9f..f756565cb 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -14,7 +14,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: local memory eviction
- * Run type: FULL
  * Test category: GEM_Legacy
  *
  * SUBTEST: dontneed-evict-race
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index d38a04673..a10a6e96e 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -35,7 +35,6 @@
  *
  * SUBTEST: basic
  * Description: Exercise local memory swapping to system memory
- * Run type: BAT
  *
  * SUBTEST: heavy-multi
  * Description: Exercise local memory swapping to system memory
@@ -69,7 +68,6 @@
  *
  * SUBTEST: parallel-random-engines
  * Description: Exercise local memory swapping to system memory
- * Run type: BAT
  *
  * SUBTEST: parallel-random-verify
  * Description: Exercise local memory swapping to system memory
@@ -82,7 +80,6 @@
  *
  * SUBTEST: random-engines
  * Description: Exercise local memory swapping to system memory
- * Run type: BAT
  *
  * SUBTEST: smem-oom
  * Description: Exercise local memory swapping during exhausting system memory
@@ -95,7 +92,6 @@
  *
  * SUBTEST: verify-random
  * Description: Exercise local memory swapping to system memory
- * Run type: BAT
  *
  * SUBTEST: verify-random-ccs
  * Description: Exercise local memory swapping to system memory
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index 359e1a921..b2911b3b6 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -45,7 +45,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: execbuf
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index c8aa71c1b..da5ac7d6d 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -46,7 +46,6 @@
  * Functionality: buffer management
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: dontneed-after-mmap
  * Description: Check signal for Segmentation Fault and bus error after
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index fcd90b70c..e9455df9e 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -52,7 +52,6 @@
  * Sub-category: Media
  * Category: Desktop client
  * Functionality: fill media
- * Run type: FULL
  *
  * SUBTEST: media-fill
  */
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index d6afca01e..89ce8c55d 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -42,7 +42,6 @@
  * Sub-category: Media
  * Category: Desktop client
  * Functionality: vme media block
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index c64c8f52a..179001a20 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -45,7 +45,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: mmap
- * Run type: FULL
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects won't be created.
@@ -60,7 +59,6 @@
  * Description:
  *   Test basics of newly mapped gem object like default content, write and read
  *   coherency, mapping existence after gem_close and unmapping.
- * Run type: BAT
  *
  * SUBTEST: basic-small-bo
  * Description:
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 8d04188f7..7218ef9bc 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -53,7 +53,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: map gtt
- * Run type: FULL
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects fails.
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index b1134afb4..95d2158ca 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -45,7 +45,6 @@
  * Functionality: mmap
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: bad-extensions
  * SUBTEST: bad-flags
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 766ee61fc..0a1bef7a2 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -45,7 +45,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: cache
- * Run type: FULL
  *
  * SUBTEST: bad-object
  * SUBTEST: bad-offset
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index 782a4f3b8..cb7737ffc 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -45,7 +45,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: pread/pwrite
- * Run type: FULL
  *
  * SUBTEST: reads
  * Description:
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 3cfef84e7..e79cef60f 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -49,7 +49,6 @@
  * Description: Test (TLB-)Coherency of pipe_control QW writes.
  * Feature: cmd_submission
  * Functionality: coherency
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index c25bf5f88..9eb995f20 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -46,7 +46,6 @@
  * Functionality: buffer management
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: blt-vs-render-ctx0
  *
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index bfd20b8f8..e5a7b48d3 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -51,7 +51,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: pread
- * Run type: FULL
  *
  * SUBTEST: bench
  *
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index 64453ad3d..f6a1b625b 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -53,7 +53,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: pread
- * Run type: FULL
  *
  * SUBTEST: default-hang
  *
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index f265eb68c..a617a9999 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -52,7 +52,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: pwrite
- * Run type: FULL
  *
  * SUBTEST: basic-exhaustion
  *
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index fede6e1c8..19df2fd3d 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -44,7 +44,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: pwrite
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index bef6056ba..f90e92abd 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -14,7 +14,6 @@
  * Functionality: pxp
  * Sub-category: Power management
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: create-protected-buffer
  *
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index dde021f22..47c3dfecd 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -48,7 +48,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: read/write memory
- * Run type: FULL
  *
  * SUBTEST: read-read-1024x1024
  *
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index 545e97f17..9970c5f33 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -44,7 +44,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: read/write memory
- * Run type: FULL
  *
  * SUBTEST: beyond-EOB
  *
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 03b12551d..8b7bc9898 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -38,7 +38,6 @@
  * Sub-category: uapi
  * Category: Desktop client
  * Functionality: ioctl
- * Run type: FULL
  *
  * SUBTEST: bad-register
  *
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 91979ba07..0b5a0ac4a 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -55,7 +55,6 @@
  * Sub-category: Render copy
  * Category: Desktop client
  * Functionality: render_copy
- * Run type: FULL
  *
  * SUBTEST: linear
  * Description: Test render_copy() from a mixed-tiled to a linear buffer.
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 681cb5cca..60366fd42 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -54,7 +54,6 @@
  * Sub-category: Render copy
  * Category: Desktop client
  * Functionality: render_copy
- * Run type: FULL
  *
  * SUBTEST: flink
  * Feature: mapping, xorg_dri2
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 095d0acb2..121d1b2a8 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -55,14 +55,12 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: render blits
- * Run type: FULL
  *
  * SUBTEST: aperture-shrink
  *
  * SUBTEST: aperture-thrash
  *
  * SUBTEST: basic
- * Run type: BAT
  *
  * SUBTEST: swap-thrash
  */
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index dda6faf42..3c4b062b0 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -58,7 +58,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: render blits
- * Run type: FULL
  *
  * SUBTEST: aperture-shrink
  * Description:
@@ -70,7 +69,6 @@
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
- * Run type: BAT
  *
  * SUBTEST: swap-thrash
  * Description:
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index 8db5780c5..d86972536 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -57,7 +57,6 @@
  * Functionality: requests
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: retire-vma-not-inactive
  */
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index a62c4061a..18875a530 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -52,7 +52,6 @@
  * Sub-category: uapi
  * Category: Desktop client
  * Functionality: reset
- * Run type: FULL
  *
  * SUBTEST: ban-blt
  *
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index e9f0c7d97..84060c474 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -51,10 +51,8 @@
  * Functionality: execbuf
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-all
- * Run type: BAT
  * Description: Basic check to fill the ring up to maximum on all engines
  *		simultaneously.
  *
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index 5188e6b2b..1a1bd86aa 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -64,7 +64,6 @@
  * Functionality: tiling
  * Sub-category: Blitter
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: tiled-to-tiled
  * Description: Check for proper synchronization of tiled->tiled transition.
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
index 7e5dab1fa..3305a2297 100644
--- a/tests/intel/gem_set_tiling_vs_gtt.c
+++ b/tests/intel/gem_set_tiling_vs_gtt.c
@@ -45,7 +45,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiling vs gtt coherency
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
index a358ddba6..241e72ab8 100644
--- a/tests/intel/gem_set_tiling_vs_pwrite.c
+++ b/tests/intel/gem_set_tiling_vs_pwrite.c
@@ -45,7 +45,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiling vs pwrite coherency
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index 094881a15..f6df21c8d 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -40,7 +40,6 @@
  * Functionality: buffer management
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: execbuf1
  *
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index f06e58be9..ab23ca7d5 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -41,18 +41,15 @@
  * Functionality: softpin
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: 32b-excludes-last-page
  * Description: Check the last 32b page is excluded.
  *
  * SUBTEST: allocator-basic
  * Description: Check that we can place objects at start/end of the GTT using the allocator.
- * Run type: BAT
  *
  * SUBTEST: allocator-basic-reserve
  * Description: Check that if we can reserve a space for an object starting from a given offset.
- * Run type: BAT
  *
  * SUBTEST: allocator-evict
  * Description: Exercise eviction with softpinning.
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 7e65fd396..a865e8549 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -32,7 +32,6 @@
  * Feature: context, igt_core
  * Functionality: dummy workload
  * Sub-category: IGT Lib
- * Run type: FULL
  *
  * SUBTEST: engines
  * SUBTEST: legacy
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index dd2f28331..d707c703a 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -46,7 +46,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: barrier
- * Run type: FULL
  *
  * SUBTEST: batch-cpu
  *
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index c3ee00012..fc1ff2519 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -67,7 +67,6 @@
  * Category: Desktop client
  * Sub-category: CMD submission
  * Functionality: coherency
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index eee13789e..80119e30b 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -40,7 +40,6 @@
  * Functionality: semaphore
  * Sub-category: Synchronization
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: active
  * Description: Exercise waiting while keeping the GPU busy on each engine.
@@ -58,14 +57,12 @@
  *
  * SUBTEST: basic-all
  * Description: Basic test to wait upon a batch on all rings.
- * Run type: BAT
  *
  * SUBTEST: basic-each
  * Description:
  *   Check synchronisation of ring.
  *   Exercise all physical engine selection and legacy rings
  * Feature: multitile, synchronization feature
- * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-many-each
@@ -162,7 +159,6 @@
  * SUBTEST: legacy-switch
  * Description: Check sync after context switch for each legacy engine.
  * Feature: synchronization feature
- * Run type: FULL
  *
  * SUBTEST: legacy-wakeup
  * Description: Stress for nop + sync for each legacy engine.
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index ec6e88477..73adadef4 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -61,11 +61,9 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiled blits
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
- * Run type: BAT
  *
  * SUBTEST: interruptible
  * Description: Check with interrupts in parallel execution.
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 920eeb42d..faebe0efb 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -57,11 +57,9 @@
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
- * Run type: BAT
  *
  * SUBTEST: normal
  * Description: Check with parallel execution.
- * Run type: FULL
  */
 
 IGT_TEST_DESCRIPTION("Tests fence management problems related to tiled blits by performing "
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index c4686739e..9c24f1901 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -45,7 +45,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiled pread/pwrite
- * Run type: FULL
  *
  * SUBTEST: reads
  *
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index 13181d86c..913800880 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -55,7 +55,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiled pread/pwrite
- * Run type: BAT
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
index f8bc79731..7ec6a9291 100644
--- a/tests/intel/gem_tiled_pread_pwrite.c
+++ b/tests/intel/gem_tiled_pread_pwrite.c
@@ -65,7 +65,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiled pread/pwrite
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 13f9fb41f..1b5c4bd14 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -65,7 +65,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: swapping
- * Run type: FULL
  *
  * SUBTEST: non-threaded
  *
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
index ee17b587d..53c1ea217 100644
--- a/tests/intel/gem_tiled_wb.c
+++ b/tests/intel/gem_tiled_wb.c
@@ -54,7 +54,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: cache
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
index 356b48829..7b8e88427 100644
--- a/tests/intel/gem_tiled_wc.c
+++ b/tests/intel/gem_tiled_wc.c
@@ -51,7 +51,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: cache
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index 93b89b00e..5877b887c 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -46,7 +46,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: fences
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
index 081e4631f..cde4771c6 100644
--- a/tests/intel/gem_unfence_active_buffers.c
+++ b/tests/intel/gem_unfence_active_buffers.c
@@ -59,7 +59,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: fences
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index e30214bc7..f8138c7ac 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -47,7 +47,6 @@
  * Description: Test unreferencing of active buffers.
  * Feature: cmd_submission
  * Functionality: buffer management
- * Run type: FULL
  * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 3e1f48a4f..51948db0c 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -74,7 +74,6 @@
  * Functionality: buffer management
  * Sub-category: Compute
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: access-control
  * SUBTEST: coherency-sync
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index cb73828da..2788e1745 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -34,7 +34,6 @@
  * Sub-category: Compute
  * Feature: mapping
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: create-ext
  * Feature: mapping
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index 99ac87536..fa6eb9f77 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -39,7 +39,6 @@
  * Functionality: GEM_WAIT ioctl
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: await
  * Description: Verify GEM_WAIT functionality in await mode.
@@ -50,7 +49,6 @@
  * SUBTEST: busy@all
  *
  * SUBTEST: busy@all-engines
- * Run type: BAT
  *
  * SUBTEST: hang-busy
  * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
@@ -76,7 +74,6 @@
  * SUBTEST: wait@all
  *
  * SUBTEST: wait@all-engines
- * Run type: BAT
  *
  * SUBTEST: write-busy
  * Description: Verify GEM_WAIT functionality in write-busy mode.
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index a844cdfe0..98da6cdce 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -41,7 +41,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: fences
- * Run type: FULL
  *
  * SUBTEST: default-physical
  *
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index 682fc3163..dbde4cb45 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -39,7 +39,6 @@
  * Functionality: context
  * Sub-category: Workarounds
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-read
  * SUBTEST: basic-read-context
diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
index 2bb5517c8..ea65579b2 100644
--- a/tests/intel/gen3_mixed_blits.c
+++ b/tests/intel/gen3_mixed_blits.c
@@ -54,7 +54,6 @@
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Category: Obsolete
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
index 681d7b01b..e370c4406 100644
--- a/tests/intel/gen3_render_linear_blits.c
+++ b/tests/intel/gen3_render_linear_blits.c
@@ -53,7 +53,6 @@
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Category: Obsolete
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
index ee42f068b..14fae3e7b 100644
--- a/tests/intel/gen3_render_mixed_blits.c
+++ b/tests/intel/gen3_render_mixed_blits.c
@@ -54,7 +54,6 @@
  * Sub-category: Obsolete_gen3
  * Functionality: obsolete_test
  * Category: Obsolete
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
index ca49576a9..a2748f272 100644
--- a/tests/intel/gen3_render_tiledx_blits.c
+++ b/tests/intel/gen3_render_tiledx_blits.c
@@ -54,7 +54,6 @@
  * Sub-category: Obsolete_gen3
  * Category: Obsolete
  * Functionality: obsolete_test
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
index dfd3ef947..eb63aaa82 100644
--- a/tests/intel/gen3_render_tiledy_blits.c
+++ b/tests/intel/gen3_render_tiledy_blits.c
@@ -54,7 +54,6 @@
  * Sub-category: Obsolete_gen3
  * Category: Obsolete
  * Functionality: obsolete_test
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index 9e99f7a3e..f670f9ce1 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -40,7 +40,6 @@
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: command parser
- * Run type: FULL
  *
  * SUBTEST: basic-allocation
  *
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 9f4929e71..c9d97ba7a 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -39,7 +39,6 @@
  * Sub-category: Blitter
  * Functionality: command parser
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: allowed-all
  *
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index e1dc54cc5..1e42555b2 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -30,7 +30,6 @@
  * Sub-category: Memory management
  * Category: Desktop client
  * Functionality: tiling
- * Run type: FULL
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index 971c35e55..3518a3b9f 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -36,7 +36,6 @@
  * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
  * Feature: gem_core
  * Functionality: device topology
- * Run type: BAT
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 0749a9900..47bc4cdd2 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -53,55 +53,46 @@
  * Description:
  *   Check that hang detector works
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: engine-engine-error
  * Description:
  *   Per engine hang recovery (invalid CS, engine reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: engine-engine-hang
  * Description:
  *   Per engine hang recovery (spin, engine reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: engine-error-state-capture
  * Description:
  *   Per engine error capture (engine reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: error-state-basic
  * Description:
  *   Basic error capture
  *   error detection
- * Run type: BAT
  *
  * SUBTEST: gt-engine-error
  * Description:
  *   Per engine hang recovery (invalid CS, GT reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: gt-engine-hang
  * Description:
  *   Per engine hang recovery (spin, GT reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: gt-error-state-capture
  * Description:
  *   Per engine error capture (GT reset)
  *   error detection
- * Run type: FULL
  *
  * SUBTEST: hangcheck-unterminated
  * Description:
  *   Check that executing unintialised memory causes a hang
  *   error detection
- * Run type: FULL
  */
 
 #ifndef I915_PARAM_CMD_PARSER_VERSION
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 3e5957683..6cde9274e 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -31,16 +31,13 @@
  * Functionality: driver handler
  * Sub-category: driver
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: load
  * Description: Check if i915 and friends are not yet loaded, then load them.
- * Run type: BAT
  *
  * SUBTEST: reload
  * Description: Verify the basic functionality of i915 driver after it's reloaded.
  * Feature: core, sriov-core
- * Run type: BAT
  *
  * SUBTEST: reload-no-display
  * Description: Verify that i915 driver can be successfully loaded with disabled display.
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index 436acdaeb..cc62b1947 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -34,7 +34,6 @@
  * Description: Check that igt/i915 know about this PCI-ID
  * Feature: core
  * Functionality: device management
- * Run type: BAT
  * Sub-category: Core
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index a487f70de..6c5e951ab 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -28,7 +28,6 @@
  * Mega feature: General Display Features
  * Sub-category: Display
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: stress-xrgb8888-untiled
  * Description:
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index aa2de74c9..7766be82d 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -14,7 +14,6 @@
  * Category: Infrastructure
  * Sub-category: uapi
  * Functionality: slpc
- * Run type: FULL
  *
  * SUBTEST: freq-basic-api
  * Description: Test basic API for controlling min/max GT frequency
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index 8f59be1bd..3c390d427 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -18,7 +18,6 @@
  * Functionality: freq multipliers
  * Test category: i915
  * Sub-category: Power management
- * Run type: FULL
  *
  * SUBTEST: media-freq
  * Description: Tests for media frequency factor sysfs
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 67ae1f1f9..be9f9117a 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -47,7 +47,6 @@
  * Functionality: rc6
  * Sub-category: Power management
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: media-rc6-accuracy
  * Feature: pm_rc6
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index be8d5fd77..8ea3fd315 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -47,7 +47,6 @@
  * Sub-category: Power management
  * Category: Desktop client
  * Test category: pm_rpm
- * Run type: FULL
  *
  * SUBTEST: debugfs-forcewake-user
  * SUBTEST: debugfs-read
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 3d8fbcb8f..5aa5c6dbb 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -52,10 +52,8 @@
  * Functionality: rps
  * Sub-category: Power management
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: basic-api
- * Run type: BAT
  *
  * SUBTEST: engine-order
  * Description:
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 354403ef2..11df4f06c 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -42,7 +42,6 @@
  * Sub-category: Power management
  * Category: Desktop client
  * Functionality: sseu
- * Run type: FULL
  *
  * SUBTEST: full-enable
  */
diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
index 0f083b375..fe8437a0f 100644
--- a/tests/intel/i915_power.c
+++ b/tests/intel/i915_power.c
@@ -11,7 +11,6 @@
  * TEST: i915 power
  * Description: i915 power measurement tests
  * Feature: hwmon
- * Run type: FULL
  * Test category: GEM_Legacy
  * Sub-category: Power management
  * Category: Desktop client
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 4a82b13c6..6da974fd1 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -35,7 +35,6 @@
  * Functionality: device topology
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: engine-info
  * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index dff0a4efd..edacb6250 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -32,7 +32,6 @@
  * Sub-category: Selftest
  * Category: Selftest
  * Functionality: live selftest
- * Run type: BAT
  *
  * SUBTEST: live@active
  * Category: Selftest
@@ -373,7 +372,6 @@
  * Feature: gem_core
  * Sub-category: Selftest
  * Functionality: mock selftest
- * Run type: FULL
  *
  * SUBTEST: mock@buddy
  * Category: Selftest
@@ -527,7 +525,6 @@
  * Feature: i915 perf selftests
  * Functionality: oa
  * Sub-category: Performance
- * Run type: FULL
  *
  * SUBTEST: perf@blt
  * Category: Selftest
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index ba758c42b..ae4404101 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -52,7 +52,6 @@
  * Functionality: suspend
  * Sub-category: Power management
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: basic-s2idle-without-i915
  * Description: Validate suspend-to-idle without i915 module
@@ -61,7 +60,6 @@
  * Description:
  *   Validate S3 without i915 module.
  *   Validate S3 state without i915 module
- * Run type: BAT
  *
  * SUBTEST: debugfs-reader
  * Description: Test debugfs behavior during suspend to idle
diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index c3e5033d5..7c6ee0100 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -14,7 +14,6 @@
  * Category: Software Building Block
  * Sub-category: RAS
  * Functionality: hwmon
- * Run type: FULL
  * Test category: functionality
  *
  * SUBTEST: hwmon-read
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 44a0acf8d..651ea9fd8 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -53,7 +53,6 @@
  * Functionality: oa
  * Sub-category: Performance
  * Category: Desktop client
- * Run type: FULL
  *
  * SUBTEST: blocking
  * Description: Test blocking read with default hrtimer frequency
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 220d41748..e3d2f4664 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -57,7 +57,6 @@
  * Sub-category: Performance
  * Category: Desktop client
  * Functionality: pmu
- * Run type: FULL
  *
  * SUBTEST: all-busy-check-all
  * Description: Test the i915 pmu perf interface
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 79f5922a9..66af5f8a3 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -32,7 +32,6 @@
  * Description: Basic check of polling for prime fences.
  * Feature: prime
  * Functionality: buffer management
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index e0735496a..3c0a0c0e5 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -55,7 +55,6 @@
  * Category: Infrastructure
  * Feature: prime
  * Functionality: prime mmap
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index 61bc5d312..3db79156d 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -39,7 +39,6 @@
  *   we need the sync ioctls.
  * Feature: prime
  * Functionality: prime mmap
- * Run type: FULL
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 683665752..35d1eedde 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -42,7 +42,6 @@ IGT_TEST_DESCRIPTION(
  * Category: Infrastructure
  * Feature: prime
  * Functionality: memory management
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index e1dcebfd8..7bf947cf4 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -53,7 +53,6 @@
  * Functionality: buffer management
  * Sub-category: Memory management
  * Test category: GEM_Legacy
- * Run type: BAT
  *
  * SUBTEST: basic-llseek-bad
  * Description: Check dmabuf llseek support with invalid values.
@@ -75,11 +74,9 @@
  *
  * SUBTEST: export-vs-gem_close-race
  * Description: Check race of gem close against prime export.
- * Run type: FULL
  *
  * SUBTEST: reimport-vs-gem_close-race
  * Description: Check race of gem close against reimport.
- * Run type: FULL
  */
 
 IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index a80f7126c..0be8232d5 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -40,7 +40,6 @@
  * Functionality: sysfs
  * Sub-category: uapi
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: readonly
  */
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index 8c6c448fa..5f82185bc 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -48,7 +48,6 @@
  * Sub-category: SysMan
  * Category: Desktop \ Server
  * Functionality: sysfs heartbeat
- * Run type: FULL
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the heartbeat parameter reports the values set.
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 0663c347a..84f8ba7d3 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -47,7 +47,6 @@
  * Sub-category: SysMan
  * Category: Desktop \ Server
  * Functionality: sysfs preempt timeout
- * Run type: FULL
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the preempt_timeout parameter reports the
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index e8dd2677e..b48152ecc 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -50,7 +50,6 @@
  * Functionality: timeslise sysfs
  * Sub-category: SysMan
  * Category: Desktop \ Server
- * Run type: FULL
  *
  * SUBTEST: duration
  * Description: Test to measure the timeslice duration by watching the
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index a582703c1..9e5d0644a 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -19,7 +19,6 @@
  * Category: Software building block
  * Sub-category: driver
  * Functionality: Per client memory statistics
- * Run type: FULL
  * Test category: SysMan
  *
  * SUBTEST: basic
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index fcbed6249..3aa247353 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -498,7 +498,6 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  * @system:	system region
  *
  * Functionality: pm-d3
- * Run type: FULL
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 {
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 3fa9abf25..0d8ead6a2 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -54,7 +54,6 @@ enum test_type {
  * SUBTEST: idle-residency-on-exec
  * Description: Validate idle residency measured when a background
  *		load is only active for ~1% of the time
- * Run type: FULL
  *
  * SUBTEST: gt-c6-freeze
  * Description: Validate idle residency measured over suspend(s2idle)
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 3bdc1e5e2..9f844fa80 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -227,12 +227,10 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 /**
  * SUBTEST: spin-fixed-duration
  * Description: Basic test which validates the functionality of xe_spin with fixed duration.
- * Run type: FULL
  */
 /**
  * SUBTEST: spin-fixed-duration-with-preempter
  * Description: Basic test which validates the functionality of xe_spin preemption which gets preempted with a short duration high-priority task.
- * Run type: FULL
  */
 static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 {
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index f6f797d43..5a67148ed 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -142,7 +142,6 @@ waitfence(int fd, enum waittype wt)
  * Category: Software building block
  * Sub-category: waitfence
  * Functionality: waitfence
- * Run type: FULL
  * Test category: negative test
  *
  * SUBTEST: invalid-flag
diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index a33e2202b..29cc9a8a7 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -13,7 +13,6 @@
  * Description: Basic api tests between intel and nouveau
  * Sub-category: uapi
  * Functionality: intel-nouveau
- * Run type: FULL
  *
  * SUBTEST: i915_nv_import_twice
  * SUBTEST: i915_nv_import_twice_check_flink_name
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index ecaa9fb1b..103f67235 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -18,7 +18,6 @@
  * Description: Basic set of prime tests between intel and nouveau
  * Sub-category: intel-nouveau
  * Functionality: buffer management
- * Run type: FULL
  *
  * SUBTEST: test1_macro
  * SUBTEST: test1_micro
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index be9e56414..c8c4337e3 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -18,7 +18,6 @@
  * Description: Basic set of prime tests between intel and nouveau
  * Sub-category: intel-nouveau
  * Functionality: buffer management
- * Run type: FULL
  *
  * SUBTEST: i915_nv_sharing
  * SUBTEST: nv_i915_sharing
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index e21bedc94..fa19d8e64 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -38,7 +38,6 @@
  * Functionality: mock device
  * Sub-category: DRM
  * Test category: GEM_Legacy
- * Run type: FULL
  *
  * SUBTEST: basic-blt
  * Description: Examine blitter access path.
@@ -48,32 +47,26 @@
  *
  * SUBTEST: basic-fence-flip
  * Description: Examine vgem bo front/back flip fencing.
- * Run type: BAT
  *
  * SUBTEST: basic-fence-mmap
  * Description: Examine GTT access path fencing.
  * Feature: gtt, prime
- * Run type: BAT
  *
  * SUBTEST: basic-fence-read
  * Description: Examine read access path fencing.
  * Feature: gtt, prime
- * Run type: BAT
  *
  * SUBTEST: basic-gtt
  * Description: Examine access path through GTT.
  * Feature: gtt, prime
- * Run type: BAT
  *
  * SUBTEST: basic-read
  * Description: Examine read access path.
  * Feature: gtt, prime
- * Run type: BAT
  *
  * SUBTEST: basic-write
  * Description: Examine write access path.
  * Feature: gtt, prime
- * Run type: BAT
  *
  * SUBTEST: busy
  * Description: Examine busy check of polling for vgem fence.
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index b2b63c702..f58b3b7ba 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -22,7 +22,6 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
  * SUBTEST: enable-vfs-autoprobe-off
  * Description:
  *   Verify VFs enabling without probing VF driver
- * Run type: BAT
  */
 static void enable_vfs_autoprobe_off(int pf_fd, unsigned int num_vfs)
 {
@@ -39,7 +38,6 @@ static void enable_vfs_autoprobe_off(int pf_fd, unsigned int num_vfs)
  * SUBTEST: enable-vfs-autoprobe-on
  * Description:
  *   Verify VFs enabling and auto-probing VF driver
- * Run type: FULL
  */
 static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
 {
@@ -65,7 +63,6 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
  * SUBTEST: enable-vfs-bind-unbind-each
  * Description:
  *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
- * Run type: BAT
  */
 static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
 {
@@ -94,7 +91,6 @@ static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
  * SUBTEST: bind-unbind-vf
  * Description:
  *   Verify binding and unbinding the driver to specific VF
- * Run type: BAT
  */
 static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
 {
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 8ea3dbe6c..a276c4a22 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -44,7 +44,6 @@
  * Description: Test SW Sync Framework
  * Feature: semaphore
  * Functionality: sw sync framework
- * Run type: FULL
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index 18bef7c5c..d1ea872cf 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -32,7 +32,6 @@
  * Description: Basic check for drm sync objects.
  * Feature: semaphore
  * Functionality: drm sync object
- * Run type: FULL
  * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
index 6ca89c87a..e89dfa414 100644
--- a/tests/syncobj_eventfd.c
+++ b/tests/syncobj_eventfd.c
@@ -17,7 +17,6 @@
  * Description: Tests for the drm sync object eventfd API
  * Feature: synchronization
  * Functionality: semaphore
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  */
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index f369c5fe1..f7e33604d 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -34,7 +34,6 @@
  * TEST: syncobj timeline
  * Category: Infrastructure
  * Description: Tests for the drm timeline sync object API
- * Run type: FULL
  * Feature: synchronization feature
  * Functionality: sync_object
  * Sub-category: uapi
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index bc4e3378c..571e3c2af 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -36,7 +36,6 @@
  * Description: Tests for the drm sync object wait API
  * Feature: synchronization feature
  * Functionality: object wait
- * Run type: FULL
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index ece34f656..cb92efbf5 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -39,7 +39,6 @@
  * Sub-category: Core
  * Test category: GEM_Legacy
  * Feature: vgem
- * Run type: FULL
  *
  * SUBTEST: bad-fence
  * Description: Make sure a non-existent fence cannot be signaled.
@@ -58,51 +57,40 @@
  *
  * SUBTEST: create
  * Description: Check the basic working of vgem_create ioctl.
- * Run type: BAT
  *
  * SUBTEST: debugfs
  * Description: Check the basic access to debugfs and also try to read entries in the directory.
- * Run type: BAT
  *
  * SUBTEST: dmabuf-export
  * Description: Check whether it can export/import the vgem handle using prime.
  * Feature: prime, vgem
- * Run type: BAT
  *
  * SUBTEST: dmabuf-fence
  * Description: Check the working of dma-buf fence interop.
  * Feature: prime, vgem
- * Run type: BAT
  *
  * SUBTEST: dmabuf-fence-before
  * Description: Attach a fence before exporting a vgem handle and check the working of fence.
  * Feature: prime, vgem
- * Run type: BAT
  *
  * SUBTEST: dmabuf-mmap
  * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
  * Feature: prime, vgem
- * Run type: BAT
  *
  * SUBTEST: mmap
  * Description: Create a vgem handle and check if it can be mmaped.
- * Run type: BAT
  *
  * SUBTEST: second-client
  * Description: Check whether it can open multiple clients.
- * Run type: BAT
  *
  * SUBTEST: setversion
  * Description: Check the working of SET_VERSION ioctl.
- * Run type: BAT
  *
  * SUBTEST: sysfs
  * Description: Check the basic access to sysfs and also try to read entries in the directory.
- * Run type: BAT
  *
  * SUBTEST: unload
  * Description: Basic test for handling of module unload.
- * Run type: BAT
  */
 
 IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index cb9436628..35761a4ee 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -36,7 +36,6 @@
  * Description: Extended sanity check of Virtual GEM module (vGEM).
  * Feature: vgem
  * Functionality: mock device
- * Run type: FULL
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
-- 
2.34.1

