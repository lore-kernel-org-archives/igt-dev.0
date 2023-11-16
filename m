Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04610E60C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 14:53:56 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 14:53:35 +0000
Message-Id: <20231116145348.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 00/13] uAPI Alignment - Cleanup and future proof
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

This aligns on kernel series:
https://patchwork.freedesktop.org/series/126535/

Francois Dugast (5):
  drm-uapi/xe: Extend drm_xe_vm_bind_op
  drm-uapi/xe: Reject bo creation of unaligned size
  drm-uapi/xe: Align on a common way to return  arrays (memory regions)
  drm-uapi/xe: Align on a common way to return arrays (gt)
  drm-uapi/xe: Align on a common way to return arrays (engines)

Rodrigo Vivi (8):
  xe_ioctl: Converge bo_create to the most used version
  xe_ioctl: Rename *xe_bo_create_flags to simply xe_bo_create
  xe_query: Add missing include.
  xe_query: Kill visible_vram_if_possible
  drm-uapi/xe: Separate bo_create placement from flags
  xe: s/hw_engine/engine
  drm-uapi/xe: Align with drm_xe_query_engine_info
  drm-uapi/xe: Add Tile ID information to the GT info query

 benchmarks/gem_wsim.c                    |  13 +-
 include/drm-uapi/xe_drm.h                | 158 ++++++++++++-------
 lib/igt_draw.c                           |   7 +-
 lib/igt_fb.c                             |   7 +-
 lib/intel_batchbuffer.c                  |   8 +-
 lib/intel_blt.c                          |   4 +-
 lib/intel_bufops.c                       |   2 +-
 lib/xe/xe_ioctl.c                        |  44 +++---
 lib/xe/xe_ioctl.h                        |   8 +-
 lib/xe/xe_query.c                        | 191 +++++++++--------------
 lib/xe/xe_query.h                        |  37 ++---
 lib/xe/xe_spin.c                         |  15 +-
 lib/xe/xe_util.c                         |   6 +-
 tests/intel-ci/xe-fast-feedback.testlist |   2 +-
 tests/intel/api_intel_allocator.c        |   4 +-
 tests/intel/kms_big_fb.c                 |  22 +--
 tests/intel/kms_ccs.c                    |   5 +-
 tests/intel/xe_ccs.c                     |  12 +-
 tests/intel/xe_copy_basic.c              |   8 +-
 tests/intel/xe_create.c                  |  15 +-
 tests/intel/xe_dma_buf_sync.c            |   7 +-
 tests/intel/xe_drm_fdinfo.c              |  21 +--
 tests/intel/xe_evict.c                   |  48 +++---
 tests/intel/xe_evict_ccs.c               |   7 +-
 tests/intel/xe_exec_balancer.c           |  37 +++--
 tests/intel/xe_exec_basic.c              |  18 +--
 tests/intel/xe_exec_compute_mode.c       |  13 +-
 tests/intel/xe_exec_fault_mode.c         |  20 +--
 tests/intel/xe_exec_reset.c              |  65 ++++----
 tests/intel/xe_exec_store.c              |  31 ++--
 tests/intel/xe_exec_threads.c            |  39 ++---
 tests/intel/xe_exercise_blt.c            |   4 +-
 tests/intel/xe_guc_pc.c                  |   9 +-
 tests/intel/xe_huc_copy.c                |   2 +-
 tests/intel/xe_intel_bb.c                |   5 +-
 tests/intel/xe_mmap.c                    |  65 ++++----
 tests/intel/xe_noexec_ping_pong.c        |  11 +-
 tests/intel/xe_perf_pmu.c                |  10 +-
 tests/intel/xe_pm.c                      |  39 ++---
 tests/intel/xe_pm_residency.c            |   7 +-
 tests/intel/xe_prime_self_import.c       |  63 ++++++--
 tests/intel/xe_query.c                   |  80 +++++-----
 tests/intel/xe_spin_batch.c              |  12 +-
 tests/intel/xe_vm.c                      | 108 +++++++------
 tests/intel/xe_waitfence.c               |  22 ++-
 tests/kms_addfb_basic.c                  |   2 +-
 tests/kms_getfb.c                        |   2 +-
 tests/kms_plane.c                        |   2 +-
 48 files changed, 699 insertions(+), 618 deletions(-)

-- 
2.34.1
