Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115DC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 14:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AB610E6AC;
	Tue, 18 Jun 2024 14:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmtakMTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B6410E6B8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718720851; x=1750256851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qv6xUNwqDyXR2f5G5gCDGYljNuvolq8nHHC/hekDzk0=;
 b=YmtakMTtibAvtVlFavfs6AJCvdWDiLAHWvp7bQiCbNMH20d2LvawWh2x
 eJbJzJtO6ncmUDmKFS15JuLO5EPnyrIVFIuuv9+WeVJKXX78GS90jJn3Z
 T2RwHSNjRoYCBzsNtn70MSpWHJIiKAjcxFvq+/3XP7s+ch3S3TBuhnhfd
 R7YYPuVsZvRvt7BdfmWheaXFRTAuRmBpQzj2aybyMbsHONry1nEmTHl0d
 AI+C/sBFL1UzUEuur53dfsfxsaOkYzABIc2xCj+jyzw2zz116jRGvsC+U
 oyxLZk38Wm2ZnVc39zsETLKj7TVd6YNK58o376kEftHG9s/SqRjfNPk66 w==;
X-CSE-ConnectionGUID: cHewRzf2QkGdRaTb59xVfg==
X-CSE-MsgGUID: lbb68D4/SJOxKtR3E/GGPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33073958"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33073958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:30 -0700
X-CSE-ConnectionGUID: 4JFI5xzYQbWxULySL/duQQ==
X-CSE-MsgGUID: /8wnvFg6QzqsPRKfYZji1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41676352"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:28 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 3/4] tests: Adding 'Test category' to test that did not
 have it
Date: Tue, 18 Jun 2024 14:26:49 +0000
Message-Id: <20240618142650.1991834-4-katarzyna.piecielska@intel.com>
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

Let's add 'Test category' to all tests that do not have it.

Test category should reflect main test purpose:
 * functionality test - all testing for driver, HW or uapi that are not
a stress or negative testing
 * stress test - stress cases to reveal corner cases, e.g. huge memory usage,
many parallel operations, races etc.
 * negative test - check that invalid behaviors will not break anything

