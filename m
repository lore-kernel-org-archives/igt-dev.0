Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59F10E5BD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 01:20:48 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:20:58 -0700
Message-Id: <20230915012101.2221203-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/3] IGT update for removing async bind worker
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

IGT updates for the following KMD series [1].

[1] https://patchwork.freedesktop.org/series/123729/

Matthew Brost (3):
  xe: Update to new VM bind uAPI
  xe_vm: Add section to test zero number of VM binds
  xe_exec_basic: Add section to test zero number of BB in exec IOCTL

 include/drm-uapi/xe_drm.h          |  98 ++---------
 lib/igt_fb.c                       |   2 +-
 lib/intel_batchbuffer.c            |   2 +-
 lib/intel_compute.c                |   2 +-
 lib/xe/xe_ioctl.c                  |  36 ++--
 lib/xe/xe_ioctl.h                  |   5 +-
 lib/xe/xe_query.c                  |   2 +-
 tests/intel/xe_ccs.c               |   4 +-
 tests/intel/xe_create.c            |   6 +-
 tests/intel/xe_evict.c             |  23 +--
 tests/intel/xe_exec_balancer.c     |   6 +-
 tests/intel/xe_exec_basic.c        | 113 ++++++++++++-
 tests/intel/xe_exec_compute_mode.c |   6 +-
 tests/intel/xe_exec_fault_mode.c   |   6 +-
 tests/intel/xe_exec_reset.c        |   8 +-
 tests/intel/xe_exec_store.c        |   4 +-
 tests/intel/xe_exec_threads.c      | 126 +++-----------
 tests/intel/xe_exercise_blt.c      |   2 +-
 tests/intel/xe_guc_pc.c            |   2 +-
 tests/intel/xe_huc_copy.c          |   2 +-
 tests/intel/xe_intel_bb.c          |   2 +-
 tests/intel/xe_pm.c                |   2 +-
 tests/intel/xe_vm.c                | 262 ++++++++---------------------
 tests/intel/xe_waitfence.c         |  19 +--
 24 files changed, 297 insertions(+), 443 deletions(-)

-- 
2.34.1
