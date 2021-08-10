Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4246E029
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:53:37 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:52:29 +0200
Message-Id: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 00/54] Add allocator support in IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Series contains only ready-for-merge patches which I'm going to merge
when CI won't complain on tests touched in the series.

Leaving HAX to allow enter shards on TGL for no-reloc kernel patch
(it complains gem_exec_gttfill is skipping two subtests do to no-reloc).

v7: - leaving only patches which don't fail in reloc/no-reloc mode.
     
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Andrzej Turko (3):
  tests/gem_exec_gttfill: Require relocation support
  tests/gem_exec_lut_handle: Require relocation support
  tests/gem_lut_handle: Require relocation support

Bhanuprakash Modem (3):
  lib/intel_batchbuffer: Add allocator support in blitter fast copy
  tests/kms_flip: Adopt to use allocator
  tests/kms_vblank: Adopt to use allocator

Ch Sai Gowtham (5):
  tests/gem_exec_params: Support gens without relocations
  tests/gem_mmap: Add allocator support
  tests/gem_mmap_gtt: Add allocator support
  tests/gem_mmap_offset: Add allocator support
  tests/gem_request_retire: Add allocator support

Zbigniew Kempczyński (43):
  lib/igt_dummyload: Add support of using allocator in igt spinner
  lib/intel_allocator: Add few helper functions for common use
  lib/igt_gt: Add passing ahnd as an argument to igt_hang
  lib/intel_batchbuffer: Ensure relocation code will be called
  lib/intel_batchbuffer: Add allocator support in blitter src copy
  lib/intel_batchbuffer: Try to avoid relocations in blitting
  lib/huc_copy: Extend huc copy prototype to pass allocator handle
  tests/gem_busy: Adopt to use allocator
  tests/gem_create: Adopt to use allocator
  tests/gem_ctx_engines: Adopt to use allocator
  tests/gem_ctx_exec: Adopt to use allocator
  tests/gem_ctx_freq: Adopt to use allocator
  tests/gem_ctx_isolation: Adopt to use allocator
  tests/gem_ctx_param: Adopt to use allocator
  tests/gem_eio: Adopt to use allocator
  tests/gem_exec_async: Adopt to use allocator
  tests/gem_exec_fair: Add softpin support
  tests/gem_exec_suspend: Adopt to use allocator
  tests/gem_exec_parallel: Adopt to use alloctor
  tests/gem_exec_whisper: Adopt to use allocator
  tests/gem_fenced_exec_thrash: Adopt to use allocator
  tests/gem_mmap_wc: Adopt to use allocator
  tests/gem_ringfill: Adopt to use allocator
  tests/gem_spin_batch: Adopt to use allocator
  tests/gem_tiled_fence_blits: Adopt to use allocator
  tests/gem_unfence_active_buffers: Adopt to use allocator
  tests/gem_unref_active_buffers: Adopt to use allocator
  tests/gem_userptr_blits: Adopt to use allocator
  tests/gem_wait: Adopt to use allocator
  tests/gem_watchdog: Adopt to use no-reloc
  tests/gem_workarounds: Adopt to use allocator
  tests/i915_hangman: Adopt to use allocator
  tests/i915_module_load: Adopt to use allocator
  tests/i915_pm_rc6_residency: Adopt to use allocator
  tests/i915_pm_rpm: Adopt to use no-reloc
  tests/i915_pm_rps: Alter to use no-reloc
  tests/kms_busy: Adopt to use allocator
  tests/kms_cursor_legacy: Adopt to use allocator
  tests/perf_pmu: Adopt to use allocator
  tests/sysfs_heartbeat_interval: Adopt to use allocator
  tests/sysfs_preempt_timeout: Adopt to use allocator
  tests/sysfs_timeslice_duration: Adopt to use allocator
  HAX: remove gttfill for tgl ci

 lib/huc_copy.c                          |  27 ++++-
 lib/huc_copy.h                          |   4 +-
 lib/igt_dummyload.c                     |  74 +++++++++---
 lib/igt_dummyload.h                     |   3 +
 lib/igt_fb.c                            |  22 +++-
 lib/igt_gt.c                            |  21 +++-
 lib/igt_gt.h                            |   4 +
 lib/intel_allocator.h                   |  55 +++++++++
 lib/intel_batchbuffer.c                 | 118 ++++++++++++++-----
 lib/intel_batchbuffer.h                 |  18 ++-
 tests/i915/gem_busy.c                   |  36 +++++-
 tests/i915/gem_create.c                 |  11 +-
 tests/i915/gem_ctx_engines.c            |  25 +++-
 tests/i915/gem_ctx_exec.c               |  46 ++++++--
 tests/i915/gem_ctx_freq.c               |   4 +-
 tests/i915/gem_ctx_isolation.c          | 100 ++++++++++++----
 tests/i915/gem_ctx_param.c              |   9 +-
 tests/i915/gem_eio.c                    |  60 +++++++---
 tests/i915/gem_exec_async.c             |  67 +++++++++--
 tests/i915/gem_exec_fair.c              |   6 +
 tests/i915/gem_exec_gttfill.c           |   1 +
 tests/i915/gem_exec_lut_handle.c        |   1 +
 tests/i915/gem_exec_parallel.c          |  33 +++++-
 tests/i915/gem_exec_params.c            |  74 ++++++++----
 tests/i915/gem_exec_suspend.c           |  44 ++++---
 tests/i915/gem_exec_whisper.c           |  39 +++++--
 tests/i915/gem_fenced_exec_thrash.c     |  22 +++-
 tests/i915/gem_huc_copy.c               |  12 +-
 tests/i915/gem_lut_handle.c             |   1 +
 tests/i915/gem_mmap.c                   |   4 +-
 tests/i915/gem_mmap_gtt.c               |  15 ++-
 tests/i915/gem_mmap_offset.c            |   4 +-
 tests/i915/gem_mmap_wc.c                |   4 +-
 tests/i915/gem_request_retire.c         |  14 ++-
 tests/i915/gem_ringfill.c               |  37 ++++--
 tests/i915/gem_spin_batch.c             |  37 ++++--
 tests/i915/gem_tiled_fence_blits.c      |  65 ++++++++---
 tests/i915/gem_unfence_active_buffers.c |   5 +-
 tests/i915/gem_unref_active_buffers.c   |   5 +-
 tests/i915/gem_userptr_blits.c          |  44 +++++--
 tests/i915/gem_wait.c                   |   3 +
 tests/i915/gem_watchdog.c               |  11 +-
 tests/i915/gem_workarounds.c            |  17 ++-
 tests/i915/i915_hangman.c               |  15 ++-
 tests/i915/i915_module_load.c           |  23 +++-
 tests/i915/i915_pm_rc6_residency.c      |   8 +-
 tests/i915/i915_pm_rpm.c                |  27 ++++-
 tests/i915/i915_pm_rps.c                |  18 ++-
 tests/i915/perf_pmu.c                   | 147 +++++++++++++++++-------
 tests/i915/sysfs_heartbeat_interval.c   |  24 +++-
 tests/i915/sysfs_preempt_timeout.c      |  21 +++-
 tests/i915/sysfs_timeslice_duration.c   |  21 +++-
 tests/intel-ci/fast-feedback.testlist   |   1 -
 tests/kms_busy.c                        |   9 ++
 tests/kms_cursor_legacy.c               |   6 +
 tests/kms_flip.c                        |  12 +-
 tests/kms_vblank.c                      |   9 +-
 tests/prime_vgem.c                      | 120 ++++++++++++++-----
 58 files changed, 1315 insertions(+), 348 deletions(-)

-- 
2.26.0
