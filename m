Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1098A10E0D8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:47:16 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 17:12:56 +0000
Message-Id: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/4] lib/xe_spin: introduced fixed
 duration xe_spin
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

Introduced struct xe_spin_opts for xe_spin initialization,
adjusted tests to new xe_spin_init signature.

Extended spinner with fixed duration capability. It allows
to prepare fixed duration (ex. 10ms) workloads and take workloads/second
measurements, a handy utility for scheduling tests.

Basic test for xe_spin with fixed duration.

v2: - added asserts in div64_u64_round_up, duration_to_ctx_ticks,
      simplified loop_addr (Zbyszek)
    - added xe_spin_init_opts macro (Zbyszek)
    - corrected patch title (Kamil)
    - Added assert for expected spinner duration. (Zbyszek)
    A median of 5x100ms spins duration is computed, which should
    satisfy CI runs, although better accuracy is achieved with
    disabled logging (echo 0 > /sys/module/drm/parameters/debug).

v3: - extracted xe_spin_opts to separate patch (Kamil)
    - div64_u64_round_up assert on overflow (Kamil)
    - enum indentation cleanup in xe_spin.c (Kamil)

v4: - checkpatch fixes (Kamil)
    - corrected variables readability in xe_spin_fixed_duration (Zbyszek)

v5: - fixed subject line to describe the change 
      not the tool that found it (Kamil)
    - fixed too long line warning

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (4):
  lib/xe_spin: xe_spin_opts for xe_spin initialization
  lib/xe_spin: fixed duration xe_spin capability
  tests/xe_spin_batch: spin-fixed-duration
  lib/xe_spin.c: fixed code style

 lib/xe/xe_spin.c               | 126 ++++++++++++++++++++++++++++-----
 lib/xe/xe_spin.h               |  27 ++++++-
 tests/intel/xe_dma_buf_sync.c  |   6 +-
 tests/intel/xe_exec_balancer.c |   9 ++-
 tests/intel/xe_exec_reset.c    |  24 ++++---
 tests/intel/xe_exec_threads.c  |   7 +-
 tests/intel/xe_spin_batch.c    |  73 +++++++++++++++++++
 tests/intel/xe_vm.c            |   7 +-
 8 files changed, 234 insertions(+), 45 deletions(-)

-- 
2.30.2
