Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05410E268
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 06:36:07 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 12:10:42 +0530
Message-Id: <1668408044-618-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 0/2] Add new subtest and test cleanup
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
