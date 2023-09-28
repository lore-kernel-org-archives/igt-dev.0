Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C9210E604
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 11:05:33 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:02 +0000
Message-Id: <20230928110516.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 00/14] uAPI Alignment - take 1 v4
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

v4:
Rebase and remove some patches to align with:
https://patchwork.freedesktop.org/series/124387/

As a result of the uAPI review efforts started by Thomas[1],
we have identified many updates on our uAPI that would lead to
breakage in the compatibility. What it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

Most of this work on putting these patches together for a single
shot was led by Francois.

[1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/

Francois Dugast (2):
  drm-uapi/xe_drm: Separate VM_BIND's operation and flag, align with
    latest uapi
  drm-uapi/xe_drm: Remove MMIO ioctl and align with latest uapi

Matthew Brost (4):
  xe_exec_balancer: Enable parallel submission and compute mode
  xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a
    compute VM
  xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
  xe: Update to new VM bind uAPI

Rodrigo Vivi (7):
  drm-uapi/xe_drm: Align with new PMU interface
  drm-uapi/xe: Use common drm_xe_ext_set_property extension
  drm-uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
  drm-uapi/xe: Replace useless 'instance' per unique gt_id
  drm-uapi/xe: Remove unused field of drm_xe_query_gt
  drm-uapi/xe: Rename gts to gt_list
  drm-uapi/xe: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY

Umesh Nerlige Ramappa (1):
  tests/intel/xe_query: Add a test for querying engine cycles

 include/drm-uapi/xe_drm.h                | 371 ++++++++++++-----------
 lib/igt_fb.c                             |   2 +-
 lib/intel_batchbuffer.c                  |  13 +-
 lib/intel_compute.c                      |   2 +-
 lib/xe/xe_ioctl.c                        |  44 ++-
 lib/xe/xe_ioctl.h                        |   9 +-
 lib/xe/xe_query.c                        |  54 ++--
 lib/xe/xe_query.h                        |  10 +-
 lib/xe/xe_spin.c                         |   6 +-
 lib/xe/xe_util.c                         |   9 +-
 tests/intel-ci/xe-fast-feedback.testlist |   4 +-
 tests/intel/xe_ccs.c                     |   4 +-
 tests/intel/xe_create.c                  |   6 +-
 tests/intel/xe_drm_fdinfo.c              |   4 +-
 tests/intel/xe_evict.c                   |  37 +--
 tests/intel/xe_exec_balancer.c           |  35 ++-
 tests/intel/xe_exec_basic.c              |   8 +-
 tests/intel/xe_exec_compute_mode.c       |  26 +-
 tests/intel/xe_exec_fault_mode.c         |   6 +-
 tests/intel/xe_exec_reset.c              |  26 +-
 tests/intel/xe_exec_store.c              |   4 +-
 tests/intel/xe_exec_threads.c            | 145 ++-------
 tests/intel/xe_exercise_blt.c            |   2 +-
 tests/intel/xe_guc_pc.c                  |   2 +-
 tests/intel/xe_huc_copy.c                |   2 +-
 tests/intel/xe_intel_bb.c                |   2 +-
 tests/intel/xe_mmio.c                    |  91 ------
 tests/intel/xe_noexec_ping_pong.c        |  10 +-
 tests/intel/xe_pm.c                      |   2 +-
 tests/intel/xe_query.c                   | 236 ++++++++++++--
 tests/intel/xe_vm.c                      | 208 +------------
 tests/intel/xe_waitfence.c               |  19 +-
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 ----------------------
 35 files changed, 609 insertions(+), 1158 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 delete mode 100644 tools/xe_reg.c

-- 
2.34.1
