Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7CA6E96D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 10:31:51 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu,  7 May 2020 15:52:05 +0530
Message-Id: <20200507102210.23599-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 0/5] lpsp platform agnostic support
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

v7 has fixed review comment provided by Animesh
combine the [patch v6 4/6] to [patch v6 3/6].

Anshuman Gupta (5):
  tests/i915_pm_lpsp: Nuke the panel-fitter test
  lib/igt_pm: Add lib func to get lpsp capability
  tests/i915_pm_lpsp: lpsp platform agnostic support
  tests/i915_pm_lpsp: screens-disabled subtest use igt_wait
  tests/i915_pm_rpm: lpsp/non-lpsp screen mode_set_data

 lib/igt_pm.c              |  29 ++++
 lib/igt_pm.h              |   1 +
 tests/i915/i915_pm_lpsp.c | 317 ++++++++++++++++++--------------------
 tests/i915/i915_pm_rpm.c  |  53 ++++---
 4 files changed, 209 insertions(+), 191 deletions(-)

-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
