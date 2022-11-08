Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D666C10E046
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 12:58:44 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 18:33:01 +0530
Message-Id: <1667912583-27297-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 0/2] tests/i915/i915_pm_backlight: Add new subtest
 and test cleanup
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

Add new subtest to validate dual panel backlight and convert
exixting subtests to dynamic subtests for better reporting.

Nidhi Gupta (2):
  tests/i915/i915_pm_backlight: Add new subtest to validate dual panel
    backlight
  tests/i915/i915_pm_backlight: Create dynamic subtests

 tests/i915/i915_pm_backlight.c | 223 +++++++++++++++++++++++++++++------------
 1 file changed, 157 insertions(+), 66 deletions(-)

-- 
1.9.1
