Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF0F10E0A3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 10:58:37 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Aug 2023 10:24:52 +0000
Message-Id: <20230804102454.948216-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] lib/xe_spin: introduced xe_spin_opts;
 fixed duration xe_spin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: mauro.chehab@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduced struct xe_spin_opts for xe_spin initialization,
adjusted tests to new xe_spin_init signature.

Extended spinner with fixed duration capability. It allows
to prepare fixed duration (ex. 10ms) workloads and take workloads/second
measurements, a handy utility for scheduling tests.

Basic test for xe_spin with fixed duration.

Marcin Bernatowicz (2):
  lib/xe_spin: introduced xe_spin_opts; fixed duration xe_spin
  tests/xe_spin_batch: spin-fixed-duration

 lib/xe/xe_spin.c            | 121 ++++++++++++++++++++++++++++++------
 lib/xe/xe_spin.h            |  23 ++++++-
 tests/xe/xe_dma_buf_sync.c  |   6 +-
 tests/xe/xe_exec_balancer.c |   9 ++-
 tests/xe/xe_exec_reset.c    |  24 ++++---
 tests/xe/xe_exec_threads.c  |   7 ++-
 tests/xe/xe_spin_batch.c    |  59 ++++++++++++++++++
 tests/xe/xe_vm.c            |   9 +--
 8 files changed, 213 insertions(+), 45 deletions(-)

-- 
2.30.2
