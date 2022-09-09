Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553A10E03F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 11:47:52 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:19:06 +0530
Message-Id: <20220909114911.1852-1-swati2.sharma@intel.com>
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
 3 files changed, 82 insertions(+), 29 deletions(-)

-- 
2.25.1
