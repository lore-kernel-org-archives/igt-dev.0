Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905D810E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 01:21:40 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:21:32 -0700
Message-Id: <20230727012136.456190-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] Add tests for upcoming uAPI / IOCTL behavior
 changes
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

The uAPI is going to change slightly wrt sync vs async VM binds, how
error handling is done, and exec / bind IOCTLs will accept zero
operations as valid.

Change the IGTs to support new behavior + add a few more tests.

Matthew Brost (4):
  xe: Update to new VM bind uAPI
  xe_vm: Add section to test zero number of VM binds
  xe_exec_basic: Add section to test zero number of BB in exec IOCTL
  xe_vm: Add EIO test

 include/drm-uapi/xe_drm.h       |  94 +------
 lib/intel_batchbuffer.c         |   2 +-
 lib/xe/xe_compute.c             |   2 +-
 lib/xe/xe_ioctl.c               |  58 ++++-
 lib/xe/xe_ioctl.h               |   8 +-
 lib/xe/xe_query.c               |   2 +-
 tests/xe/xe_ccs.c               |   4 +-
 tests/xe/xe_create.c            |   6 +-
 tests/xe/xe_evict.c             |  23 +-
 tests/xe/xe_exec_balancer.c     |   6 +-
 tests/xe/xe_exec_basic.c        | 112 ++++++++-
 tests/xe/xe_exec_compute_mode.c |   6 +-
 tests/xe/xe_exec_fault_mode.c   |   6 +-
 tests/xe/xe_exec_reset.c        |   8 +-
 tests/xe/xe_exec_store.c        |   4 +-
 tests/xe/xe_exec_threads.c      | 122 +++------
 tests/xe/xe_exercise_blt.c      |   2 +-
 tests/xe/xe_guc_pc.c            |   2 +-
 tests/xe/xe_huc_copy.c          |   2 +-
 tests/xe/xe_intel_bb.c          |   2 +-
 tests/xe/xe_pm.c                |   2 +-
 tests/xe/xe_vm.c                | 426 +++++++++++++++++++++-----------
 tests/xe/xe_waitfence.c         |  19 +-
 23 files changed, 543 insertions(+), 375 deletions(-)

-- 
2.34.1
