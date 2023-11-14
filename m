Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB5110E202
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:39 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:18 +0000
Message-Id: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/8] uAPI Alignment - Renaming
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
https://patchwork.freedesktop.org/series/126399/

Francois Dugast (3):
  drm-uapi/xe: Add missing DRM_ prefix in uAPI constants
  drm-uapi/xe: Add _FLAG to uAPI constants usable for flags
  drm-uapi/xe: Change rsvd to pad in struct drm_xe_class_instance

Rodrigo Vivi (5):
  drm-uapi/xe: Rename *_mem_regions mask.
  drm-uapi/xe: Rename query's mem_usage to mem_regions
  drm-uapi/xe: s/FLAGS_HAS_VRAM/FLAG_HAS_VRAM
  drm-uapi/xe: Differentiate WAIT_OP from WAIT_MASK
  drm-uapi/xe: Be more specific about vm_bind prefetch region

 benchmarks/gem_wsim.c                |  12 +-
 include/drm-uapi/xe_drm.h            | 205 ++++++++++++++-------------
 lib/igt_fb.c                         |   2 +-
 lib/intel_batchbuffer.c              |  24 ++--
 lib/intel_blt.c                      |   2 +-
 lib/intel_compute.c                  |   6 +-
 lib/intel_ctx.c                      |   4 +-
 lib/xe/xe_ioctl.c                    |  44 +++---
 lib/xe/xe_ioctl.h                    |   2 +-
 lib/xe/xe_query.c                    |  88 ++++++------
 lib/xe/xe_query.h                    |   8 +-
 lib/xe/xe_spin.c                     |   4 +-
 lib/xe/xe_util.c                     |  16 +--
 lib/xe/xe_util.h                     |   4 +-
 tests/intel/xe_access_counter.c      |   4 +-
 tests/intel/xe_ccs.c                 |   8 +-
 tests/intel/xe_copy_basic.c          |   6 +-
 tests/intel/xe_create.c              |   6 +-
 tests/intel/xe_debugfs.c             |  12 +-
 tests/intel/xe_dma_buf_sync.c        |   4 +-
 tests/intel/xe_drm_fdinfo.c          |  18 +--
 tests/intel/xe_evict.c               |  24 ++--
 tests/intel/xe_evict_ccs.c           |   2 +-
 tests/intel/xe_exec_balancer.c       |  34 ++---
 tests/intel/xe_exec_basic.c          |  24 ++--
 tests/intel/xe_exec_compute_mode.c   |   6 +-
 tests/intel/xe_exec_fault_mode.c     |  12 +-
 tests/intel/xe_exec_queue_property.c |  18 +--
 tests/intel/xe_exec_reset.c          |  62 ++++----
 tests/intel/xe_exec_store.c          |  26 ++--
 tests/intel/xe_exec_threads.c        |  48 +++----
 tests/intel/xe_exercise_blt.c        |   6 +-
 tests/intel/xe_guc_pc.c              |  12 +-
 tests/intel/xe_huc_copy.c            |   4 +-
 tests/intel/xe_intel_bb.c            |   2 +-
 tests/intel/xe_noexec_ping_pong.c    |   2 +-
 tests/intel/xe_perf_pmu.c            |  32 ++---
 tests/intel/xe_pm.c                  |  30 ++--
 tests/intel/xe_pm_residency.c        |   2 +-
 tests/intel/xe_query.c               | 106 +++++++-------
 tests/intel/xe_spin_batch.c          |   2 +-
 tests/intel/xe_vm.c                  | 138 +++++++++---------
 tests/intel/xe_waitfence.c           |  20 +--
 43 files changed, 549 insertions(+), 542 deletions(-)

-- 
2.34.1
