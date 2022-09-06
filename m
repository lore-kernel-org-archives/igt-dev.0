Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595210E678
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:11:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 18:42:42 +0530
Message-Id: <20220906131245.4757-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] Modify dc9 validation
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

Swati Sharma (3):
  tests/i915/i915_pm_dc: Change debugfs for reading platform info
  lib/pm: Add helper functions to get runtime suspended time
  tests/i915/i915_pm_dc: Modify dc9 test

 lib/igt_pm.c            | 36 +++++++++++++++++++--
 lib/igt_pm.h            |  1 +
 tests/i915/i915_pm_dc.c | 72 +++++++++++++++++++++++++++++------------
 3 files changed, 86 insertions(+), 23 deletions(-)

-- 
2.25.1
