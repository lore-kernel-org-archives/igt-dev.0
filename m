Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296FF8969E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 11:56:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 16 Aug 2021 13:56:21 +0200
Message-Id: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Adopt to use allocator
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

This is third series which should decrease coverage gap on 
gens without relocations support.

In gem_exec_fence I've left three subtests intact - they are 
not trivial to rewrite so they will be send in future series.
I decided to send not fully rewritten test because some subtests
are part of BAT run and this should make life easier to enable
DG1 on CI.

I've incidentally omit review comments and didn't address minor
nits so I've added it in this series (gem_exec_capture + gem_exec_big).

In gem_exec_schedule 'pi*' subtests should work properly now. I had
userfault disabled previously so I notice skip on CI, but we want to
have these tests.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Zbigniew Kempczyński (5):
  tests/gem_exec_capture: Remove unnecessary multiprocess stop() call
  tests/gem_exec_big: Move check of pressumed offset out of no-reloc
    scope
  tests/gem_exec_fence: Adopt to use allocator
  tests/gem_exec_schedule: Adopt to use allocator
  HAX: remove gttfill for tgl ci

 tests/i915/gem_exec_big.c             |   3 +-
 tests/i915/gem_exec_capture.c         |   1 -
 tests/i915/gem_exec_fence.c           | 240 +++++++++----
 tests/i915/gem_exec_schedule.c        | 472 ++++++++++++++++++++------
 tests/intel-ci/fast-feedback.testlist |   1 -
 5 files changed, 541 insertions(+), 176 deletions(-)

-- 
2.26.0
