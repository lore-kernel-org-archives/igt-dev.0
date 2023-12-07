Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FA410E7DA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 06:03:32 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 22:03:48 -0800
Message-Id: <20231207060351.438855-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 0/3] Syncs vs async exec/bind uAPI change
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

IGT changes for Xe uAPI changes [1].

A little more cleanup should be done but enough to get all IGTs passing.
Will finish cleanup in another rev or a follow up series.

Matt

[1] https://patchwork.freedesktop.org/series/127472/

Matthew Brost (3):
  xe_vm: Add section to test zero number of VM binds
  xe_exec_basic: Add section to test zero number of BB in exec IOCTL
  drm-uapi/xe: Uniform async vs sync handling

 benchmarks/gem_wsim.c                |  13 ++-
 include/drm-uapi/xe_drm.h            |  70 +++++++++------
 lib/igt_fb.c                         |   2 +-
 lib/intel_batchbuffer.c              |   7 +-
 lib/intel_compute.c                  |   2 +-
 lib/intel_ctx.c                      |   4 +-
 lib/xe/xe_ioctl.c                    |  66 +++++++-------
 lib/xe/xe_ioctl.h                    |  11 +--
 lib/xe/xe_query.c                    |   3 +-
 lib/xe/xe_spin.c                     |   8 +-
 lib/xe/xe_util.c                     |   4 +-
 tests/intel/xe_access_counter.c      |   2 +-
 tests/intel/xe_ccs.c                 |   4 +-
 tests/intel/xe_copy_basic.c          |   2 +-
 tests/intel/xe_create.c              |   6 +-
 tests/intel/xe_dma_buf_sync.c        |   4 +-
 tests/intel/xe_drm_fdinfo.c          |   8 +-
 tests/intel/xe_evict.c               |  37 ++++----
 tests/intel/xe_evict_ccs.c           |   2 +-
 tests/intel/xe_exec_balancer.c       |  19 ++---
 tests/intel/xe_exec_basic.c          | 118 +++++++++++++++++++++++--
 tests/intel/xe_exec_compute_mode.c   |  11 ++-
 tests/intel/xe_exec_fault_mode.c     |   9 +-
 tests/intel/xe_exec_queue_property.c |   2 +-
 tests/intel/xe_exec_reset.c          |  27 +++---
 tests/intel/xe_exec_store.c          |  18 ++--
 tests/intel/xe_exec_threads.c        |  26 +++---
 tests/intel/xe_exercise_blt.c        |   2 +-
 tests/intel/xe_huc_copy.c            |   2 +-
 tests/intel/xe_intel_bb.c            |   2 +-
 tests/intel/xe_noexec_ping_pong.c    |   6 +-
 tests/intel/xe_pat.c                 |   4 +-
 tests/intel/xe_perf_pmu.c            |  12 +--
 tests/intel/xe_pm.c                  |   6 +-
 tests/intel/xe_pm_residency.c        |   4 +-
 tests/intel/xe_spin_batch.c          |   4 +-
 tests/intel/xe_vm.c                  | 123 ++++++++++++++++++++-------
 tests/intel/xe_waitfence.c           |   8 +-
 38 files changed, 412 insertions(+), 246 deletions(-)

-- 
2.34.1
