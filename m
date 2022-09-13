Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF58210E683
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 09:33:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 15:04:41 +0530
Message-Id: <20220913093446.27842-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/5] Modify dc9 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

dc9 test case is modified.
Added new constraint to check runtime_suspended_time for dc9.

Swati Sharma (5):
  tests/i915/i915_pm_dc: Add test description
  tests/i915/i915_pm_dc: Change debugfs for reading platform info
  lib/pm: Add helper functions to get runtime suspended time
  tests/i915/i915_pm_dc: Modify dc9 test
  tests/i915/i915_pm_dc: Sleep not reqd. to reset counter

 lib/igt_pm.c            | 32 +++++++++++++++++
 lib/igt_pm.h            |  1 +
 tests/i915/i915_pm_dc.c | 78 ++++++++++++++++++++++++++---------------
 3 files changed, 83 insertions(+), 28 deletions(-)

-- 
2.25.1