On exception - tests/intel/gen3_* tests which are Obsolete.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Peter Senna Tschudin <me@petersenna.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/drm_fdinfo.c                     |  1 +
 tests/intel/gem_bad_reloc.c                  |  1 +
 tests/intel/gem_ccs.c                        |  1 +
 tests/intel/gem_create.c                     |  1 +
 tests/intel/gem_ctx_engines.c                |  1 +
 tests/intel/gem_ctx_exec.c                   |  1 +
 tests/intel/gem_ctx_param.c                  |  3 +++
 tests/intel/gem_ctx_sseu.c                   |  4 ++++
 tests/intel/gem_ctx_switch.c                 |  1 +
 tests/intel/gem_evict_alignment.c            |  1 +
 tests/intel/gem_evict_everything.c           |  1 +
 tests/intel/gem_exec_balancer.c              |  2 ++
 tests/intel/gem_exec_fair.c                  |  1 +
 tests/intel/gem_exec_fence.c                 |  5 +++-
 tests/intel/gem_exec_flush.c                 |  1 +
 tests/intel/gem_exec_latency.c               |  1 +
 tests/intel/gem_exec_lut_handle.c            |  1 +
 tests/intel/gem_exec_reloc.c                 |  1 +
 tests/intel/gem_exec_suspend.c               |  1 +
 tests/intel/gem_fd_exhaustion.c              |  1 +
 tests/intel/gem_fence_thrash.c               |  1 +
 tests/intel/gem_fence_upload.c               |  1 +
 tests/intel/gem_fenced_exec_thrash.c         |  1 +
 tests/intel/gem_flink_basic.c                |  3 +++
 tests/intel/gem_gtt_cpu_tlb.c                |  2 ++
 tests/intel/gem_gtt_hog.c                    |  1 +
 tests/intel/gem_gtt_speed.c                  |  1 +
 tests/intel/gem_huc_copy.c                   |  1 +
 tests/intel/gem_lut_handle.c                 |  1 +
 tests/intel/gem_media_fill.c                 |  1 +
 tests/intel/gem_media_vme.c                  |  1 +
 tests/intel/gem_mmap.c                       |  4 ++++
 tests/intel/gem_mmap_gtt.c                   |  1 +
 tests/intel/gem_mmap_wc.c                    |  7 ++++++
 tests/intel/gem_partial_pwrite_pread.c       |  1 +
 tests/intel/gem_pread.c                      |  1 +
 tests/intel/gem_pread_after_blit.c           |  1 +
 tests/intel/gem_pwrite.c                     |  1 +
 tests/intel/gem_pwrite_snooped.c             |  1 +
 tests/intel/gem_pxp.c                        |  4 ++++
 tests/intel/gem_read_read_speed.c            |  1 +
 tests/intel/gem_readwrite.c                  |  1 +
 tests/intel/gem_reg_read.c                   |  1 +
 tests/intel/gem_render_copy.c                |  1 +
 tests/intel/gem_render_copy_redux.c          |  1 +
 tests/intel/gem_render_linear_blits.c        |  1 +
 tests/intel/gem_render_tiled_blits.c         |  1 +
 tests/intel/gem_reset_stats.c                |  1 +
 tests/intel/gem_ringfill.c                   |  4 ++--
 tests/intel/gem_set_tiling_vs_blt.c          |  1 +
 tests/intel/gem_set_tiling_vs_gtt.c          |  1 +
 tests/intel/gem_set_tiling_vs_pwrite.c       |  1 +
 tests/intel/gem_softpin.c                    |  1 +
 tests/intel/gem_streaming_writes.c           |  1 +
 tests/intel/gem_stress.c                     |  1 +
 tests/intel/gem_tiled_blits.c                |  1 +
 tests/intel/gem_tiled_fence_blits.c          |  1 +
 tests/intel/gem_tiled_partial_pwrite_pread.c |  1 +
 tests/intel/gem_tiled_pread_basic.c          |  1 +
 tests/intel/gem_tiled_pread_pwrite.c         |  1 +
 tests/intel/gem_tiled_swapping.c             |  1 +
 tests/intel/gem_tiled_wb.c                   |  1 +
 tests/intel/gem_tiled_wc.c                   |  1 +
 tests/intel/gem_tiling_max_stride.c          |  1 +
 tests/intel/gem_unfence_active_buffers.c     |  1 +
 tests/intel/gem_userptr_blits.c              |  3 +++
 tests/intel/gem_vm_create.c                  |  2 ++
 tests/intel/gem_wait.c                       |  2 ++
 tests/intel/gem_watchdog.c                   |  1 +
 tests/intel/gen7_exec_parse.c                |  1 +
 tests/intel/gen9_exec_parse.c                |  4 ++++
 tests/intel/i915_fb_tiling.c                 |  1 +
 tests/intel/i915_pm_freq_api.c               |  1 +
 tests/intel/i915_pm_rc6_residency.c          |  1 +
 tests/intel/i915_pm_rpm.c                    |  3 +++
 tests/intel/i915_pm_sseu.c                   |  1 +
 tests/intel/i915_query.c                     |  1 +
 tests/intel/i915_selftest.c                  |  2 +-
 tests/intel/perf.c                           |  7 ++++++
 tests/intel/perf_pmu.c                       |  2 ++
 tests/intel/prime_mmap.c                     |  1 +
 tests/intel/prime_self_import.c              |  2 ++
 tests/intel/sysfs_preempt_timeout.c          |  1 +
 tests/intel/sysfs_timeslice_duration.c       |  1 +
 tests/intel/xe_prime_self_import.c           |  2 ++
 tests/intel/xe_query.c                       |  1 +
 tests/sriov_basic.c                          |  1 +
 tests/sw_sync.c                              |  1 +
 tests/syncobj_timeline.c                     | 25 ++++++++++++++++++++
 tests/syncobj_wait.c                         | 23 +++++++++++++++++-
 90 files changed, 178 insertions(+), 5 deletions(-)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index a790f9255..7453b0fba 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -41,6 +41,7 @@
  * Sub-category: driver
  * Functionality: Per client memory statistics
  * Feature: client_busyness
+ * Test category: functionality test
  *
  * SUBTEST: all-busy-check-all
  *
diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index 1cdb988d9..982739a9a 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -50,6 +50,7 @@
  * Sub-category: CMD submission
  * Functionality: relocations
  * Feature: cmd_submission
+ * Test category: negative test
  *
  * SUBTEST: negative-reloc
  * Description: SNA behaviour is compressing batch buffer which leads to
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 6ced67d7a..e53d78a5c 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -24,6 +24,7 @@
  * Sub-category: Flat-ccs tests
  * Functionality: block-copy
  * Feature: flat_ccs_mapping
+ * Test category: functionality test
  *
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 13fb10e43..3a32a77a0 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -104,6 +104,7 @@
  * SUBTEST: create-invalid-size
  * Description: Try to create a gem object of invalid size 0 and check if
  *		ioctl returns error.
+ * Test category: negative test
  *
  * SUBTEST: create-massive
  * Description: Exercise creation of buffer object with impossible size and
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 1dd3814d6..db5f352f8 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -61,6 +61,7 @@
  * SUBTEST: independent
  *
  * SUBTEST: invalid-engines
+ * Test category: negative test
  *
  * SUBTEST: none
  */
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 77c4b91ed..ae242e8dc 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -66,6 +66,7 @@
  *
  * SUBTEST: basic-invalid-context
  * Description: Verify that execbuf with invalid context fails.
