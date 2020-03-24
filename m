Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B86E487
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 13:17:30 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 24 Mar 2020 18:36:25 +0530
Message-Id: <20200324130630.9388-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/5] lpsp platform agnostic support
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

v3 udate has fixed some review comment.
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
 tests/i915/i915_pm_lpsp.c | 286 ++++++++++++++++++++++----------------
 tests/i915/i915_pm_rpm.c  |  53 ++++---
 4 files changed, 221 insertions(+), 146 deletions(-)

-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
