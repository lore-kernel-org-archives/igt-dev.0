Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0025B10E1D0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 06:55:34 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 23:55:29 -0700
Message-Id: <20230502065536.3223489-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/7] IGT updates for upstreaming prep
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

Main changes:
- Add tests for NULL bindings (VK Sparse)
- Test new GPUVA features (MMAP style binds, avoiding rebinds, doing rebinds)
- Update to VM bind uAPI + error handling flow

KMD series associated with these changes:
https://patchwork.freedesktop.org/series/117156/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

v2: Fix build error, add dma-fences section to xe_exec_compute_mode, add
VM EIO test. EIO test found a small bug in the KMD series that has been
fixed locally.  

Matthew Brost (7):
  xe: Update to latest uAPI
  xe_exec_basic: Add NULL VM bind section
  xe_vm: MMAP style VM binds section
  xe_vm: Add mmap / munmap sections that split large pages
  xe: Update to new VM bind uAPI
  xe_exec_compute_mode: All dma-fences as in-syncs to compute execs
  xe_vm: Add EIO test

 include/drm-uapi/xe_drm.h       | 106 ++---
 lib/intel_batchbuffer.c         |   2 +-
 lib/xe/xe_compute.c             |   2 +-
 lib/xe/xe_ioctl.c               |  37 +-
 lib/xe/xe_ioctl.h               |   6 +-
 lib/xe/xe_query.c               |   2 +-
 tests/xe/xe_create.c            |   2 +-
 tests/xe/xe_evict.c             |  23 +-
 tests/xe/xe_exec_balancer.c     |   6 +-
 tests/xe/xe_exec_basic.c        |  38 +-
 tests/xe/xe_exec_compute_mode.c | 165 +++++++-
 tests/xe/xe_exec_fault_mode.c   |   6 +-
 tests/xe/xe_exec_reset.c        |   8 +-
 tests/xe/xe_exec_threads.c      | 122 ++----
 tests/xe/xe_guc_pc.c            |   2 +-
 tests/xe/xe_huc_copy.c          |   2 +-
 tests/xe/xe_intel_bb.c          |   2 +-
 tests/xe/xe_pm.c                |   2 +-
 tests/xe/xe_vm.c                | 688 +++++++++++++++++++++++---------
 tests/xe/xe_waitfence.c         |  18 +-
 20 files changed, 803 insertions(+), 436 deletions(-)

-- 
2.34.1
