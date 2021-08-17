Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A77898CE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 06:31:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Aug 2021 08:31:13 +0200
Message-Id: <20210817063118.9277-1-zbigniew.kempczynski@intel.com>
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
List-ID: <igt-dev@lists.freedesktop.org>

Apart of gem_exec_fence series is ready to merge. Let CI exercise
this and all apart of gem_exec_fence will land.

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
 tests/i915/gem_exec_schedule.c        | 490 ++++++++++++++++++++------
 tests/intel-ci/fast-feedback.testlist |   1 -
 5 files changed, 559 insertions(+), 176 deletions(-)

-- 
2.26.0