+ * Test category: negative test
  *
  * SUBTEST: basic-nohangcheck
  * Description: Verify that contexts are automatically shutdown on close,
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 627227cfe..900fd5812 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -93,6 +93,7 @@
  *
  * SUBTEST: root-set
  * Description: Verify that context set param ioctl works fine in root mode
+ * Test category: functionality test
  *
  * SUBTEST: set-priority-invalid-size
  * Description: Test performed with context param set to priority. Verify that
@@ -107,9 +108,11 @@
  * SUBTEST: set-priority-range
  * Description: Test performed with context param set to priority. Change
  *		priority range to test value overflow
+ * Test category: functionality test
  *
  * SUBTEST: vm
  * Description: Tests that multiple contexts can share the same VMA
+ * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 7d445ba00..a44417a85 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -54,12 +54,16 @@
  * Feature: pm_sseu
  *
  * SUBTEST: engines
+ * Test category: functionality test
  *
  * SUBTEST: invalid-args
+ * Test category: negative test
  *
  * SUBTEST: invalid-sseu
+ * Test category: negative test
  *
  * SUBTEST: mmap-args
+ * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test context render powergating programming.");
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 7a3c72e49..10c089d53 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -52,6 +52,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD Submission
  * Functionality: context switching
+ * Test category: functionality test
  *
  * SUBTEST: all-heavy
  *
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 57aa5df04..6043faa81 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -54,6 +54,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: misalignment
+ * Test category: functionality test
  *
  * SUBTEST: major-hang
  *
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 53e359de7..ae08b8c67 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -55,6 +55,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: eviction
+ * Test category: functionality test
  *
  * SUBTEST: forked-interruptible
  *
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 209c54e7a..96b984a45 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -88,8 +88,10 @@
  * SUBTEST: individual
  *
  * SUBTEST: invalid-balancer
+ * Test category: negative test
  *
  * SUBTEST: invalid-bonds
+ * Test category: negative test
  *
  * SUBTEST: nohangcheck
  *
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 2f7ef3800..7e602f7ea 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -34,6 +34,7 @@
  * Sub-category: CMD submission
  * Functionality: multi-client systems
  * Feature: cmd_submission
+ * Test category: functionality test
  *
  * SUBTEST: basic-deadline
  *
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 01bb0efc1..4332da05f 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -94,15 +94,16 @@
  *
  * SUBTEST: invalid-fence-array
  * Description: Verifies invalid fence-array pointers are rejected.
+ * Test category: negative test
  *
  * SUBTEST: invalid-timeline-fence-array
  * Description: Verifies invalid execbuf parameters in
  *		drm_i915_gem_execbuffer_ext_timeline_fences are rejected
+ * Test category: negative test
  *
  * SUBTEST: keep-in-fence
  * Description: Check in-fence is not overwritten with out-fence on each engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: long-history
  * Description: Verifies accumulation of long history of fences.
@@ -152,10 +153,12 @@
  *
  * SUBTEST: syncobj-invalid-flags
  * Description: Verifies that invalid fence flags in fence-array are rejected.
+ * Test category: negative test
  *
  * SUBTEST: syncobj-invalid-wait
  * Description: Verifies that submitting an execbuf with a wait on a syncobj
  *		that doesn't exists is rejected.
+ * Test category: negative test
  *
  * SUBTEST: syncobj-repeat
  * Description: Verifies that waiting & signaling a same fence-array syncobj
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 795be929c..b62cec4fa 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -35,6 +35,7 @@
  * Sub-category: CMD submission
  * Category: Core
  * Functionality: execbuf
+ * Test category: functionality test
  *
  * SUBTEST: basic-batch-kernel-default-cmd
  * Feature: cmd_submission, command_parser
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index 3492f8503..fe8880551 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -54,6 +54,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
+ * Test category: functionality test
  *
  * SUBTEST: context-preempt
  *
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index 432094bc2..441a9d491 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -47,6 +47,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index d8013ccfc..9cc559764 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -38,6 +38,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: relocations
+ * Test category: functionality test
  *
  * SUBTEST: basic-active
  * Feature: cmd_submission
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 0d08e8e44..851f3577d 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -44,6 +44,7 @@
  * Sub-category: CMD submission
  * Functionality: suspend
  * Feature: cmd_submission, suspend
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check basic functionality without any suspend/resume cycle.
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index 20c4f767c..a62b46089 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -40,6 +40,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: fd exhaustion
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index bce638c27..a7bdd1e29 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -50,6 +50,7 @@
  * Sub-category: CMD submission
  * Functionality: fences
  * Feature: gtt, synchronization
