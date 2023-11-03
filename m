Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF4210E9FA
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:42:55 +0000
Message-Id: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 00/64] uAPI Alignment - take 2
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

This is the second take of uAPI updates that would lead to
breakage in the compatibility, which it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

v2: Rebase, drop "RFC", more uAPI fixes and cleanup, align to kernel
    series: https://patchwork.freedesktop.org/series/125955/

Francois Dugast (22):
  drm-uapi/xe: Add documentation for query
  drm-uapi/xe: Extend drm_xe_vm_bind_op
  drm-uapi/xe: Add uAPI to query micro-controler firmware version
  drm-uapi/xe: Document DRM_XE_DEVICE_QUERY_HWCONFIG
  drm-uapi/xe: Extend uAPI to query HuC micro-controler firmware version
  drm-uapi/xe: Remove useless query config num_params
  drm-uapi/xe: Add missing DRM_ prefix in uAPI constants
  drm-uapi/xe: Add _FLAG to uAPI constants usable for flags
  drm-uapi/xe: Make constant comments visible in kernel doc
  fixup! tests/intel/xe_query: Add a test for querying engine cycles
  drm-uapi/xe: Remove unused inaccessible memory region
  drm-uapi/xe: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
  drm-uapi/xe: Remove unused QUERY_CONFIG_GT_COUNT
  drm-uapi/xe: Replace BO with GEM in documentation
  drm-uapi/xe: Drop interrupt pmu event
  drm-uapi/xe: Reject bo creation of unaligned size
  drm-uapi/xe: Document the memory_region bitmask
  drm-uapi/xe: Align on a common way to return arrays (memory regions)
  drm-uapi/xe: Align on a common way to return arrays (gt)
  drm-uapi/xe: Align on a common way to return arrays (engines)
  drm-uapi/xe: Add block diagram of a device
  drm-uapi/xe: Add examples of user space code

