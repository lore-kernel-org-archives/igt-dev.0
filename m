Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0410E82F
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 13:10:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Sep 2022 18:41:53 +0530
Message-Id: <20220902131156.29798-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 0/3] Modify dc9 validation
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

Modify dc9 validation.
Add new constraint to check runtime_suspended_time.

Swati Sharma (3):
  tests/i915/i915_pm_dc: Change debugfs for reading platform info
  lib/pm: Add helper functions to get runtime suspended time
  tests/i915/i915_pm_dc: Modify dc9 test

 lib/igt_pm.c            | 36 +++++++++++++++++++++++++--
 lib/igt_pm.h            |  1 +
 tests/i915/i915_pm_dc.c | 54 ++++++++++++++++++++++++++++++-----------
 3 files changed, 75 insertions(+), 16 deletions(-)

-- 
2.25.1