+ * Test category: functionality test
  *
  * SUBTEST: bo-copy
  *
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index 1105fa825..4236c100c 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -47,6 +47,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: fences
+ * Test category: functionality test
  *
  * SUBTEST: performance
  *
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 19d49823a..3e84154d0 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -41,6 +41,7 @@
  * Sub-category: CMD submission
  * Functionality: fences
  * Feature: gtt, synchronization feature
+ * Test category: functionality test
  *
  * SUBTEST: 2-spare-fences
  *
diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index 24ee56b7f..890d6bf12 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -56,12 +56,15 @@
  *
  * SUBTEST: basic
  * Description: Check if gem object can be exported to global namespace and then opened.
+ * Test category: functionality test
  *
  * SUBTEST: double-flink
  * Description: Tests that multiple flinks for the same gem object share the same name.
+ * Test category: functionality test
  *
  * SUBTEST: flink-lifetime
  * Description: Tests flink lifetime by referencing from multiple descriptors.
+ * Test category: functionality test
  *
  */
 
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
index 4dc2f3ca8..f0f119344 100644
--- a/tests/intel/gem_gtt_cpu_tlb.c
+++ b/tests/intel/gem_gtt_cpu_tlb.c
@@ -51,6 +51,8 @@
  * Sub-category: Memory management tests
  * Functionality: mapping
  * Feature: gtt, mapping
+ * Test category: functionality test
+ *
  *
  *
  * SUBTEST:
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index 641dbecd3..6ef90db17 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -48,6 +48,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
index 996e54af0..597425575 100644
--- a/tests/intel/gem_gtt_speed.c
+++ b/tests/intel/gem_gtt_speed.c
@@ -48,6 +48,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
index 8660a9f84..4afead475 100644
--- a/tests/intel/gem_huc_copy.c
+++ b/tests/intel/gem_huc_copy.c
@@ -43,6 +43,7 @@
  * Sub-category: Firmware tests
  * Functionality: HUC
  * Feature: huc
+ * Test category: functionality test
  *
  * SUBTEST: huc-copy
  * Description:
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index 35f06ebe2..8a1268c39 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -46,6 +46,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_media_fill.c b/tests/intel/gem_media_fill.c
index 12e91ccbd..392adf243 100644
--- a/tests/intel/gem_media_fill.c
+++ b/tests/intel/gem_media_fill.c
@@ -53,6 +53,7 @@
  * Sub-category: Media tests
  * Functionality: fill surface with media block
  * Feature: media
+ * Test category: functionality test
  *
  * SUBTEST: media-fill
  */
diff --git a/tests/intel/gem_media_vme.c b/tests/intel/gem_media_vme.c
index 8e503fa0d..659e592ac 100644
--- a/tests/intel/gem_media_vme.c
+++ b/tests/intel/gem_media_vme.c
@@ -43,6 +43,7 @@
  * Sub-category: Media tests
  * Functionality: vme media block
  * Feature: media
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index 829a1e4c1..3659845f3 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -46,15 +46,19 @@
  * Sub-category: Memory management tests
  * Functionality: mapping
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects won't be created.
+ * Test category: negative test
  *
  * SUBTEST: bad-offset
  * Description: Verify mapping to gem object with invalid offset won't be created.
+ * Test category: negative test
  *
  * SUBTEST: bad-size
  * Description: Verify mapping to gem object with invalid size won't be created.
+ * Test category: negative test
  *
  * SUBTEST: basic
  * Description:
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 3bf2e5845..bf3554c4e 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -54,6 +54,7 @@
  * Sub-category: Memory management tests
  * Functionality: map gtt
  * Feature: gtt
+ * Test category: functionality test
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects fails.
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 487027af9..7a2d01572 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -46,10 +46,17 @@
  * Sub-category: Memory management tests
  * Functionality: cache
  * Feature: caching, mapping
+ * Test category: functionality test
  *
  * SUBTEST: bad-object
+ * Test category: negative test
+ *
  * SUBTEST: bad-offset
+ * Test category: negative test
+ *
  * SUBTEST: bad-size
+ * Test category: negative test
+ *
  * SUBTEST: close
  * SUBTEST: coherency
  * SUBTEST: copy
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index c98317766..0cc7fe5ec 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -46,6 +46,7 @@
  * Sub-category: CMD submission
  * Functionality: pread/pwrite
  * Feature: caching, mapping
+ * Test category: functionality test
  *
  * SUBTEST: reads
  * Description:
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index e5e662361..327c17a02 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -52,6 +52,7 @@
  * Sub-category: CMD submission
  * Functionality: pread
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: bench
  *
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index a793b53cd..3735e76f1 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -54,6 +54,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: pread
+ * Test category: functionality test
  *
  * SUBTEST: default-hang
  *
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index 025684a33..3cd7f1765 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -53,6 +53,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: pwrite
+ * Test category: functionality test
  *
  * SUBTEST: basic-exhaustion
  *
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index 60ccdc7aa..18b2f6085 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -44,6 +44,7 @@
  * Sub-category: CMD submission
  * Category: Core
  * Functionality: pwrite
