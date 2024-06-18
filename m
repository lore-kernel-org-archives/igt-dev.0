Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCACC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 14:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E7B10E6B2;
	Tue, 18 Jun 2024 14:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ4izhjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CED10E6B2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718720822; x=1750256822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOHv+ZqO2GgMIYYNEDSnxFs8hXo8aE+5W75saZnbgDA=;
 b=IQ4izhjrwF/psMzxeulc4fMYUhWd3doqaQRgKayWfXaSOGryNxdnHnBj
 HeOEti4I4guTgzMpaPk47ptgtV5JrUXl1rvE/xyfONT1gXQC7ZDqLr/r6
 yK2V8B+AGqb0fmigmw3PVUClwwXididBkWj8pcYNOuVTIiUHgIwKyJ4si
 XsGJnO7uiMgEv1LVv69t21xRCop0YGkrsLcEvrYHy0eOYTPju/ztzS37W
 t2dV5TXECTFPF16V8ux8s9//IOZ081VnTQZdH1tVnkLaTtPV8spiWONqE
 zKcZY4LfPA2H/O0oIUuMmHrRGD12qJb/4L+wkaMkYwcsNe/lQ8500u6WM g==;
X-CSE-ConnectionGUID: LFPd+BC0TR63WSEYLlMsug==
X-CSE-MsgGUID: SWaPrmsyRfOlc06n5PFuRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33073891"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33073891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:01 -0700
X-CSE-ConnectionGUID: BfnSKlExQP6/SU23OGOYKQ==
X-CSE-MsgGUID: iTl6M2F1TlShfSjv+1WGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41676216"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:00 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 0/4] Unify 'Test category' field in test documentation
Date: Tue, 18 Jun 2024 14:26:46 +0000
Message-Id: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

'Test category' field was added long time ago and has many different values.
In KMS tests they have only 'Test category = functionality test'.
On Core side we have not only functionality tests, but also negative and
stress tests.

This series is cleaning up i915 and Xe Core tests setting up to one of value:
 * functionality test - all testing for driver, HW or uapi that are not
a stress or negative testing
 * stress test - stress cases to reveal corner cases, e.g. huge memory usage,
