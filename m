Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3D810E105
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 16:50:39 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:48:27 +0200
Message-ID: <20230905165033.187749-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 0/3] Xe: set Run type from testlist instead of
 defining it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Right now, we're keeping testlists both at documentation and on
separate testlist files. That makes harder to maintain. It also
requires splitting wildcards on multiple fields just due to that.

In the end, only the testlist files are updated.

So, simplify the maintainance by reading the testlists and parsing
them directly.

This will also handle tests that are blacklisted for all platforms.

Mauro Carvalho Chehab (3):
  xe_test_config.json: add testlists and blacklists
  tests/intel/xe*.c: drop Run type field
  test_list.py: add support for reading testlist regular expressions

 scripts/test_list.py               | 70 ++++++++++++++++++++++++++++++
 tests/intel/xe_ccs.c               |  1 -
 tests/intel/xe_compute.c           |  1 -
 tests/intel/xe_create.c            |  2 -
 tests/intel/xe_debugfs.c           |  1 -
 tests/intel/xe_dma_buf_sync.c      |  4 --
 tests/intel/xe_evict.c             |  1 -
 tests/intel/xe_exec_balancer.c     | 11 -----
 tests/intel/xe_exec_basic.c        |  6 ---
 tests/intel/xe_exec_compute_mode.c |  4 --
 tests/intel/xe_exec_fault_mode.c   |  8 ----
 tests/intel/xe_exec_reset.c        | 23 ----------
 tests/intel/xe_exec_store.c        |  2 -
 tests/intel/xe_exec_threads.c      |  2 -
 tests/intel/xe_exercise_blt.c      |  1 -
 tests/intel/xe_gpgpu_fill.c        |  1 -
 tests/intel/xe_guc_pc.c            |  9 ----
 tests/intel/xe_huc_copy.c          |  1 -
 tests/intel/xe_intel_bb.c          | 13 ------
 tests/intel/xe_live_ktest.c        |  1 -
 tests/intel/xe_media_fill.c        |  1 -
 tests/intel/xe_mmap.c              |  1 -
 tests/intel/xe_mmio.c              |  1 -
 tests/intel/xe_module_load.c       |  6 ---
 tests/intel/xe_noexec_ping_pong.c  |  1 -
 tests/intel/xe_pm.c                |  2 -
 tests/intel/xe_pm_residency.c      |  3 --
 tests/intel/xe_prime_self_import.c |  8 ----
 tests/intel/xe_query.c             |  1 -
 tests/intel/xe_spin_batch.c        |  4 --
 tests/intel/xe_sysfs_defaults.c    |  1 -
 tests/intel/xe_sysfs_scheduler.c   |  1 -
 tests/intel/xe_test_config.json    |  7 +++
 tests/intel/xe_vm.c                | 23 ----------
 tests/intel/xe_waitfence.c         |  1 -
 35 files changed, 77 insertions(+), 146 deletions(-)

-- 
2.41.0