+ * Test category: functionality test
  *
  * SUBTEST:
  * Mega feature: General Core features
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 6be19318a..23e27e996 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -15,6 +15,7 @@
  * Sub-category: driver
  * Functionality: pxp
  * Feature: Protected Xe Path
+ * Test category: functionality test
  *
  * SUBTEST: create-protected-buffer
  *
@@ -35,12 +36,15 @@
  * Feature: PXP, prime
  *
  * SUBTEST: fail-invalid-protected-context
+ * Test category: negative test
  *
  * SUBTEST: hw-rejects-pxp-buffer
  * Description: Verify protected buffer on unsupported hw:
+ * Test category: negative test
  *
  * SUBTEST: hw-rejects-pxp-context
  * Description: Verify protected context on unsupported hw:
+ * Test category: negative test
  *
  * SUBTEST: protected-encrypted-src-copy-not-readible
  *
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 5cf80fee6..3e9d22e1f 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -49,6 +49,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: read/write memory
+ * Test category: stress test
  *
  * SUBTEST: read-read-1024x1024
  *
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index f3d0c4fbf..e4a307581 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -45,6 +45,7 @@
  * Sub-category: Memory management tests
  * Functionality: read/write memory
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: beyond-EOB
  *
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index 5559c4d0a..c7a9326ae 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -39,6 +39,7 @@
  * Sub-category: uapi
  * Functionality: ioctl
  * Feature: gem_core
+ * Test category: functionality test
  *
  * SUBTEST: bad-register
  *
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 3a46859bc..2873225b8 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -56,6 +56,7 @@
  * Sub-category: Render copy
  * Functionality: render_copy
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: linear
  * Description: Test render_copy() from a mixed-tiled to a linear buffer.
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 1971bfebd..89662f9fd 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -55,6 +55,7 @@
  * Mega feature: Render
  * Sub-category: Render copy
  * Functionality: render_copy
+ * Test category: functionality test
  *
  * SUBTEST: flink
  * Feature: mapping, xorg_dri2
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 6a5e51c2a..fd3dac44c 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -56,6 +56,7 @@
  * Sub-category: CMD submission
  * Functionality: render blits
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: aperture-shrink
  *
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 892c9c42a..9d61de7bf 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -59,6 +59,7 @@
  * Sub-category: CMD submission
  * Functionality: render blits
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST: aperture-shrink
  * Description:
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 91bec96c0..213b60e15 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -53,6 +53,7 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: reset
+ * Test category: functionality test
  *
  * SUBTEST: ban-blt
  *
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 69ace7d39..786715df8 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -70,13 +70,13 @@
  *   Basic check how the driver handles a full ring.
  *   Test spamming ring with contexts
  * Feature: cmd_submission, multitile
- * Test category: MultiTile
  *
  * SUBTEST: engines-bomb
  * Description:
  *   Fills the ring upto maximim parallely using fork with different fd's along with
  *   interruptions.
  * Feature: cmd_submission, multitile
+ * Test category: stress test
  *
  * SUBTEST: engines-child
  * Description: Check to fill the ring parallely using fork.
@@ -113,13 +113,13 @@
  *   Basic check how the driver handles a full ring - on legacy ring.
  *   Test spamming ring with contexts - legacy path
  * Feature: cmd_submission, multitile
- * Test category: MultiTile
  *
  * SUBTEST: legacy-bomb
  * Description:
  *   Fills the ring upto maximim parallely using fork with different fd's along with
  *   interruptions - on legacy ring.
  * Feature: cmd_submission, multitile
+ * Test category: stress test
  *
  * SUBTEST: legacy-child
  * Description: Check to fill the ring parallely using fork - on legacy ring.
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index f78196fff..045d222f6 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -65,6 +65,7 @@
  * Sub-category: Blitter tests
  * Functionality: tiling
  * Feature: blitter, gtt
+ * Test category: functionality test
  *
  * SUBTEST: tiled-to-tiled
  * Description: Check for proper synchronization of tiled->tiled transition.
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
index bfb9060be..b6350fed6 100644
--- a/tests/intel/gem_set_tiling_vs_gtt.c
+++ b/tests/intel/gem_set_tiling_vs_gtt.c
@@ -46,6 +46,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiling vs gtt coherency
  * Feature: gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
index 1aa38cc4f..c8c38708b 100644
--- a/tests/intel/gem_set_tiling_vs_pwrite.c
+++ b/tests/intel/gem_set_tiling_vs_pwrite.c
@@ -46,6 +46,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiling vs pwrite coherency
  * Feature: gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index 776dbc9b3..fe1198c20 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -95,6 +95,7 @@
  *
  * SUBTEST: invalid
  * Description: Check that invalid inputs are handled correctly.
