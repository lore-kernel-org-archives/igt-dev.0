Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:43 -0400
Message-ID: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/16] uAPI Alignment - take 1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

Francois Dugast (2):
  drm-uapi/xe_drm: Separate VM_BIND's operation and flag, align with
    latest uapi
  drm-uapi/xe_drm: Remove MMIO ioctl and align with latest uapi

Matthew Brost (3):
  xe_exec_balancer: Enable parallel submission and compute mode
  xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a
    compute VM
  xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE

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

 include/drm-uapi/xe_drm.h                | 360 +++++++++++++---------
 lib/intel_batchbuffer.c                  |  11 +-
 lib/xe/xe_ioctl.c                        |  31 +-
 lib/xe/xe_ioctl.h                        |   6 +-
 lib/xe/xe_query.c                        |  73 +++--
 lib/xe/xe_query.h                        |  11 +-
 lib/xe/xe_spin.c                         |  11 +-
 lib/xe/xe_util.c                         |   9 +-
 tests/intel-ci/xe-fast-feedback.testlist |   4 +-
 tests/intel/xe_evict.c                   |  14 +-
 tests/intel/xe_exec_balancer.c           |  29 +-
 tests/intel/xe_exec_basic.c              |   2 +-
 tests/intel/xe_exec_compute_mode.c       |  20 +-
 tests/intel/xe_exec_reset.c              |  18 +-
 tests/intel/xe_exec_threads.c            |  35 +--
 tests/intel/xe_mmio.c                    |  91 ------
 tests/intel/xe_noexec_ping_pong.c        |  10 +-
 tests/intel/xe_query.c                   | 226 ++++++++++++--
 tests/intel/xe_vm.c                      |  29 +-
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 -----------------------
 22 files changed, 566 insertions(+), 792 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 delete mode 100644 tools/xe_reg.c

-- 
2.41.0
