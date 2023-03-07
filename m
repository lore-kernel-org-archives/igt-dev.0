Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BF910E40E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 10:45:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 11:45:16 +0100
Message-Id: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Start using intel_gpu_commands.h
 header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reduce code duplication by using kernel intel_gpu_commands.h header.

v2: Address review comments (Kamil)

Zbigniew Kempczyński (3):
  intel_gpu_commands: Use kernel gpu command definitions
  lib/huc_copy: Rename to avoid macro name clash
  igt: Remove duplicated macros

 benchmarks/gem_wsim.c                    |   6 +-
 include/intel_gpu_commands.h             | 470 +++++++++++++++++++++++
 include/intel_gpu_commands_staging.h     |  18 +
 include/linux/bitops.h                   |  22 ++
 include/linux_scaffold.h                 |  54 +++
 lib/gen4_render.h                        |   2 -
 lib/gen7_media.h                         |   2 -
 lib/gen7_render.h                        |   3 -
 lib/gen8_media.h                         |   2 -
 lib/huc_copy.c                           |   6 +-
 lib/huc_copy.h                           |   2 +-
 lib/i830_reg.h                           |  16 -
 lib/i915/i915_blt.h                      |   4 +-
 lib/i915/i915_crc.c                      |  15 +-
 lib/igt_draw.c                           |   4 +-
 lib/igt_dummyload.c                      |   2 +-
 lib/igt_store.c                          |   2 +-
 lib/intel_allocator.h                    |   8 +-
 lib/intel_aux_pgtable.c                  |   5 +-
 lib/intel_batchbuffer.c                  |  12 +-
 lib/intel_bufops.c                       |   7 +
 lib/intel_reg.h                          |  69 +---
 lib/ioctl_wrappers.h                     |   4 +-
 lib/rendercopy_gen9.c                    |   9 +-
 meson.build                              |   2 +-
 tests/i915/api_intel_bb.c                |   2 +-
 tests/i915/gem_blits.c                   |  20 +-
 tests/i915/gem_busy.c                    |   8 +-
 tests/i915/gem_ccs.c                     |   2 +-
 tests/i915/gem_ctx_shared.c              |   4 +-
 tests/i915/gem_exec_async.c              |   2 +-
 tests/i915/gem_exec_balancer.c           |  23 +-
 tests/i915/gem_exec_capture.c            |   4 +-
 tests/i915/gem_exec_endless.c            |  13 +-
 tests/i915/gem_exec_fair.c               |  18 +-
 tests/i915/gem_exec_fence.c              |  43 +--
 tests/i915/gem_exec_flush.c              |   6 +-
 tests/i915/gem_exec_gttfill.c            |   2 +-
 tests/i915/gem_exec_nop.c                |   4 +-
 tests/i915/gem_exec_parallel.c           |   2 +-
 tests/i915/gem_exec_params.c             |   4 +-
 tests/i915/gem_exec_reloc.c              |  29 +-
 tests/i915/gem_exec_schedule.c           |  43 +--
 tests/i915/gem_exec_store.c              |   6 +-
 tests/i915/gem_exec_suspend.c            |   2 +-
 tests/i915/gem_exec_whisper.c            |   2 +-
 tests/i915/gem_pipe_control_store_loop.c |  11 +-
 tests/i915/gem_pxp.c                     |   7 +-
 tests/i915/gem_ringfill.c                |   2 +-
 tests/i915/gem_softpin.c                 |  16 +-
 tests/i915/gem_sync.c                    |  16 +-
 tests/i915/gem_userptr_blits.c           |   6 +-
 tests/i915/gem_vm_create.c               |   2 +-
 tests/i915/gem_watchdog.c                |   6 +-
 tests/i915/gem_workarounds.c             |   2 +-
 tests/i915/gen7_exec_parse.c             |  34 +-
 tests/i915/gen9_exec_parse.c             |  47 +--
 tests/i915/i915_module_load.c            |   2 +-
 tests/i915/perf.c                        |  17 +-
 tests/i915/perf_pmu.c                    |  18 +-
 tests/i915/sysfs_timeslice_duration.c    |  17 +-
 tests/prime_vgem.c                       |   2 +-
 tools/intel_audio_dump.c                 |   1 +
 tools/intel_reg.c                        |   2 +-
 64 files changed, 775 insertions(+), 418 deletions(-)
 create mode 100644 include/intel_gpu_commands.h
 create mode 100644 include/intel_gpu_commands_staging.h
 create mode 100644 include/linux/bitops.h
 create mode 100644 include/linux_scaffold.h

-- 
2.34.1