+ * Test category: negative test
  *
  * SUBTEST: noreloc
  * Description: Check that noreloc support works.
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index ea8c6db23..19b2e3d3a 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -47,6 +47,7 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: barrier
+ * Test category: functionality test
  *
  * SUBTEST: batch-cpu
  *
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index 19a33b7e7..2f71d4169 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -68,6 +68,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: coherency
+ * Test category: stress test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index 6fcc8616e..402594b19 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -62,6 +62,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiled blits
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index 5e5bc6939..cd6fc8972 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -55,6 +55,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiled blits
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index 7e5a27660..450d6ea35 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -46,6 +46,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST: reads
  *
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index 49ce207a6..1c3ad481c 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -56,6 +56,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
index 3e9855d5a..1a54606b3 100644
--- a/tests/intel/gem_tiled_pread_pwrite.c
+++ b/tests/intel/gem_tiled_pread_pwrite.c
@@ -66,6 +66,7 @@
  * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 1a9de5d2f..b8ca22672 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -66,6 +66,7 @@
  * Sub-category: Memory management tests
  * Functionality: swapping
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST: non-threaded
  *
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
index 0f8e66af4..a0bd7286e 100644
--- a/tests/intel/gem_tiled_wb.c
+++ b/tests/intel/gem_tiled_wb.c
@@ -55,6 +55,7 @@
  * Sub-category: Memory management tests
  * Functionality: cache
  * Feature: caching, gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
index 20cc64aad..4f3814796 100644
--- a/tests/intel/gem_tiled_wc.c
+++ b/tests/intel/gem_tiled_wc.c
@@ -52,6 +52,7 @@
  * Sub-category: Memory management tests
  * Functionality: cache
  * Feature: caching, gtt
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index da3d481ef..984d04619 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -47,6 +47,7 @@
  * Sub-category: CMD submission
  * Functionality: fences
  * Feature: gtt, mapping
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
index ce0a68de8..3758cb25a 100644
--- a/tests/intel/gem_unfence_active_buffers.c
+++ b/tests/intel/gem_unfence_active_buffers.c
@@ -60,6 +60,7 @@
  * Sub-category: Memory management tests
  * Functionality: use-after-free
  * Feature: synchronization
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index ed4f842ce..8795bacef 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -122,8 +122,11 @@
  *
  * SUBTEST: invalid-mmap-offset-unsync
  * Description: Verify unsynchronized userptr on mmap-offset mappings fails
+ * Test category: negative test
  *
  * SUBTEST: invalid-null-pointer
+ * Test category: negative test
+ *
  * SUBTEST: major-normal-sync
  * SUBTEST: major-sync-interruptible
  * SUBTEST: major-unsync-interruptible
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 5851e6ca5..81db7288f 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -44,9 +44,11 @@
  *
  * SUBTEST: invalid-create
  * Feature: mapping
+ * Test category: negative test
  *
  * SUBTEST: invalid-destroy
  * Feature: mapping
+ * Test category: negative test
  *
  * SUBTEST: isolation
  * Feature: context feature, mapping
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index b789b0faa..f93f6924a 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -65,9 +65,11 @@
  *
  * SUBTEST: invalid-buf
  * Description: Verify that GEM_WAIT called with invalid buffer object will fail.
+ * Test category: negative test
  *
  * SUBTEST: invalid-flags
  * Description: Verify that GEM_WAIT called with invalid flag will fail.
+ * Test category: negative test
  *
  * SUBTEST: wait
  * Description: Verify GEM_WAIT functionality in wait mode.
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 3d2fd68a8..55002aca1 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -42,6 +42,7 @@
  * Sub-category: CMD submission
  * Functionality: fences
  * Feature: gem_core
+ * Test category: functionality test
  *
  * SUBTEST: default-physical
  *
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index d0dd21d08..249d13323 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -41,6 +41,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: command submission
+ * Test category: functionality test
  *
  * SUBTEST: basic-allocation
  *
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index dcce24835..cc95b2450 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -40,6 +40,7 @@
  * Sub-category: Blitter tests
  * Functionality: command parser
  * Feature: blitter, command_parser
+ * Test category: functionality test
  *
  * SUBTEST: allowed-all
  *
@@ -50,10 +51,13 @@
  * SUBTEST: basic-rejected-ctx-param
  *
  * SUBTEST: batch-invalid-length
+ * Test category: negative test
  *
  * SUBTEST: batch-without-end
+ * Test category: negative test
  *
  * SUBTEST: batch-zero-length
+ * Test category: negative test
  *
  * SUBTEST: bb-chained
  *
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 849e37164..03f7add29 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -31,6 +31,7 @@
  * Sub-category: Memory management tests
  * Functionality: object tiling
  * Feature: mapping
