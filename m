Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A70B6EB44
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 05:49:52 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu,  9 Apr 2020 11:09:46 +0530
Message-Id: <20200409053951.26929-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 0/5] lpsp platform agnostic support
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
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This series adds lpsp igt val platform agnostic support.
This has been a big gap on igt validation side in order to 
validate low power single pipe use cases.

v5 has the incorporated the changes for debugfs entry i915_lpsp_capability
and i915_lpsp_status.

This should be test with i915 lpsp support, which adds
i915_lpsp_{capability,status} debugfs.

Anshuman Gupta (5):
  tests/i915_pm_lpsp: Nuke the panel-fitter test
  lib/igt_pm: Add lib func to get lpsp capability
  tests/i915_pm_lpsp: lpsp platform agnostic support
  tests/i915_pm_lpsp: screens-disabled subtest use igt_wait
  tests/i915_pm_rpm: lpsp/non-lpsp screen mode_set_data

 lib/igt_pm.c              |  37 +++++
 lib/igt_pm.h              |   1 +
 tests/i915/i915_pm_lpsp.c | 288 +++++++++++++++-----------------------
 tests/i915/i915_pm_rpm.c  |  53 ++++---
 4 files changed, 183 insertions(+), 196 deletions(-)

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
