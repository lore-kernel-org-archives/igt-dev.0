Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E086E0D7
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 13:32:36 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue,  5 May 2020 18:50:26 +0530
Message-Id: <20200505132032.827-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/6] lpsp platform agnostic support
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
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This series adds lpsp igt val platform agnostic support.

v6 has fixed the few review comment provided by Animesh
by adding a new patch in patchset.

Anshuman Gupta (6):
  tests/i915_pm_lpsp: Nuke the panel-fitter test
  lib/igt_pm: Add lib func to get lpsp capability
  tests/i915_pm_lpsp: lpsp platform agnostic support
  test/i915_pm_lpsp: Skip screens-disabled test for DC state platforms
  tests/i915_pm_lpsp: screens-disabled subtest use igt_wait
  tests/i915_pm_rpm: lpsp/non-lpsp screen mode_set_data

 lib/igt_pm.c              |  29 ++++
 lib/igt_pm.h              |   1 +
 tests/i915/i915_pm_lpsp.c | 308 +++++++++++++++++---------------------
 tests/i915/i915_pm_rpm.c  |  53 ++++---
 4 files changed, 198 insertions(+), 193 deletions(-)

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