Rodrigo Vivi (42):
  drm-uapi/xe: Remove GT_TYPE_REMOTE.
  drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests
  drm/xe_query: Remove backward compatibility of vram_visible_size.
  xe_ioctl: Converge bo_create to the most used version
  xe_ioctl: Rename *xe_bo_create_flags to simply xe_bo_create
  xe_query: Add missing include.
  xe_query: Kill visible_vram_if_possible
  drm-uapi/xe: Separate bo_create placement from flags
  drm-uapi/xe: Rename *_mem_regions mask.
  drm-uapi/xe: Rename query's mem_usage to mem_regions
  xe: s/hw_engine/engine
  drm-uapi/xe: Align with drm_xe_query_engine_info
  fixup! drm-uapi/xe: Reject bo creation of unaligned size
  fixup! xe: s/hw_engine/engine
  fixup! drm-uapi/xe: Align with drm_xe_query_engine_info
  fixup! drm-uapi/xe: Align with drm_xe_query_engine_info
  lib: Fix 'otherwise' typos
  xe: Rename 'hwe' to 'eci'
  drm-uapi/xe: Split xe_sync types from flags
  drm-uapi/xe: s/FLAGS_HAS_VRAM/FLAG_HAS_VRAM
  drm-uapi/xe: Differentiate WAIT_OP from WAIT_MASK
  drm-uapi/xe: Align with xe_exec ioctl reorder
  fixup! drm-uapi/xe: Split xe_sync types from flags
  xe: Build all_memory_regions_mask out of memory_regions query info
  xe: Be more specific on the VRAM selection
  xe: Do not stash vram_size
  xe: Also be specific on VRAM selection when inspecting its sizes
  lib/xe: Get current available size and sync with the 'any gt'.
  tests/intel/xe_query: Fix test_query_engines
  drm-uapi/xe: Move memory_region masks from GT to engine
  xe: Get near_mem_region directly from engine_info.
  drm-uapi/xe: Be more specific about vm_bind prefetch region
  drm-uapi/xe: Convert tile_mask to a pt_placement_hint
  drm-uapi/xe: Rename couple exec_queue items
  drm-uapi/xe: Refactor engine information
  drm-uapi/xe: Crystal Reference Clock updates
  drm-uapi/xe: Add Tile ID information to the GT info query
  fixup! drm-uapi/xe: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
  lib/xe/xe_query: Fix improper handling of GT vs Tile
  squash! drm-uapi/xe: Rename couple exec_queue items
  fixup! drm-uapi/xe: Align with drm_xe_query_engine_info
  drm-uapi/xe: Remove bogus engine list from the wait_user_fence IOCTL

 benchmarks/gem_wsim.c                    |  154 +--
 include/drm-uapi/xe_drm.h                | 1348 ++++++++++++++--------
 lib/drmtest.c                            |    2 +-
 lib/igt_draw.c                           |    9 +-
 lib/igt_dummyload.h                      |    2 +-
 lib/igt_fb.c                             |   13 +-
 lib/intel_allocator.c                    |    2 +-
 lib/intel_batchbuffer.c                  |   35 +-
 lib/intel_blt.c                          |    4 +-
 lib/intel_bufops.c                       |    2 +-
 lib/intel_compute.c                      |    8 +-
 lib/intel_ctx.c                          |    5 +-
 lib/xe/xe_ioctl.c                        |  122 +-
 lib/xe/xe_ioctl.h                        |   14 +-
 lib/xe/xe_query.c                        |  367 +++---
 lib/xe/xe_query.h                        |   68 +-
 lib/xe/xe_spin.c                         |   37 +-
 lib/xe/xe_spin.h                         |    2 +-
 lib/xe/xe_util.c                         |   24 +-
 lib/xe/xe_util.h                         |    4 +-
 tests/intel-ci/xe-fast-feedback.testlist |    2 +-
 tests/intel/api_intel_allocator.c        |    4 +-
 tests/intel/kms_big_fb.c                 |   24 +-
 tests/intel/kms_psr.c                    |    2 +-
 tests/intel/xe_access_counter.c          |    8 +-
 tests/intel/xe_ccs.c                     |   20 +-
 tests/intel/xe_copy_basic.c              |   14 +-
 tests/intel/xe_create.c                  |   25 +-
 tests/intel/xe_debugfs.c                 |   14 +-
 tests/intel/xe_dma_buf_sync.c            |   36 +-
 tests/intel/xe_drm_fdinfo.c              |   41 +-
 tests/intel/xe_evict.c                   |  113 +-
 tests/intel/xe_evict_ccs.c               |   19 +-
 tests/intel/xe_exec_balancer.c           |  189 +--
 tests/intel/xe_exec_basic.c              |   62 +-
 tests/intel/xe_exec_compute_mode.c       |   48 +-
 tests/intel/xe_exec_fault_mode.c         |  235 +---
 tests/intel/xe_exec_reset.c              |  227 ++--
 tests/intel/xe_exec_store.c              |   73 +-
 tests/intel/xe_exec_threads.c            |  189 +--
 tests/intel/xe_exercise_blt.c            |   10 +-
 tests/intel/xe_guc_pc.c                  |   33 +-
 tests/intel/xe_huc_copy.c                |   17 +-
 tests/intel/xe_intel_bb.c                |    7 +-
 tests/intel/xe_mmap.c                    |   71 +-
 tests/intel/xe_noexec_ping_pong.c        |   15 +-
 tests/intel/xe_perf_pmu.c                |   85 +-
 tests/intel/xe_pm.c                      |   79 +-
 tests/intel/xe_pm_residency.c            |   31 +-
 tests/intel/xe_prime_self_import.c       |   68 +-
 tests/intel/xe_query.c                   |  224 ++--
 tests/intel/xe_spin_batch.c              |   63 +-
 tests/intel/xe_sysfs_tile.c              |    2 +-
 tests/intel/xe_vm.c                      |  358 +++---
 tests/intel/xe_waitfence.c               |   26 +-
 tests/kms_addfb_basic.c                  |    2 +-
 tests/kms_getfb.c                        |    2 +-
 tests/kms_plane.c                        |    2 +-
 58 files changed, 2569 insertions(+), 2093 deletions(-)

-- 
2.34.1
