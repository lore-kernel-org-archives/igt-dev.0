Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945A810E639
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 11:39:51 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 11:39:34 +0000
Message-Id: <20230831113936.4075130-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] IGT XE documentation cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Let's add missing documentation fileds that are causing warnings.
Some tests documentation needed changes to have more accurate naming.
Let's mark Negative and Stress tests.
Adding missing 'Run type' and 'Test category' for remaining test.


Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Katarzyna Dec (2):
  tests/xe: Add missing documentation fields for tests
  test/xe: Clean up of test documentation

 tests/core_hotunplug.c          |   1 +
 tests/xe/xe_ccs.c               |   7 +-
 tests/xe/xe_create.c            |   8 +-
 tests/xe/xe_debugfs.c           |   2 +-
 tests/xe/xe_dma_buf_sync.c      |   5 +-
 tests/xe/xe_evict.c             | 154 +++++++++++++++++++++++++-------
 tests/xe/xe_exec_balancer.c     |  11 +++
 tests/xe/xe_exec_basic.c        |   7 +-
 tests/xe/xe_exec_compute_mode.c |   5 +-
 tests/xe/xe_exec_fault_mode.c   |   9 +-
 tests/xe/xe_exercise_blt.c      |   6 +-
 tests/xe/xe_intel_bb.c          |   2 +-
 tests/xe/xe_media_fill.c        |   1 +
 tests/xe/xe_mmap.c              |   8 +-
 tests/xe/xe_mmio.c              |   3 +-
 tests/xe/xe_noexec_ping_pong.c  |  25 ++++--
 tests/xe/xe_pm.c                |   1 +
 tests/xe/xe_query.c             |  14 ++-
 tests/xe/xe_spin_batch.c        |   2 +-
 tests/xe/xe_sysfs_scheduler.c   |   5 +-
 tests/xe/xe_sysfs_tile.c        |   3 +
 tests/xe/xe_uevent.c            |   3 +
 tests/xe/xe_vm.c                |  25 +++++-
 23 files changed, 245 insertions(+), 62 deletions(-)

-- 
2.34.1
