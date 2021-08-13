Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816F36E54C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:46:54 +0200
Message-Id: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/9] Adopt to use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is second series which should decrease coverage gap on 
gens without relocations support.

In gem_exec_fence I've left three subtests intact - they are 
not trivial to rewrite so they will be send in future series.
I decided to send not fully rewritten test because some subtests
are part of BAT run and this should make life easier to enable
DG1 on CI.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Andrzej Turko (2):
  lib/intel_allocator: Fix argument names in declarations
  tests/gem_exec_capture: Support gens without relocations

Zbigniew Kempczyński (7):
  tests/gem_ctx_persistence: Adopt to use allocator
  tests/gem_exec_balancer: Adopt to use allocator
  tests/gem_exec_big: Skip relocation part
  tests/gem_exec_fence: Adopt to use allocator
  tests/gem_exec_flush: Adopt to no-reloc
  tests/gem_exec_schedule: Adopt to use allocator
  HAX: remove gttfill for tgl ci

 lib/intel_allocator.h                 |   8 +-
 tests/i915/gem_ctx_persistence.c      | 120 +++++--
 tests/i915/gem_exec_balancer.c        | 132 ++++++--
 tests/i915/gem_exec_big.c             |  21 +-
 tests/i915/gem_exec_capture.c         |  98 ++++--
 tests/i915/gem_exec_fence.c           | 240 +++++++++----
 tests/i915/gem_exec_flush.c           |  24 +-
 tests/i915/gem_exec_schedule.c        | 463 ++++++++++++++++++++------
 tests/intel-ci/fast-feedback.testlist |   1 -
 9 files changed, 842 insertions(+), 265 deletions(-)

-- 
2.26.0
