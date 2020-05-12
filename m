Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B906E0CE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 10:44:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 12 May 2020 16:04:09 +0530
Message-Id: <20200512103415.28968-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 0/6] lpsp platform agnostic support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is v8 added Imre's patch to patch list,
as it is dependent on lpsp patch series.
Fixed some review comment provided by ankit.

Anshuman Gupta (5):
  tests/i915_pm_lpsp: Nuke the panel-fitter test
  lib/igt_pm: Add lib func to get lpsp capability
  tests/i915_pm_lpsp: lpsp platform agnostic support
  tests/i915_pm_lpsp: screens-disabled subtest use igt_wait
  tests/i915_pm_rpm: lpsp/non-lpsp screen mode_set_data

Imre Deak (1):
  tests/i915_pm_rpm: Fix the universal-plane cap setting in plane tests

 lib/igt_pm.c              |  29 ++++
 lib/igt_pm.h              |   1 +
 tests/i915/i915_pm_lpsp.c | 317 ++++++++++++++++++--------------------
 tests/i915/i915_pm_rpm.c  |  69 +++++----
 4 files changed, 215 insertions(+), 201 deletions(-)

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
