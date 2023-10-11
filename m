Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5240210E4FA
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 14:18:56 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:18:21 +0000
Message-Id: <20231011141841.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v1 00/20] uAPI Alignment - take 2
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

This series is not complete yet but it is sent for early review
as some patches are already a few weeks old.

It is intended to be applied after take 1 [1] which is not
merged yet, so it will break CI.

The matching kernel series is [2].

[1] https://patchwork.freedesktop.org/series/124710/
[2] https://patchwork.freedesktop.org/series/124977/

Francois Dugast (11):
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

Rodrigo Vivi (9):
  drm-uapi/xe: Remove GT_TYPE_REMOTE.
  drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests
  drm/xe_query: Remove backward compatibility of vram_visible_size.
  xe_ioctl: Converge bo_create to the most used version
  xe_ioctl: Rename *xe_bo_create_flags to simply xe_bo_create
  xe_query: Add missing include.
  xe_query: Kill visible_vram_if_possible
  drm-uapi/xe: Separate bo_create placement from flags
  drm-uapi/xe: Align with GuC version type update

 include/drm-uapi/xe_drm.h          | 478 ++++++++++++++++-------------
 lib/igt_draw.c                     |   7 +-
 lib/igt_fb.c                       |   9 +-
 lib/intel_batchbuffer.c            |  28 +-
 lib/intel_blt.c                    |   2 +-
 lib/intel_bufops.c                 |   2 +-
 lib/intel_compute.c                |   6 +-
 lib/intel_ctx.c                    |   4 +-
 lib/xe/xe_ioctl.c                  |  86 +++---
 lib/xe/xe_ioctl.h                  |  10 +-
 lib/xe/xe_query.c                  |  83 +----
 lib/xe/xe_query.h                  |   8 +-
 lib/xe/xe_spin.c                   |  13 +-
 lib/xe/xe_util.c                   |  14 +-
 lib/xe/xe_util.h                   |   4 +-
 tests/intel/api_intel_allocator.c  |   4 +-
 tests/intel/kms_big_fb.c           |  22 +-
 tests/intel/xe_ccs.c               |  20 +-
 tests/intel/xe_create.c            |  10 +-
 tests/intel/xe_debugfs.c           |  14 +-
 tests/intel/xe_dma_buf_sync.c      |   9 +-
 tests/intel/xe_drm_fdinfo.c        |  24 +-
 tests/intel/xe_evict.c             |  70 +++--
 tests/intel/xe_exec_balancer.c     |  43 +--
 tests/intel/xe_exec_basic.c        |  30 +-
 tests/intel/xe_exec_compute_mode.c |  11 +-
 tests/intel/xe_exec_fault_mode.c   | 198 ++----------
 tests/intel/xe_exec_reset.c        |  83 ++---
 tests/intel/xe_exec_store.c        |  26 +-
 tests/intel/xe_exec_threads.c      |  63 ++--
 tests/intel/xe_exercise_blt.c      |  10 +-
 tests/intel/xe_guc_pc.c            |  17 +-
 tests/intel/xe_huc_copy.c          |   4 +-
 tests/intel/xe_intel_bb.c          |   4 +-
 tests/intel/xe_mmap.c              |  49 +--
 tests/intel/xe_noexec_ping_pong.c  |   6 +-
 tests/intel/xe_pm.c                |  27 +-
 tests/intel/xe_pm_residency.c      |   7 +-
 tests/intel/xe_prime_self_import.c |  37 ++-
 tests/intel/xe_query.c             |  52 ++--
 tests/intel/xe_spin_batch.c        |   4 +-
 tests/intel/xe_vm.c                | 171 ++++++-----
 tests/intel/xe_waitfence.c         |  20 +-
 tests/kms_addfb_basic.c            |   2 +-
 tests/kms_getfb.c                  |   2 +-
 45 files changed, 826 insertions(+), 967 deletions(-)

-- 
2.34.1