many parallel operations, races etc.
 * negative test - check that invalid behaviors will not break anything

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Peter Senna Tschudin <me@petersenna.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Katarzyna Piecielska (4):
  tests: Unify GEM_Legacy 'Test category' in Core tests for i915
  tests: Unify 'Test category' in Core tests for i915 and Xe
  tests: Adding 'Test category' to test that did not have it
  tests/intel: Remove redundant 'Test category' entries for tests

 tests/core_auth.c                            |  2 +-
 tests/core_getclient.c                       |  2 +-
 tests/core_getstats.c                        |  2 +-
 tests/core_getversion.c                      |  2 +-
 tests/core_hotunplug.c                       |  2 +-
 tests/core_setmaster.c                       |  2 +-
 tests/core_setmaster_vs_auth.c               |  2 +-
 tests/device_reset.c                         |  2 +-
 tests/dmabuf.c                               |  2 +-
 tests/drm_mm.c                               |  2 +-
 tests/dumb_buffer.c                          |  4 +-
 tests/intel/api_intel_allocator.c            |  2 +-
 tests/intel/api_intel_bb.c                   |  2 +-
 tests/intel/debugfs_test.c                   |  2 +-
 tests/intel/drm_fdinfo.c                     |  1 +
 tests/intel/gem_bad_reloc.c                  |  1 +
 tests/intel/gem_barrier_race.c               |  2 +-
 tests/intel/gem_basic.c                      |  3 +-
 tests/intel/gem_blits.c                      |  2 +-
 tests/intel/gem_busy.c                       |  2 +-
 tests/intel/gem_caching.c                    |  2 +-
 tests/intel/gem_ccs.c                        |  1 +
 tests/intel/gem_close.c                      |  2 +-
 tests/intel/gem_close_race.c                 |  2 +-
 tests/intel/gem_create.c                     |  3 +-
 tests/intel/gem_cs_tlb.c                     |  2 +-
 tests/intel/gem_ctx_bad_destroy.c            |  2 +-
 tests/intel/gem_ctx_create.c                 |  2 +-
 tests/intel/gem_ctx_engines.c                |  3 +-
 tests/intel/gem_ctx_exec.c                   |  3 +-
 tests/intel/gem_ctx_freq.c                   |  2 +-
 tests/intel/gem_ctx_isolation.c              |  2 +-
 tests/intel/gem_ctx_param.c                  |  8 ++-
 tests/intel/gem_ctx_persistence.c            |  2 +-
 tests/intel/gem_ctx_shared.c                 |  4 +-
 tests/intel/gem_ctx_sseu.c                   |  4 ++
 tests/intel/gem_ctx_switch.c                 |  1 +
 tests/intel/gem_eio.c                        |  2 +-
 tests/intel/gem_evict_alignment.c            |  1 +
 tests/intel/gem_evict_everything.c           |  1 +
 tests/intel/gem_exec_alignment.c             |  2 +-
 tests/intel/gem_exec_async.c                 |  2 +-
 tests/intel/gem_exec_await.c                 |  2 +-
 tests/intel/gem_exec_balancer.c              |  4 +-
 tests/intel/gem_exec_basic.c                 |  2 +-
 tests/intel/gem_exec_big.c                   |  2 +-
 tests/intel/gem_exec_capture.c               |  2 +-
 tests/intel/gem_exec_create.c                |  2 +-
 tests/intel/gem_exec_endless.c               |  2 +-
 tests/intel/gem_exec_fair.c                  |  1 +
 tests/intel/gem_exec_fence.c                 | 14 ++---
 tests/intel/gem_exec_flush.c                 |  1 +
 tests/intel/gem_exec_gttfill.c               |  2 +-
 tests/intel/gem_exec_latency.c               |  1 +
 tests/intel/gem_exec_lut_handle.c            |  1 +
 tests/intel/gem_exec_nop.c                   |  2 +-
 tests/intel/gem_exec_parallel.c              |  2 +-
 tests/intel/gem_exec_params.c                |  2 +-
 tests/intel/gem_exec_reloc.c                 |  1 +
 tests/intel/gem_exec_schedule.c              |  2 +-
 tests/intel/gem_exec_store.c                 |  2 +-
 tests/intel/gem_exec_suspend.c               |  1 +
 tests/intel/gem_exec_whisper.c               |  2 +-
 tests/intel/gem_exercise_blt.c               |  2 +-
 tests/intel/gem_fd_exhaustion.c              |  1 +
 tests/intel/gem_fence_thrash.c               |  1 +
 tests/intel/gem_fence_upload.c               |  1 +
 tests/intel/gem_fenced_exec_thrash.c         |  1 +
 tests/intel/gem_flink_basic.c                |  5 +-
 tests/intel/gem_flink_race.c                 |  2 +-
 tests/intel/gem_gpgpu_fill.c                 |  2 +-
 tests/intel/gem_gtt_cpu_tlb.c                |  2 +
 tests/intel/gem_gtt_hog.c                    |  1 +
 tests/intel/gem_gtt_speed.c                  |  1 +
 tests/intel/gem_huc_copy.c                   |  1 +
 tests/intel/gem_linear_blits.c               |  2 +-
 tests/intel/gem_lmem_evict.c                 |  2 +-
 tests/intel/gem_lmem_swapping.c              |  2 +-
 tests/intel/gem_lut_handle.c                 |  1 +
 tests/intel/gem_madvise.c                    |  2 +-
 tests/intel/gem_media_fill.c                 |  1 +
 tests/intel/gem_media_vme.c                  |  1 +
 tests/intel/gem_mmap.c                       |  4 ++
 tests/intel/gem_mmap_gtt.c                   |  1 +
 tests/intel/gem_mmap_offset.c                |  8 ++-
 tests/intel/gem_mmap_wc.c                    |  7 +++
 tests/intel/gem_partial_pwrite_pread.c       |  1 +
 tests/intel/gem_pipe_control_store_loop.c    |  2 +-
 tests/intel/gem_ppgtt.c                      |  2 +-
 tests/intel/gem_pread.c                      |  1 +
 tests/intel/gem_pread_after_blit.c           |  1 +
 tests/intel/gem_pwrite.c                     |  1 +
 tests/intel/gem_pwrite_snooped.c             |  1 +
 tests/intel/gem_pxp.c                        |  4 ++
 tests/intel/gem_read_read_speed.c            |  1 +
 tests/intel/gem_readwrite.c                  |  1 +
 tests/intel/gem_reg_read.c                   |  1 +
 tests/intel/gem_render_copy.c                |  1 +
 tests/intel/gem_render_copy_redux.c          |  1 +
 tests/intel/gem_render_linear_blits.c        |  1 +
 tests/intel/gem_render_tiled_blits.c         |  1 +
 tests/intel/gem_request_retire.c             |  2 +-
 tests/intel/gem_reset_stats.c                |  1 +
 tests/intel/gem_ringfill.c                   |  6 +-
 tests/intel/gem_set_tiling_vs_blt.c          |  1 +
 tests/intel/gem_set_tiling_vs_gtt.c          |  1 +
 tests/intel/gem_set_tiling_vs_pwrite.c       |  1 +
 tests/intel/gem_shrink.c                     |  2 +-
 tests/intel/gem_softpin.c                    |  3 +-
 tests/intel/gem_spin_batch.c                 |  2 +-
 tests/intel/gem_streaming_writes.c           |  1 +
 tests/intel/gem_stress.c                     |  1 +
 tests/intel/gem_sync.c                       |  5 +-
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
 tests/intel/gem_unref_active_buffers.c       |  2 +-
 tests/intel/gem_userptr_blits.c              |  5 +-
 tests/intel/gem_vm_create.c                  |  4 +-
 tests/intel/gem_wait.c                       |  4 +-
 tests/intel/gem_watchdog.c                   |  1 +
 tests/intel/gem_workarounds.c                |  4 +-
 tests/intel/gen7_exec_parse.c                |  1 +
 tests/intel/gen9_exec_parse.c                |  4 ++
 tests/intel/i915_fb_tiling.c                 |  1 +
 tests/intel/i915_getparams_basic.c           |  2 +-
 tests/intel/i915_hangman.c                   |  2 +-
 tests/intel/i915_module_load.c               |  2 +-
 tests/intel/i915_pciid.c                     |  2 +-
 tests/intel/i915_pm_freq_api.c               |  1 +
 tests/intel/i915_pm_freq_mult.c              |  2 +-
 tests/intel/i915_pm_rc6_residency.c          |  1 +
 tests/intel/i915_pm_rpm.c                    |  5 +-
 tests/intel/i915_pm_rps.c                    |  2 +-
 tests/intel/i915_pm_sseu.c                   |  1 +
 tests/intel/i915_power.c                     |  2 +-
 tests/intel/i915_query.c                     |  4 +-
 tests/intel/i915_selftest.c                  | 61 +-------------------
 tests/intel/i915_suspend.c                   |  2 +-
 tests/intel/intel_hwmon.c                    |  2 +-
 tests/intel/perf.c                           |  9 ++-
 tests/intel/perf_pmu.c                       |  4 +-
 tests/intel/prime_busy.c                     |  2 +-
 tests/intel/prime_mmap.c                     |  3 +-
 tests/intel/prime_mmap_coherency.c           |  2 +-
 tests/intel/prime_mmap_kms.c                 |  2 +-
 tests/intel/prime_self_import.c              |  4 +-
 tests/intel/sysfs_defaults.c                 |  2 +-
 tests/intel/sysfs_heartbeat_interval.c       |  3 +-
 tests/intel/sysfs_preempt_timeout.c          |  3 +-
 tests/intel/sysfs_timeslice_duration.c       |  3 +-
 tests/intel/xe_drm_fdinfo.c                  |  2 +-
 tests/intel/xe_exec_compute_mode.c           |  2 +-
 tests/intel/xe_exec_fault_mode.c             |  4 +-
 tests/intel/xe_exec_queue_property.c         |  4 +-
 tests/intel/xe_peer2peer.c                   |  2 +-
 tests/intel/xe_prime_self_import.c           |  2 +
 tests/intel/xe_query.c                       | 21 +------
 tests/prime_vgem.c                           |  2 +-
 tests/sriov_basic.c                          |  1 +
 tests/sw_sync.c                              |  4 +-
 tests/syncobj_basic.c                        |  2 +-
 tests/syncobj_timeline.c                     | 27 ++++++++-
 tests/syncobj_wait.c                         | 23 +++++++-
 tests/vgem_basic.c                           |  6 +-
 tests/vgem_slow.c                            |  2 +-
 173 files changed, 305 insertions(+), 204 deletions(-)

-- 
2.34.1

