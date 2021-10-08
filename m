Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677186E0A5
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:54:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  8 Oct 2021 08:54:25 +0200
Message-Id: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Prepare IGTs to allow only zero
 alignment
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

In the future we're planning to allow passing only zero alignment so
this is preparation step to introduce check and disable or fix 
igts which uses this constraint.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Zbigniew Kempczyński (7):
  lib/gem_submission: Add kernel exec object alignment capability
  lib/intel_batchbuffer: Detect and use kernel alignment capability
  tests/gem_exec_alignment: Add prerequisite alignment condition
  tests/gem_evict_alignment: Skip if kernel doesn't support passing
    alignment
  tests/i915_pm_rpm: Fix invalid alignment
  benchmarks/gem_exec_fault: Add timeout argument
  benchmarks/gem_exec_fault: Add softpin mode to support gens with ppgtt

 benchmarks/gem_exec_fault.c      | 71 +++++++++++++++++++++++++++-----
 lib/i915/gem_submission.c        | 32 ++++++++++++++
 lib/i915/gem_submission.h        |  1 +
 lib/intel_batchbuffer.c          |  9 +++-
 lib/intel_batchbuffer.h          |  1 +
 tests/i915/gem_evict_alignment.c |  1 +
 tests/i915/gem_exec_alignment.c  |  1 +
 tests/i915/i915_pm_rpm.c         |  2 +-
 8 files changed, 105 insertions(+), 13 deletions(-)

-- 
2.26.0
