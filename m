Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407510E6A8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 16:25:07 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 15:51:00 +0000
Message-Id: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] [RFC] benchmarks/gem_wsim: added basic
 xe support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added basic xe support with few examples.
Single binary handles both i915 and Xe devices,
but workload definitions differs between i915 and xe.
Xe does not use context abstraction, introduces new VM and Exec Queue
steps and BATCH step references exec queue.
For more details see wsim/README.
Some functionality is still missing: working sets,
load balancing (need some input if/how to do it in Xe - exec queues
width?).

The tool is handy for scheduling tests, we find it useful to verify vGPU
profiles defining different execution quantum/preemption timeout settings.

There is also some rationale for the tool in following thread:
https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/

With this patch it should be possible to run following on xe device:

gem_wsim -w benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim -c 36 -r 600

Best with drm debug logs disabled:

echo 0 > /sys/module/drm/parameters/debug

lib/xe_spin: fixed duration xe_spin capability - is already 
  under review https://patchwork.freedesktop.org/series/122624/

v2:
- splitted patches to easy review (Kamil), 
  all benchmarks/gem_wsim patches before [RFC] one
  contain fixes (for scale duration option), cleanups (checkpatch.pl),
  refactors (some code moved to functions),
  not related to xe and ready to be applied
- lib/xe_spin is under review in other thread https://patchwork.freedesktop.org/series/122624/

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (8):
  lib/xe_spin: xe_spin_opts for xe_spin initialization
  lib/xe_spin: fixed duration xe_spin capability
  lib/igt_device_scan: Xe get integrated/discrete card functions
  benchmarks/gem_wsim: scale duration option fixes
  benchmarks/gem_wsim: cleanups
  benchmarks/gem_wsim: allow comments in workload description files
  benchmarks/gem_wsim: extract prepare_ctxs function, add w_sync
  [RFC] benchmarks/gem_wsim: added basic xe support

 benchmarks/gem_wsim.c                         | 875 ++++++++++++++----
 benchmarks/wsim/README                        |  87 +-
 benchmarks/wsim/xe_cloud-gaming-60fps.wsim    |  25 +
 benchmarks/wsim/xe_example.wsim               |  28 +
 benchmarks/wsim/xe_example01.wsim             |  19 +
 benchmarks/wsim/xe_example_fence.wsim         |  23 +
 .../wsim/xe_media_load_balance_fhd26u7.wsim   |  63 ++
 lib/igt_device_scan.c                         |  34 +-
 lib/igt_device_scan.h                         |   2 +
 lib/xe/xe_spin.c                              | 123 ++-
 lib/xe/xe_spin.h                              |  27 +-
 tests/intel/xe_dma_buf_sync.c                 |   6 +-
 tests/intel/xe_exec_balancer.c                |   9 +-
 tests/intel/xe_exec_reset.c                   |  24 +-
 tests/intel/xe_exec_threads.c                 |   7 +-
 tests/intel/xe_vm.c                           |   7 +-
 16 files changed, 1114 insertions(+), 245 deletions(-)
 create mode 100644 benchmarks/wsim/xe_cloud-gaming-60fps.wsim
 create mode 100644 benchmarks/wsim/xe_example.wsim
 create mode 100644 benchmarks/wsim/xe_example01.wsim
 create mode 100644 benchmarks/wsim/xe_example_fence.wsim
 create mode 100644 benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim

-- 
2.30.2
