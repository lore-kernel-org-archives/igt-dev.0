Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39A10EA85
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 15:51:03 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 00/10] uAPI Alignment - More cleanup before upstream
Date: Fri, 15 Dec 2023 15:50:40 +0000
Message-Id: <20231215155050.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a combined submission of series which have been sent and
reviewed separately. It aligns with this kernel series:
https://patchwork.freedesktop.org/series/127878/

Bommu Krishnaiah (2):
  drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm-uapi/xe: Don't wait on user_fence during exec queue reset

Francois Dugast (6):
  drm-uapi/xe: Align header with current kernel uAPI
  drm-uapi/xe: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  drm-uapi/xe: Remove DRM_XE_UFENCE_WAIT_MASK_*
  drm-uapi/xe: Remove PMU from Xe till uapi is finalized
  drm-uapi/xe: Ensure every uapi struct has drm_xe prefix
  drm-uapi/xe: Update header after documentation updates

Matthew Brost (1):
  drm-uapi/xe: Remove sync binds

Rodrigo Vivi (1):
  tests/intel/xe: Remove xe_uevent for now

 benchmarks/gem_wsim.c                |   3 +-
 include/drm-uapi/xe_drm.h            | 829 +++++++++++++++++----------
 lib/igt_fb.c                         |   2 +-
 lib/intel_batchbuffer.c              |   7 +-
 lib/intel_compute.c                  |   2 +-
 lib/xe/xe_ioctl.c                    |  77 ++-
 lib/xe/xe_ioctl.h                    |  22 +-
 lib/xe/xe_query.c                    |   3 +-
 lib/xe/xe_util.c                     |   4 +-
 tests/intel/xe_access_counter.c      |   2 +-
 tests/intel/xe_ccs.c                 |   4 +-
 tests/intel/xe_copy_basic.c          |   2 +-
 tests/intel/xe_create.c              |   8 +-
 tests/intel/xe_drm_fdinfo.c          |   4 +-
 tests/intel/xe_evict.c               |  29 +-
 tests/intel/xe_evict_ccs.c           |   2 +-
 tests/intel/xe_exec_balancer.c       |  22 +-
 tests/intel/xe_exec_basic.c          |   6 +-
 tests/intel/xe_exec_compute_mode.c   |  25 +-
 tests/intel/xe_exec_fault_mode.c     |  26 +-
 tests/intel/xe_exec_queue_property.c |   2 +-
 tests/intel/xe_exec_reset.c          |  19 +-
 tests/intel/xe_exec_store.c          |   6 +-
 tests/intel/xe_exec_threads.c        |  29 +-
 tests/intel/xe_exercise_blt.c        |   2 +-
 tests/intel/xe_huc_copy.c            |   2 +-
 tests/intel/xe_intel_bb.c            |   2 +-
 tests/intel/xe_mmap.c                |   2 +-
 tests/intel/xe_noexec_ping_pong.c    |   4 +-
 tests/intel/xe_pat.c                 |   4 +-
 tests/intel/xe_peer2peer.c           |   4 +-
 tests/intel/xe_pm.c                  |   2 +-
 tests/intel/xe_spin_batch.c          |   2 +-
 tests/intel/xe_uevent.c              | 129 -----
 tests/intel/xe_vm.c                  |  24 +-
 tests/intel/xe_waitfence.c           | 122 +++-
 tests/meson.build                    |   1 -
 37 files changed, 789 insertions(+), 646 deletions(-)
 delete mode 100644 tests/intel/xe_uevent.c

-- 
2.34.1
