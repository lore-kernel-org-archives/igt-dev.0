Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238610E3D7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:04 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:30 +0000
Message-Id: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 00/24] uAPI Alignment - take 1 v3
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

As a result of the uAPI review efforts started by Thomas[1],
we have identified many updates on our uAPI that would lead to
breakage in the compatibility. What it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

Most of this work on putting these patches together for a single
shot was led by Francois.

[1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/

Francois Dugast (9):
  drm-uapi/xe_drm: Separate VM_BIND's operation and flag, align with
    latest uapi
  drm-uapi/xe_drm: Remove MMIO ioctl and align with latest uapi
  drm-uapi/xe: Align with uAPI to query micro-controler firmware version
  drm-uapi/xe: Align with DRM_XE_DEVICE_QUERY_HWCONFIG documentation
  drm-uapi/xe: Align with uAPI to pad to drm_xe_engine_class_instance
  drm-uapi/xe: Align with uAPI update query HuC micro-controler firmware
    version
  drm-uapi/xe: Align with uAPI update for query config num_params
  drm-uapi/xe: Align with uAPI update to add DRM_ prefix in uAPI
    constants
  drm-uapi/xe: Align with uAPI update to add _FLAG to constants usable
    for flags

Matthew Brost (4):
  xe_exec_balancer: Enable parallel submission and compute mode
  xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a
    compute VM
  xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
  xe: Update to new VM bind uAPI

Rodrigo Vivi (10):
  drm-uapi/xe_drm: Align with new PMU interface
  drm-uapi/xe: Use common drm_xe_ext_set_property extension
  drm-uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm-uapi/xe: Replace useless 'instance' per unique gt_id
  drm-uapi/xe: Remove unused field of drm_xe_query_gt
  drm-uapi/xe: Rename gts to gt_list
  drm-uapi/xe: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
  drm-uapi/xe: Align with documentation updates
  drm-uapi/xe: Align with Crystal Reference Clock updates
  drm-uapi/xe: Align with extension of drm_xe_vm_bind_op

Umesh Nerlige Ramappa (1):
  tests/intel/xe_query: Add a test for querying cs cycles

 include/drm-uapi/xe_drm.h                | 542 +++++++++++++----------
 lib/igt_fb.c                             |   2 +-
 lib/intel_batchbuffer.c                  |  25 +-
 lib/intel_compute.c                      |   6 +-
 lib/intel_ctx.c                          |   4 +-
 lib/xe/xe_ioctl.c                        |  54 +--
 lib/xe/xe_ioctl.h                        |   9 +-
 lib/xe/xe_query.c                        |  93 ++--
 lib/xe/xe_query.h                        |  15 +-
 lib/xe/xe_spin.c                         |  15 +-
 lib/xe/xe_util.c                         |  15 +-
 lib/xe/xe_util.h                         |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   4 +-
 tests/intel/xe_ccs.c                     |   8 +-
 tests/intel/xe_create.c                  |   6 +-
 tests/intel/xe_debugfs.c                 |  14 +-
 tests/intel/xe_dma_buf_sync.c            |   4 +-
 tests/intel/xe_drm_fdinfo.c              |  20 +-
 tests/intel/xe_evict.c                   |  51 +--
 tests/intel/xe_exec_balancer.c           |  63 +--
 tests/intel/xe_exec_basic.c              |  28 +-
 tests/intel/xe_exec_compute_mode.c       |  30 +-
 tests/intel/xe_exec_fault_mode.c         |  20 +-
 tests/intel/xe_exec_reset.c              |  80 ++--
 tests/intel/xe_exec_store.c              |  16 +-
 tests/intel/xe_exec_threads.c            | 179 +++-----
 tests/intel/xe_exercise_blt.c            |   6 +-
 tests/intel/xe_guc_pc.c                  |  12 +-
 tests/intel/xe_huc_copy.c                |   4 +-
 tests/intel/xe_intel_bb.c                |   2 +-
 tests/intel/xe_mmio.c                    |  91 ----
 tests/intel/xe_noexec_ping_pong.c        |  12 +-
 tests/intel/xe_pm.c                      |  14 +-
 tests/intel/xe_pm_residency.c            |   2 +-
 tests/intel/xe_query.c                   | 272 ++++++++++--
 tests/intel/xe_spin_batch.c              |   2 +-
 tests/intel/xe_vm.c                      | 316 +++----------
 tests/intel/xe_waitfence.c               |  21 +-
 tests/kms_flip.c                         |   0
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 ---------------
 42 files changed, 979 insertions(+), 1450 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 mode change 100755 => 100644 tests/kms_flip.c
 delete mode 100644 tools/xe_reg.c

-- 
2.34.1