+ * Test category: functionality test
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index 2a3da6f4a..24c88d2e0 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -15,6 +15,7 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: slpc
+ * Test category: functionality test
  *
  * SUBTEST: freq-basic-api
  * Description: Test basic API for controlling min/max GT frequency
diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index ebc0c235c..56cf10d3f 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -48,6 +48,7 @@
  * Sub-category: Power management tests
  * Functionality: rc6
  * Feature: GuCRC, pm_rc6
+ * Test category: functionality test
  *
  * SUBTEST: media-rc6-accuracy
  * Feature: pm_rc6
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 709eb1dbc..47944c4fd 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -56,8 +56,11 @@
  *
  * SUBTEST: gem-execbuf-stress
  * Description: Validate execbuf submission while exercising rpm suspend/resume cycles.
+ * Test category: stress test
  *
  * SUBTEST: gem-execbuf-stress-pc8
+ * Test category: stress test
+ *
  * SUBTEST: gem-idle
  * SUBTEST: gem-mmap-type
  * SUBTEST: gem-pread
diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 13493933a..1958dc789 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -43,6 +43,7 @@
  * Sub-category: Power management tests
  * Functionality: sseu
  * Feature: pm_sseu
+ * Test category: functionality test
  *
  * SUBTEST: full-enable
  */
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index e282a33b4..ee06e206b 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -79,6 +79,7 @@
  * SUBTEST: query-topology-unsupported
  * Description: Verify DRM_I915_QUERY_TOPOLOGY_INFO query fails when it is not supported
  * Feature: gem_core, no-query-topology
+ * Test category: negative test
  *
  * SUBTEST: test-query-geometry-subslices
  * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index aa29eb36a..49271a672 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -26,6 +26,7 @@
 /**
  * TEST: i915 selftest
  * Description: Basic unit tests for i915.ko
+ * Test category: functionality test
  *
  * SUBTEST: live
  * Category: Core
@@ -39,7 +40,6 @@
  * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: semaphore
- * Test category: i915
  *
  * SUBTEST: live@blt
  * Description: Blitter validation
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 5b579f9b1..2fb9e877d 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -115,21 +115,27 @@
  *
  * SUBTEST: invalid-create-userspace-config
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: invalid-oa-exponent
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: invalid-oa-format-id
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: invalid-oa-metric-set-id
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: invalid-open-flags
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: invalid-remove-userspace-config
  * Description: Test the i915 perf metrics streaming interface
+ * Test category: negative test
  *
  * SUBTEST: low-oa-exponent-permissions
  * Description: Test the i915 perf metrics streaming interface
@@ -176,6 +182,7 @@
  * SUBTEST: stress-open-close
  * Description: Stress tests opening & closing the i915-perf stream in a busy loop
  * Feature: oa perf
+ * Test category: stress test
  *
  * SUBTEST: sysctl-defaults
  * Description: Test the i915 perf metrics streaming interface
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index ebefa3eef..1b0dfe14f 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -142,9 +142,11 @@
  *
  * SUBTEST: invalid-init
  * Description: Tests that i915 PMU corectly errors out in invalid initialization
+ * Test category: negative test
  *
  * SUBTEST: invalid-open
  * Description: Test the i915 pmu perf interface
+ * Test category: negative test
  *
  * SUBTEST: module-unload
  * Description: Test the i915 pmu perf interface
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index def3fe08e..bb40b01e9 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -74,6 +74,7 @@
  * SUBTEST: test_forked_cpu_write
  *
  * SUBTEST: test_invalid_sync_flags
+ * Test category: negative test
  *
  * SUBTEST: test_map_unmap
  *
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index d58134986..9f6be1484 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -75,9 +75,11 @@
  *
  * SUBTEST: export-vs-gem_close-race
  * Description: Check race of gem close against prime export.
+ * Test category: stress test
  *
  * SUBTEST: reimport-vs-gem_close-race
  * Description: Check race of gem close against reimport.
+ * Test category: stress test
  */
 
 IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 51dac116a..3526132b6 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -56,6 +56,7 @@
  * SUBTEST: invalid
  * Description: Test to check if preempt_timeout parameter rejects any
  *		unrepresentable intervals.
+ * Test category: negative test
  *
  * SUBTEST: off
  *
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index dcc231465..b3332aa98 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -64,6 +64,7 @@
  * SUBTEST: invalid
  * Description: Test to check if timeslice parameter rejects any unrepresentable
  *		intervals.
+ * Test category: negative test
  *
  * SUBTEST: off
  *
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index ba1718022..784c9501e 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -290,6 +290,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 /**
  * SUBTEST: reimport-vs-gem_close-race
  * Description: Reimport versus gem_close race
+ * Test category: negative test
  */
 
  static void test_reimport_close_race(void)
