Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335389D7B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:44:49 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 23 Mar 2020 12:02:43 +0530
Message-Id: <20200323063248.5261-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/5] lpsp platform agnostic support
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

This series adds lpsp igt val platform agnostic support.
This has been a big gap on igt validation side in order to 
validate low power single pipe use cases.

V2 update of this series had fixed CI failures observed with v1.
This should be test with i915 lpsp support, which adds
i915_lpsp_info debugfs.

Anshuman Gupta (5):
  lib/igt_pm: Add lib func to get lpsp capability
  tests/i915_pm_lpsp: lpsp platform agnostic support
  tests/i915_pm_lpsp: Skip panel-fitter subtest for 1024x768 panels
  tests/i915_pm_lpsp: screens-disabled subtest use igt_wait
  tests/i915_pm_rpm: lpsp/non-lpsp screen mode_set_data

 lib/igt_pm.c              |  27 ++++
 lib/igt_pm.h              |   1 +
 tests/i915/i915_pm_lpsp.c | 311 +++++++++++++++++++++++---------------
 tests/i915/i915_pm_rpm.c  |  53 ++++---
 4 files changed, 248 insertions(+), 144 deletions(-)

-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
