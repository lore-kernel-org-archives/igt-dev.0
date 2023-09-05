Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537810E554
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 14:58:32 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 14:23:26 +0000
Message-Id: <20230905142329.2025130-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230818102156.2335320-1-marcin.bernatowicz@linux.intel.com>
References: <20230818102156.2335320-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] lib/xe_spin: introduced fixed
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

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (3):
  lib/xe_spin: xe_spin_opts for xe_spin initialization
  lib/xe_spin: fixed duration xe_spin capability
  tests/xe_spin_batch: spin-fixed-duration

 lib/xe/xe_spin.c               | 123 ++++++++++++++++++++++++++++-----
 lib/xe/xe_spin.h               |  27 +++++++-
 tests/intel/xe_dma_buf_sync.c  |   6 +-
 tests/intel/xe_exec_balancer.c |   9 ++-
 tests/intel/xe_exec_reset.c    |  24 ++++---
 tests/intel/xe_exec_threads.c  |   7 +-
 tests/intel/xe_spin_batch.c    |  72 +++++++++++++++++++
 tests/intel/xe_vm.c            |   7 +-
 8 files changed, 231 insertions(+), 44 deletions(-)

-- 
2.30.2