@@ -393,6 +394,7 @@ static void *thread_fn_export_vs_close(void *p)
 /**
  * SUBTEST: export-vs-gem_close-race
  * Description: Export versus gem_close race test
+ * Test category: negative test
  */
 
 static void test_export_close_race(void)
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5b0db4d28..5bdbe2917 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -10,6 +10,7 @@
  * Sub-category: uapi
  * Functionality: ioctl
  * Description: Acquire configuration data for xe device
+ * Test category: functionality test
  */
 
 #include <string.h>
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 95a462709..0eccb64d2 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -16,6 +16,7 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
  * Sub-category: VFs enabling
  * Functionality: configure / enable VFs
  * Description: Validate SR-IOV VFs enabling
+ * Test category: functionality test
  */
 
 /**
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index d32376f19..876122c71 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -68,6 +68,7 @@
  * SUBTEST: sync_merge
  *
  * SUBTEST: sync_merge_invalid
+ * Test category: negative test
  *
  * SUBTEST: sync_merge_same
  *
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index eb309d37d..846372f67 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -149,15 +149,19 @@
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: etime-multi-wait-available-unsubmitted
  * Description: Verifies waiting on a list of timeline syncobjs
@@ -173,77 +177,98 @@
  *
  * SUBTEST: invalid-multi-wait-unsubmitted
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-submitted
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-submitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
+ * Test category: negative test
  *
  * SUBTEST: invalid-query-bad-pad
  * Description:
  *   Verify that querying a timeline syncobj with an invalid
  *   drm_syncobj_timeline_array::flags field is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-query-illegal-handle
  * Description: Verifies that querying an invalid syncobj handle is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-query-one-illegal-handle
  * Description: Verifies that querying a list of invalid syncobj handle including an invalid one is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-query-zero-handles
  * Description: Verifies that querying an empty list of syncobj handles is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-bad-pad
  * Description: Verifies that an invalid value in drm_syncobj_timeline_array.flags is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-illegal-handle
  * Description: Verify that signaling an invalid syncobj handle is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-illegal-point
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-one-illegal-handle
  * Description:
  *   Verify that an invalid syncobj handle in drm_syncobj_timeline_array is rejected for
  *   signaling
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-zero-handles
  * Description: Verify that signaling an empty list of syncobj handles is rejected
+ * Test category: negative test
  *
  * SUBTEST: etime-single-wait-all-available-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
  *
  * SUBTEST: invalid-single-wait-all-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
+ * Test category: negative test
  *
  * SUBTEST: etime-single-wait-available-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
  *
  * SUBTEST: invalid-single-wait-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
+ * Test category: negative test
  *
  * SUBTEST: invalid-transfer-bad-pad
  * Description: Verifies that invalid drm_syncobj_transfer::pad field value is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-transfer-illegal-handle
  * Description: Verifies that an invalid syncobj handle is rejected in drm_syncobj_transfer
+ * Test category: negative test
  *
  * SUBTEST: invalid-transfer-non-existent-point
  * Description:
  *   Verifies that transfering a point from a syncobj timeline is to another point in the same
  *   timeline works
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-bad-flags
  * Description: Verifies that an invalid value in drm_syncobj_timeline_wait::flags is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-illegal-handle
  * Description: Verifies that waiting on an invalid syncobj handle is rejected
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-zero-handles
  * Description: Verifies that waiting on an empty list of invalid syncobj handles is rejected
+ * Test category: negative test
  *
  * SUBTEST: multi-wait-all-available-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index be7e67163..c8678277a 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -38,49 +38,70 @@
  * Sub-category: Synchronization
  * Functionality: semaphore
  * Feature: synchronization
- * Test category: GEM_Legacy
+ * Test category: functionality test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-signaled
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-signaled
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-submitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-multi-wait-unsubmitted-submitted-signaled
+ * Test category: negative test
  *
  * SUBTEST: invalid-reset-bad-pad
+ * Test category: negative test
  *
  * SUBTEST: invalid-reset-illegal-handle
+ * Test category: negative test
  *
  * SUBTEST: invalid-reset-one-illegal-handle
+ * Test category: negative test
  *
  * SUBTEST: invalid-reset-zero-handles
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-bad-pad
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-illegal-handle
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-one-illegal-handle
+ * Test category: negative test
  *
  * SUBTEST: invalid-signal-zero-handles
+ * Test category: negative test
  *
  * SUBTEST: invalid-single-wait-all-unsubmitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-single-wait-unsubmitted
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-bad-flags
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-illegal-handle
+ * Test category: negative test
  *
  * SUBTEST: invalid-wait-zero-handles
+ * Test category: negative test
  *
  * SUBTEST: multi-wait-all-for-submit-signaled
  *
-- 
2.34.1

